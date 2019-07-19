<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use Request;
use App\Http\Requests\RegistrationRequest;
use App\Http\Requests\TeamRequest;
use App\Http\Requests\CommandRequest;
use App\Confirmation;
use App\User;
use App\Rejection;
use App\Team;
use App\TeamMember;
use App\Event;
use Illuminate\Support\Facades\Input;
use App\Traits\Utilities;
use App\Config;
use App\Department;
use App\Section;
use App\Year;
use App\Vote;
use App\new_user;
use Excel;
use DB;

class AdminPagesController extends Controller
{
    use Utilities;

    function root(){
        $registered_count = User::where('type', 'student')->count();
       // $present_count = User::where('type', 'student')->where('present', true)->count();        
        $confirmed_registrations = 0;
        $users = User::all()->where('type', 'student')->where('activated', true); 
        foreach($users as $user){
            if($user->isConfirmed()){
                $confirmed_registrations++;
            }
        }

  
        return view('pages.admin.root')->with('registered_count', $registered_count)->with('confirmed_registrations', $confirmed_registrations);
    }
    function register($user_id){
        $event_id = Input::get('event_id', false);
        if($event_id){
            $event = Event::find($event_id);
            $user = User::find($user_id);
            $user->events()->save($event);
        }
        return redirect()->route('admin::registrations.edit', ['user_id' => $user->id]);
    }
    function editPrizeList(){
        $events = Event::all();
        return view('pages.admin.prize_list')->with('events', $events);
    }
    function updatePrizeList(Request $request){
        $inputs = Request::all();
        if(!isset($inputs['prize-list'])){
            $inputs['prize-list'] = [];
        }
        $events = Event::all()->whereIn('id', $inputs['prize-list']);
        foreach($events as $event){
            $event->show_prize = true;
            $event->update();
        }
        $events = Event::all()->whereNotIn('id', $inputs['prize-list']);        
        foreach($events as $event){
            if($event->show_prize){
                $event->show_prize = false;              
                $event->update();               
            }
        }
        Session::flash('success', 'The prize list was updated');
        return redirect()->route('admin::prizes.list');
    }
    function userPresent($user_id){
        $user = User::findOrFail($user_id);
        $user->present = true;
        if($user->update()){
            return response()->json(['error' => false]);                            
        }
        else{
            return response()->json(['error' => true]);                            
        }
    }
    function userAbsent($user_id){
        $user = User::findOrFail($user_id);
        $user->present = false;
        if($user->update()){
            return response()->json(['error' => false]);                            
        }
        else{
            return response()->json(['error' => true]);                            
        }
    }
    function unregister($user_id, $event_id){
        $event = Event::find($event_id);
        $user = User::find($user_id);
        $event->users()->detach($user->id);        
        return  redirect()->route('admin::registrations.edit', ['user_id' => $user_id]);
    }
    function registerTeam($user_id, \Illuminate\Http\Request $request){
        $inputs = Request::all();
        $event = Event::findOrFail($inputs['event_id']);        
        $this->validate($request, [
            'event_id' => 'required',
            'name' => 'required',
            'team_members' => 'required|teamMembersExist|teamMembersCount:' . $event->id
        ]);
        $user = User::findOrFail($user_id);
        $team  = new Team();
        $team->name = $inputs['name'];
        $team->user_id = $user->id;
        $team->save();
        $team_members_emails = explode(',', $inputs['team_members']);
        $team_members_users = User::all()->whereIn('email', $team_members_emails);
        foreach($team_members_users as $team_member_user){
            $team_member = new TeamMember();
            $team_member->team_id = $team->id;
            $team_member->user_id = $team_member_user->id;
            $team->teamMembers()->save($team_member);
        }
        $team->events()->save($event);
        return redirect()->route('admin::registrations.edit', ['user_id' => $user->id]);
    }
    function unregisterTeam($user_id, $event_id){
        $user = User::find($user_id);
        $team = $user->teamLeaderFor($event_id);
        $event  = Event::find($event_id);                         
        $event->teams()->detach($team->id);
        $team->teamMembers()->delete();
        Team::destroy($team->id);
        return  redirect()->route('admin::registrations.edit', ['user_id' => $user->id]);
    }
    function editTeam($id){
        $team = Team::find($id);
        return view('pages.admin.edit_team')->with('team', $team);
    }
    function updateTeam(\Illuminate\Http\Request $request, $id){
        $team  = Team::findOrFail($id);        
        $this->validate($request, [
            'name' => 'required',
            'team_members' => 'required|teamMembersExist|teamMembersCount:' . $team->events->first()->id
        ]);
        $inputs = Request::all();
        $team->teamMembers()->delete();
        $team_members_emails = explode(',', $inputs['team_members']);
        $team_members_users = User::all()->whereIn('email', $team_members_emails);
        foreach($team_members_users as $team_member_user){
            $team_member = new TeamMember();
            $team_member->team_id = $team->id;
            $team_member->user_id = $team_member_user->id;
            $team->teamMembers()->save($team_member);
        } 
        return redirect()->route('admin::registrations.edit', ['user_id' => $team->user->id]); 
    }
    function getAdmins(){
        $adminEmails = User::where('type', 'admin')->get(['email']);
        return response()->json($adminEmails);
    }
    function openRegistrations(){
        Config::setConfig('registration_open', true);
        return redirect()->route('admin::root');
    }
    function closeRegistrations(){
        Config::setConfig('registration_open', false);
        return redirect()->route('admin::root');
    }
    function enableOfflineRegistration(){
        Config::setConfig('offline_link', true);
        return redirect()->route('admin::root');
    }
    function disableOfflineRegistration(){
        Config::setConfig('offline_link', false);
        return redirect()->route('admin::root');
    }
    function new_registration(){
        return view('pages.admin.new_registration');
    }
    function create_registration(RegistrationRequest $request){
        $inputs = Request::all();
        $user = User::create([
            'roll_no'=>$inputs['roll_no'],
            'full_name' => $inputs['full_name'],
            'email' => $inputs['email'],
            'password' => bcrypt('test'),
            'gender' => $inputs['gender'],
            'department_id' => $inputs['department_id'],
            'section_id' => $inputs['section_id'],
            'year_id' => $inputs['year_id'],
            'type' => 'student',
        ]);
        Session::flash('success', 'The user was registered');
        return redirect()->route('admin::registrations.create');
    }
    function registrations(){
        $search = Input::get('search', '');
        $search = $search . '%';
        $user_ids = User::search($search)->pluck('id')->toArray();
        $registrations = User::whereIn('id', $user_ids)->where('type','student');
        $registrations_count = $registrations->count();
        $registrations = $registrations->paginate(10);
        return view('pages.admin.registrations')->with('registrations', $registrations)->with('registrations_count', $registrations_count);
    }
    function editRegistration($user_id){
        $user = User::findOrFail($user_id);
        $team = new Team();
        $soloEvents = Event::where('max_members', 1)->pluck('title', 'id')->toArray();
        $teamEvents = Event::where('max_members', '>', 1)->pluck('title', 'id')->toArray();        
        return view('pages.admin.edit_registration', ['registration' => $user])->with('soloEvents', $soloEvents)->with('teamEvents', $teamEvents)->with('team', $team);
    }
    function updateRegistration($user_id, RegistrationRequest $request){
        $user = User::findOrFail($user_id);
        $inputs = Request::all();
        $user->full_name = $inputs['full_name'];
        $user->roll_no = $inputs['roll_no'];
        $user->email = $inputs['email'];
        $user->gender = $inputs['gender'];
        $user->department_id=$inputs['department_id'];
        $user->section_id=$inputs['section_id'];
        $user->year_id=$inputs['year_id'];
        $user->update();
        Session::flash('success', 'The user was updated!');
        return redirect()->route('admin::registrations.edit', $user_id);
    }
    function eventRegistrations($event_id){
        $event = Event::findOrFail($event_id);
        $search = Input::get('search', '');
        $search = $search . '%';
        $user_ids = User::search($search)->pluck('id')->toArray();
        if($event->isGroupEvent()){
            $registered_user_ids = $event->teams()->whereIn('user_id', $user_ids)->pluck('user_id')->toArray();
        }
        else{
            $registered_user_ids = $event->users()->whereIn('id', $user_ids)->pluck('id')->toArray();
        }
        $registrations = User::all()->whereIn('id', $registered_user_ids);
        $registrations_count = $registrations->count();        
        // Paginate registrations
        $page = Input::get('page', 1);
        $per_page = 10;
        $registrations = $this->paginate($page, $per_page, $registrations);
        return view('pages.admin.registrations')->with('registrations', $registrations)->with('registrations_count', $registrations_count);
    }
    
