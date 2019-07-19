@extends('layouts.admin')

@section('content')

@include('pages.admin.partials.search_bar')
<div class="row">
     <div class="col s12">
          <table class="responsive highlight centered">
               <thead>
                    <tr>
                         <th>RollNo</th>
                         <th>Name</th>
                         <th>Department</th>
                         <th>Program</th>
                         <th>Year</th>
                         <th>Section</th>
                    </tr>
               </thead>
               <tbody>
                    @foreach($users as $user)
                    <tr>
                         <td>{{$user->roll_no}}</td>
                         <td>{{$user->full_name}}</td>
                         <td>{{$user->program}}</td>
                         <td>{{$user->department_name}}</td>
                         <td>{{$user->year}}</td>
                         <td>{{$user->section}}</td>
                    </tr>
                    @endforeach
               </tbody>
          </table>
     </div>
</div>

@endsection