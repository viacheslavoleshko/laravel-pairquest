<?php

namespace App\Exports;

use App\Models\Accessory;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class AccessoriesExport implements FromCollection, WithHeadings
{
    public function headings(): array
    {
        return [
            'Name',
        ];
    }
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Accessory::select('name')->get();
    }
}
