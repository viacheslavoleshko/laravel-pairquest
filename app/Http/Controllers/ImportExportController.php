<?php

namespace App\Http\Controllers;

use App\Exports\TasksExport;
use App\Imports\TasksImport;
use Illuminate\Http\Request;
use App\Exports\AccessoriesExport;
use App\Http\Requests\FileRequest;
use App\Imports\AccessoriesImport;
use App\Exports\PartnerTasksExport;
use App\Imports\PartnerTasksImport;
use App\Exports\DetailedTasksExport;
use App\Imports\DetailedTasksImport;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\LocationDescriptionsExport;
use App\Imports\LocationDescriptionsImport;

class ImportExportController extends Controller
{
    public function tasksExport()
    {
        return Excel::download(new TasksExport, 'tasks-collection.xlsx');
    }

    public function tasksImport(FileRequest $request)
    {
        $validatedData = $request->validated();
        Excel::import(new TasksImport, $validatedData['file']);
        return back()->with('status', 'File imported!');
    }

    public function detailedTasksExport()
    {
        return Excel::download(new DetailedTasksExport, 'detailed-tasks-collection.xlsx');
    }

    public function detailedTasksImport(FileRequest $request)
    {
        $validatedData = $request->validated();
        Excel::import(new DetailedTasksImport, $validatedData['file']);
        return back()->with('status', 'File imported!');
    }

    public function partnerTasksExport()
    {
        return Excel::download(new PartnerTasksExport, 'partner-tasks-collection.xlsx');
    }

    public function partnerTasksImport(FileRequest $request)
    {
        $validatedData = $request->validated();
        Excel::import(new PartnerTasksImport, $validatedData['file']);
        return back()->with('status', 'File imported!');
    }

    public function accessoriesExport()
    {
        return Excel::download(new AccessoriesExport, 'accessories-collection.xlsx');
    }

    public function accessoriesImport(FileRequest $request)
    {
        $validatedData = $request->validated();
        Excel::import(new AccessoriesImport, $validatedData['file']);
        return back()->with('status', 'File imported!');
    }

    public function locationDescriptionsExport()
    {
        return Excel::download(new LocationDescriptionsExport, 'location-descriptions-collection.xlsx');
    }

    public function locationDescriptionsImport(FileRequest $request)
    {
        $validatedData = $request->validated();
        Excel::import(new LocationDescriptionsImport, $validatedData['file']);
        return back()->with('status', 'File imported!');
    }
}
