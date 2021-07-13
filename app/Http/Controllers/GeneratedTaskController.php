<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Task;
use App\Models\User;
use App\Models\Duration;
use Illuminate\Http\Request;
use App\Models\GeneratedTask;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class GeneratedTaskController extends Controller
{
    public function store(Request $request, $id)
    {
        $user = User::with(['locations', 'accessories', 'preferences', 'generated_task'])->findOrFail($id);
        $partner = User::with(['locations', 'accessories', 'preferences'])->where('email', $user->partner_email)->first();
        $organisator = session('organisator');
        dump($organisator);

        $user_preferences = $user->preferences->pluck('id', 'description');
        $partner_preferences = $partner->preferences->pluck('id', 'description');
        $intersect_preferences = $user_preferences->intersect($partner_preferences);

        if($intersect_preferences->isNotEmpty()) {
            $random_preference_from_intersect = $intersect_preferences->random();
            
            try {
                $task = Task::inRandomOrder()->with('partner_tasks')->where([
                    ['preference_id', $random_preference_from_intersect],
                    ['user_level_id', min($user->user_level_id, $partner->user_level_id)],
                    ['duration_id', min($user->duration_id, $partner->duration_id)]
                ])->firstOrFail(); // TODO додати фільтрацію по статі, лайкам
            } catch(ModelNotFoundException $e) {
                return view('errors.quest-error2');
            }
            
            $accessory = $user->accessories->where('preference_id', $random_preference_from_intersect)->first(); 
            $partner_task = $task->partner_tasks->random();
            
            dump($task->description, $partner_task->description);

            $validatedData = $request->validate([
                'quest_start' => 'required',
            ]);

            $generated_task = new GeneratedTask();
            if($organisator == 1) {
                $generated_task->user_id = $user->id;
                $generated_task->partner_id = $partner->id;
            } elseif($organisator == 0) {
                $generated_task->user_id = $partner->id;
                $generated_task->partner_id = $user->id;
            }
            
            $generated_task->location_id = $user->locations->random()->id;
            if(isset($accessory)) {
                $generated_task->accessory_id = $accessory->id;
            }
            $generated_task->started_at = $validatedData['quest_start'];
            $generated_task->task_id = $task->id;
            $generated_task->partner_task_id = $partner_task->id;

            // dd($generated_task);
            $generated_task->save();

            return redirect()->route('quest');
        } else {
                return view('errors.quest-error');
        }
    }
}
