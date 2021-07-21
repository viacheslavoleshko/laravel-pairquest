<?php

namespace App\Imports;

use App\Models\Task;
use App\Models\Preference;
use App\Models\LocationType;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;

class TasksImport implements ToModel, WithValidation, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Task([
            'description'         => $row['description'],
            'partner_description' => $row['partner_description'],
            'location_type_id'    => LocationType::where('name', 'like', $row['location_type'])->firstOrFail()->id,
            'preference_id'       => Preference::where('description', 'like', $row['preference'])->firstOrFail()->id,
        ]);
    }

    public function rules(): array
    {
        return [
            'description' => 'required|string',
            'partner_description' => 'required|string',
            'location_type' => 'bail|required|string|max:255|exists:location_types,name',
            'preference' => 'bail|required|string|max:255|exists:preferences,description',
        ];
    }
}
