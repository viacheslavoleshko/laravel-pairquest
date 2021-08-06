<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Models\User;
use App\Models\Duration;
use App\Models\DetailedTask;
use Illuminate\Http\Request;
use App\Models\GeneratedTask;
use App\Models\LocationDescription;
use Illuminate\Support\Facades\Auth;

class QuestController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', 'accept']);
    }

    public function index()
    {
        $user = User::findOrFail(Auth::user()->id);

        if(isset($user->partner_email) && $user->user_levels->isNotEmpty()) {
            if($generated_task = GeneratedTask::where('user_id', $user->id)->whereNull('is_rejected')->first()) {
                $detailed_task = DetailedTask::findOrFail($generated_task->detailed_task_id);
                $detailed_task_notion = $detailed_task->notions->random();
                
                $location_description = LocationDescription::find($generated_task->location_description_id);
                $task = Task::findOrFail($generated_task->task_id);
                $task_description = $task->description;
                $task_rule = $task->rules->random();
                return view('generated-quest', ['generated_task' => $generated_task, 'location_description' =>  $location_description->description, 'location_description_image' => $location_description->image, 'task_description' => $task_description, 'task_image' => $task->image,  'detailed_task' => $detailed_task, 'detailed_task_notion' => $detailed_task_notion, 'task_rule' => $task_rule]);
    
    
            } elseif ($generated_task = GeneratedTask::where('partner_id', $user->id)->whereNull('is_rejected')->first()) {
                $detailed_task = DetailedTask::findOrFail($generated_task->detailed_task_id);
                $detailed_task_notion = $detailed_task->notions->random();
                $location_description = LocationDescription::find($generated_task->location_description_id);
                $task = Task::findOrFail($generated_task->task_id);
                $task_description = $task->partner_description;
                $generated_quest = [
                    'generated_task' => $generated_task,
                    'location_description' =>  $location_description->partner_description,
                    'location_description_image' =>  $location_description->image,
                    'task_description' => $task_description,
                    'task_image' => $task->image,
                    'detailed_task_notion' => $detailed_task_notion,
                ];
                if(isset($detailed_task->custom_partner_task)) {
                    $custom_detailed_task = $detailed_task->custom_partner_task;
                    $task_rule = $task->rules->random(); // what rules take custom partner task?
                    
                    $generated_quest['custom_detailed_task'] = $custom_detailed_task;
                    $generated_quest['task_rule'] = $task_rule;
                } elseif(isset($generated_task->partner_task_id)) {
                    $partner_task = $detailed_task->partner_tasks->find($generated_task->partner_task_id);
                    $task_rule = $partner_task->partner_rules->random();
                    $generated_quest['detailed_task'] = $partner_task;
                    $generated_quest['task_rule'] = $task_rule;
                } else {
                    $partner_task = DetailedTask::findOrFail($generated_task->detailed_task_id);
                    $task_rule = $task->rules->random();
                    
                    $generated_quest['detailed_task'] = $partner_task;
                    $generated_quest['task_rule'] = $task_rule;
                }
                return view('generated-quest', $generated_quest);
    
                
            } else {
                $partner = User::with('user_levels')->where('email', $user->partner_email)->first();
    
                $user_level_stack = $user->user_levels->pluck('id', 'name');
                $partner_level_stack = $partner->user_levels->pluck('id', 'name');
                $intersect_level_stack = $user_level_stack->intersect($partner_level_stack);
                if($intersect_level_stack->isEmpty()) {
                    return view('errors.quest-error');
                }
    
                return view('quest', ['user_levels' => $intersect_level_stack]);
            }
        } elseif (isset($user->partner_email) && $user->user_levels->isEmpty()) {
            return redirect()->route('prefs');
        } else {
            return view('partner');
        }
    }

    public function final_user_level($user_level)
    {

        session(['final_user_level' => $user_level]);
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
        $detailed_task = DetailedTask::findOrFail($generated_task->detailed_task_id);
        $generated_task->is_rejected = $request->is_rejected;
        $generated_task->save();

        if($request->is_rejected == 0) {
            return view('like', ['detailed_task' => $detailed_task]);
        } elseif($request->is_rejected == 1) {
            return redirect()->route('quest');
        }
    }
}
