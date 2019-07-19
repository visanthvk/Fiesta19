<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TeamRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function messages(){
        return [
            'team_members.required' => 'The team members field is required'
        ];
    }
    public function rules()
    {
        $event_id = $this->route('event_id');
        return [
            'name' => 'required',
            'team_members' => 'required|teamMembersExist|isNotConfirmed|hasNoParallelEvent:' . $event_id . "|teamMembersCount:" . $event_id . "|noTeamLeader|checkGenderMixing:" . $event_id
        ];
    }
}