    function confirmRegistration($user_id){
        $user = User::findOrFail($user_id);
        if($user->hasConfirmed()){
            Session('success', 'User has already confirmed the registration');                      
        }
        else{
            $confirmation = new Confirmation();
            $user->confirmation()->save($confirmation);
        }
        return redirect()->route('admin::registrations.edit', ['user_id' => $user_id]);
    }
    function unconfirmRegistration($user_id){
        $user = User::findOrFail($user_id);
        if($user->hasConfirmed()){
            $user->confirmation()->delete();
        }
        else{
            Session('success', 'User has not confirmed the registration');          
        }
        return redirect()->route('admin::registrations.edit', ['user_id' => $user_id]);
    }
    function reports(){
        if(!Auth::user()->hasRole('root') && !Auth::user()->hasRole('hospitality') && !Auth::user()->organizings->count() == 0){
            return redirect()->route('admin::root');
        }
        if(Auth::user()->hasRole('root')){
            $departments = ['all' => 'All'];
            $years = ['all' => 'All'];
            $events = ['all' => 'All'];        
            $events += Event::pluck('title', 'id')->toArray();                    
        }else{
            $departments = [];
            $years = [];
            $events = [];
            $events = Auth::user()->organizings->pluck('title', 'id')->toArray();        
        }
        $departments += Department::pluck('name', 'id')->toArray();
        $years += Year::pluck('name', 'id')->toArray();
        return view('pages.admin.reports')->with('departments', $departments)->with('years', $years)->with('events', $events);
    }
    function reportRegistrations(Request $request){
        $inputs = Request::all();
        $event_id = $inputs['event_id'];
        $department_id = $inputs['department_id'];
        $year_id = $inputs['year_id'];
        $gender = $inputs['gender'];
        // Get the registered users in the given event
        if($event_id == "all"){
            $users = User::all()->where('type', 'student');
        }
        else{
            if(!Auth::user()->isOrganizing($event_id) && !Auth::user()->hasRole('root')){
                Session::flash('success', 'You dont have rights to view this report!');
                return redirect()->route('admin::root');
            }
            $event = Event::findOrFail($event_id);
            if($event->isGroupEvent()){
                $user_ids = [];
                foreach($event->teams as $team){
                    array_push($user_ids, $team->user_id);
                    foreach($team->teamMembers as $teamMember){
                        array_push($user_ids, $teamMember->user->id);
                    }
                }
                $users = User::all()->whereIn('id', $user_ids);
            }
            else{
                $users = $event->users;
            }
        }

        if($gender != "all"){
            $users = $users->where('gender', $gender);
        }
        if($department_id != "all"){
            $users = $users->where('department_id', $department_id);
        }
        if($year_id != "all"){
            $users = $users->where('year_id', $year_id);
        }
        if($inputs['report_type'] == 'View Report'){
            $users_count = $users->count();
            $page = Input::get('page', 1);
            $per_page = 10;
            $users = $this->paginate($page, $per_page, $users);
            return view('pages.admin.report_registrations')->with('users', $users)->with('users_count', $users_count);            
        }
        else if($inputs['report_type'] == 'Download Excel'){
            $usersArray = [];
            foreach($users as $user){
                $userArray['F19 ID'] = $user->id;                
                $userArray['Roll_No'] =$user->roll_no;
                $userArray['Full_Name'] = $user->full_name;
                $userArray['Email'] = $user->email;
                $userArray['Department'] = $user->department->name;
                $userArray['Year'] = $user->year->name;
                $userArray['Section'] = $user->section->name;                
                $userArray['Gender'] = $user->gender;                
                array_push($usersArray, $userArray);
            }
            Excel::create('report', function($excel) use($usersArray){
                $excel->sheet('Sheet1', function($sheet) use($usersArray){
                    $sheet->fromArray($usersArray);
                });
            })->download('xlsx');
        }
    }
   
