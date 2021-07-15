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
        $user = User::findOrFail(Auth::user()->id);
        if($generated_task = GeneratedTask::where('user_id', $user->id)->whereNull('is_rejected')->first()) {
            $task = Task::findOrFail($generated_task->task_id);
            $accessory = Accessory::find($generated_task->accessory_id);
            return view('generated-quest', ['generated_task' => $generated_task, 'task' => $task, 'location' => Location::findOrFail($generated_task->location_id), 'accessory' => $accessory]);


        } elseif ($generated_task = GeneratedTask::where('partner_id', $user->id)->whereNull('is_rejected')->first()) {
            if(isset($generated_task->partner_task_id)) {
                $partner_task = PartnerTask::findOrFail($generated_task->partner_task_id);
            } else {
                $partner_task = Task::findOrFail($generated_task->task_id);
            }
            
            $accessory = Accessory::find($generated_task->accessory_id);
            return view('generated-quest', ['generated_task' => $generated_task, 'task' => $partner_task, 'location' => Location::findOrFail($generated_task->location_id), 'accessory' => $accessory, 'name' => Task::findOrFail($generated_task->task_id)->name]);

            
        } else {
            $partner = User::with('user_levels')->where('email', $user->partner_email)->first();

            $user_level_stack = $user->user_levels->pluck('id', 'name');
            $partner_level_stack = $partner->user_levels->pluck('id', 'name');
            $intersect_level_stack = $user_level_stack->intersect($partner_level_stack);
            if($intersect_level_stack->isEmpty()) {
                return view('errors.quest-error');
            }

            return view('quest', ['durations' => Duration::all(), 'user_levels' => $intersect_level_stack]);
        }
    }

    public function duration(Request $request, $id)
    {

        $validatedData = $request->validate([
            'duration' => 'required',
            'user_level' => 'required',
        ]);

        session(['final_user_level' => $validatedData['user_level']]);
        $user = User::with(['generated_task'])->findOrFail($id);
        $user->duration_id = $validatedData['duration'];
        $user->save();
        return view('quest2');
    }

    public function organisator($organisator)
    {
        session(['organisator' => $organisator]);
        return view('quest3');
    }

    public function finish(Request $request, $id)
    {
        $generated_task = GeneratedTask::whereNull('is_rejected')->findOrFail($id);
        $task = Task::findOrFail($generated_task->task_id);
        $generated_task->is_rejected = $request->is_rejected;
        $generated_task->save();

        if($request->is_rejected == 0) {
            return view('like', ['task' => $task]);
        } elseif($request->is_rejected == 1) {
            return redirect()->route('quest');
        }
    }
}
