<?php

namespace App\Exports;

use App\Models\Task;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class TasksExport implements FromView
{
    public function view(): View
    {
        return view('exports.tasks', ['tasks' => Task::with(['preference', 'duration', 'user_level', 'gender'])->get()]);
    }
}