    function allRequests(){
        $search = Input::get('search', '');
        $search = $search . '%';
        $user_ids = User::search($search)->pluck('id')->toArray();
        $requests = Confirmation::all()->where('file_name', '<>',  null)->whereIn('user_id', $user_ids)->filter(function($confirmation){
            return $confirmation->user->needApproval();
        });
        $requests_count = $requests->count();
        $page = Input::get('page', 1);
        $per_page = 10;
        $requests = $this->paginate($page, $per_page, $requests);
        return view('pages.admin.requests')->with('requests', $requests)->with('requests_count', $requests_count);
    }
    function requests(){
        $search = Input::get('search', '');
        $search = $search . '%';
        $user_ids = User::search($search)->pluck('id')->toArray();
        $requests = Confirmation::all()->where('status', null)->where('file_name', '<>',  null)->whereIn('user_id', $user_ids)->filter(function($confirmation){
            return $confirmation->user->needApproval();
        });
        $requests_count = $requests->count();        
        $page = Input::get('page', 1);
        $per_page = 10;
        $requests = $this->paginate($page, $per_page, $requests);
        return view('pages.admin.requests')->with('requests', $requests)->with('requests_count', $requests_count);
    }
    function eventRequests($event_id){
        $event = Event::findOrFail($event_id);
        $search = Input::get('search', '');
        $search = $search . '%';
        $user_ids = User::search($search)->pluck('id')->toArray();
        if($event->isGroupEvent()){
            $registered_user_ids = $event->teams()->whereIn('user_id', $user_ids)->pluck('user_id')->toArray();
        }
        else{
            $registered_user_ids = $event->users()->whereIn('id', $user_ids)->pluck('id')->toArray();
        }
        $requests = Confirmation::all()->where('status', null)->where('file_name', '<>',  null)->whereIn('user_id', $registered_user_ids)->filter(function($confirmation){
            return $confirmation->user->needApproval();
        });
        $requests_count = $requests->count();                
        $page = Input::get('page', 1);
        $per_page = 10;
        $requests = $this->paginate($page, $per_page, $requests);
        return view('pages.admin.requests')->with('requests', $requests)->with('requests_count', $requests_count);
    }
    function replyRequest(Request $request){
        $inputs = Request::all();
        $user_id = $inputs['user_id'];
        $user = User::find($user_id);
        if($inputs['submit'] == 'Accept'){
            $user->confirmation->status = 'ack';
        }
        else if($inputs['submit'] == 'Reject'){
            $user->confirmation->status = 'nack';
            $user->confirmation->message = $inputs['message'];
        }
        $user->confirmation->save();
        return redirect()->back();
    }
    function terminal(){
        return view('pages.admin.terminal');
    }
    function executeCommand(CommandRequest $request){
        $inputs = $request->all();
        $output = [];
        exec($inputs['command'], $output);
        return view('pages.admin.terminal')->with('output', implode("<br>", $output));
    }
    function vote()
    {
        return view('pages.admin.votes');
    }
    function votes(Request $request)
    {
        $inputs = Request::all();
        $votes = new Vote();
        $votes->roll_no=$inputs['roll_no'];
        $votes->photo_id=$inputs['photo_id'];
        try{
            if($votes->save())
        {
            Session::flash('success', 'The Vote has been done!'); 
        }
        else
        {
            Session::flash('success', 'The Vote has not been done!'); 
        }
    }
    catch(\Illuminate\Database\QueryException $ex){
        Session::flash('success','This Roll No Already Exists'); 
    }

        return view('pages.admin.votes');
    }
    function vote_result()
    {
        $votes=Vote::all();
        $votes=$votes->groupBy('photo_id');
        return view('pages.admin.vote_result')->with('votes',$votes);
    }
    function original_users(){
        $search = Input::get('search', '');
        $search = $search . '%';
        $result=DB::select('select * from new_users where roll_no LIKE :search', ['search' => $search]);
        if(!$result)
            $result=DB::select('select * from new_users where full_name LIKE :search', ['search' => $search]);
        //$result_count=$result->count();
        return view('pages.admin.original_users')->with('users',$result);//->with('users_count',$result_count);
    }
}
