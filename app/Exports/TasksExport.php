<?php

namespace App\Exports;

use App\Models\Task;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class TasksExport implements FromView, ShouldAutoSize
{
    public function view(): View
    {
        return view('exports.tasks', ['tasks' => Task::with(['location_type', 'preference'])->get()]);
    }
}
