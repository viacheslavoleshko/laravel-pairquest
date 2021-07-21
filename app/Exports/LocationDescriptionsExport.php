<?php

namespace App\Exports;

use App\Models\LocationDescription;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class LocationDescriptionsExport implements FromView, ShouldAutoSize
{
    public function view(): View
    {
        return view('exports.location-descriptions', ['location_descriptions' => LocationDescription::with('location')->get()]);
    }
}
