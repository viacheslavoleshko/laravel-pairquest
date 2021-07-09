<?php

namespace App\Http\Controllers;

use App\Models\Accessory;
use App\Models\User;
use App\Models\Duration;
use App\Models\GeneratedTask;
use App\Models\Location;
use App\Models\PartnerTask;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class QuestController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = User::with(['generated_task'])->findOrFail(Auth::user()->id);

        if(isset($user->generated_task) && is_null($user->generated_task->is_rejected)) {
            $task = Task::findOrFail($user->generated_task->task_id);
            return view('generated-quest', ['generated_task' => $user->generated_task, 'task' => $task, 'location' => Location::findOrFail($user->generated_task->location_id), 'accessory' => Accessory::findOrFail($user->generated_task->accessory_id)]);
        } elseif ($generated_task = GeneratedTask::where('partner_id', $user->id)->whereNull('is_rejected')->first()) {
            $partner_task = PartnerTask::findOrFail($generated_task->partner_task_id);
            return view('generated-quest', ['generated_task' => $generated_task, 'task' => $partner_task, 'location' => Location::findOrFail($generated_task->location_id), 'accessory' => Accessory::findOrFail($generated_task->accessory_id), 'name' => Task::findOrFail($generated_task->task_id)->name]);
        } else {
            return view('quest', ['durations' => Duration::all()]);
        }
    }

    public function duration($duration_id)
    {
        session(['duration' => $duration_id]);
        return view('quest2');
    }

    public function organisator($organisator)
    {
        session(['organisator' => $organisator]);
        return view('quest3');
    }

    public function finish(Request $request, $id)
    {
        $generated_task = GeneratedTask::findOrFail($id);
        $generated_task->is_rejected = $request->is_rejected;
        $generated_task->save();

        return redirect()->route('quest');
    }
}
