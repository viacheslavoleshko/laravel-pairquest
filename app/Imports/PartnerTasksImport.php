<?php

namespace App\Imports;

use App\Models\Gender;
use App\Models\PartnerTask;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class PartnerTasksImport implements ToModel, WithValidation, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new PartnerTask([
            'description' => $row['description'],
            'gender_id'   => Gender::where('name', 'like', $row['gender'])->firstOrFail()->id,
        ]);
    }

    public function rules(): array
    {
        return [
            'description' => 'required|string',
            'gender' => 'bail|required|string|max:255|exists:genders,name',
        ];
    }
}
