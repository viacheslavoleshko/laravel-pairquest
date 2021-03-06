<?php

namespace App\Imports;

use App\Models\DetailedTask;
use App\Models\Gender;
use App\Models\Duration;
use App\Models\LocationType;
use App\Models\UserLevel;
use App\Models\Preference;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class DetailedTasksImport implements ToModel, WithValidation, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new DetailedTask([
            'description'         => $row['description'],
            'custom_partner_task' => $row['custom_partner_task'],
            'location_type_id'    => LocationType::where('name', 'like', $row['location_type'])->firstOrFail()->id,
            'preference_id'       => Preference::where('description', 'like', $row['preference'])->firstOrFail()->id,
            'user_level_id'       => UserLevel::where('name', 'like', $row['user_level'])->firstOrFail()->id,
            'gender_id'           => Gender::where('name', 'like', $row['gender'])->firstOrFail()->id,
            'image'               => $row['image'],
        ]);
    }

    public function rules(): array
    {
        return [
            'description' => 'required|string',
            'custom_partner_task' => 'string',
            'location_type' => 'bail|required|string|max:255|exists:location_types,name',
            'preference' => 'bail|required|string|max:255|exists:preferences,description',
            'user_level' => 'bail|required|string|max:255|exists:user_levels,name',
            'gender' => 'bail|required|string|max:255|exists:genders,name',
        ];
    }
}


// class TasksImport implements ToCollection, WithValidation, WithHeadingRow
// {
//     public function collection(Collection $rows)
//     {
//         foreach ($rows as $row) 
//         {
//             $task = new Task;
//             $task->name              = $row['name'];
//             $task->preference_id     = Preference::where('description', 'like', $row['preference'])->firstOrFail()->id;
//             $task->duration_id       = Duration::where('name', 'like', $row['duration'])->firstOrFail()->id;
//             $task->user_level_id     = UserLevel::where('name', 'like', $row['user_level'])->firstOrFail()->id;
//             $task->is_partner_task   = $row['is_partner_task'];
//             $task->description       = $row['description'];
//             $task->is_accessories    = $row['is_accessories'];
//             $task->gender_id         = Gender::where('name', 'like', $row['gender'])->firstOrFail()->id;
//             $task->image             = $row['image'];

//             dd($task);
//         }
//     }

//     public function rules(): array
//     {
//         return [
//             'name' => 'required|string|max:255',
//             'preference' => 'bail|required|string|max:255|exists:preferences,description',
//             'duration' => 'bail|required|string|max:255|exists:durations,name',
//             'user_level' => 'bail|required|string|max:255|exists:user_levels,name',
//             'is_partner_task' => 'required|boolean',
//             'description' => 'required|string',
//             'is_accessories' => 'required|boolean',
//             'gender' => 'bail|required|string|max:255|exists:genders,name',
//         ];
//     }
// }