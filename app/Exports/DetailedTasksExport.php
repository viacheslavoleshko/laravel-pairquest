<?php

namespace App\Exports;

use App\Models\DetailedTask;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class DetailedTasksExport implements FromView, ShouldAutoSize
{
    public function view(): View
    {
        return view('exports.detailed-tasks', ['detailed_tasks' => DetailedTask::with(['location_type', 'preference', 'user_level', 'gender'])->get()]);
    }
}