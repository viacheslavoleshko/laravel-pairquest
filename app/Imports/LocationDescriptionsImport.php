<?php

namespace App\Imports;

use App\Models\Location;
use App\Models\LocationDescription;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class LocationDescriptionsImport implements ToModel, WithValidation, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new LocationDescription([
            'description'         => $row['description'],
            'partner_description' => $row['partner_description'],
            'location_id'         => Location::where('name', 'like', $row['location'])->firstOrFail()->id,
        ]);
    }

    public function rules(): array
    {
        return [
            'description' => 'required|string',
            'partner_description' => 'required|string',
            'location' => 'bail|required|string|max:255|exists:locations,name',
        ];
    }
}
