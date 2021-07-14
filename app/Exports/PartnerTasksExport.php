<?php

namespace App\Exports;

use App\Models\PartnerTask;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class PartnerTasksExport implements FromView
{
    public function view(): View
    {
        return view('exports.partner-tasks', ['partner_tasks' => PartnerTask::with(['gender'])->get()]);
    }
}
