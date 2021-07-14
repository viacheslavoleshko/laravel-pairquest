<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exports\TasksExport;
use App\Imports\TasksImport;
use App\Exports\PartnerTasksExport;
use App\Http\Requests\FileRequest;
use App\Imports\PartnerTasksImport;
use Maatwebsite\Excel\Facades\Excel;

class ImportExportController extends Controller
{
    public function index()
    {
        return view('import-export');
    }

    public function taskExport()
    {
        return Excel::download(new TasksExport, 'tasks-collection.xlsx');
    }

    public function taskImport(FileRequest $request)
    {
        $validatedData = $request->validated();
        Excel::import(new TasksImport, $validatedData['file']);
        return back()->with('status', 'File imported!');;
    }

    public function partnerTaskExport()
    {
        return Excel::download(new PartnerTasksExport, 'partner-tasks-collection.xlsx');
    }

    public function partnerTaskImport(FileRequest $request)
    {
        $validatedData = $request->validated();
        Excel::import(new PartnerTasksImport, $validatedData['file']);
        return back()->with('status', 'File imported!');
    }
}
