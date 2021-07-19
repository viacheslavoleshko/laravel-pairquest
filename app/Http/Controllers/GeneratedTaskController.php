<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\DetailedTask;
use App\Models\User;
use App\Models\Duration;
use Illuminate\Http\Request;
use App\Models\GeneratedTask;
use App\Models\LocationDescription;
use App\Models\Task;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class GeneratedTaskController extends Controller
{
    public function store(Request $request, $id)
    {
        $user = User::with(['locations', 'preferences', 'generated_task'])->findOrFail($id);
        $partner = User::with(['locations', 'preferences'])->where('email', $user->partner_email)->first();
        $organisator = session('organisator');
        $final_user_level = session('final_user_level');

        $user_preferences = $user->preferences->pluck('id', 'description');
        $user_locations_types = $user->locations->pluck('location_type_id', 'name')->unique();
        $partner_preferences = $partner->preferences->pluck('id', 'description');
        $intersect_preferences = $user_preferences->intersect($partner_preferences);

        $random_location_type = $user_locations_types->random();

        if($intersect_preferences->isNotEmpty()) {
            $random_preference_from_intersect = $intersect_preferences->random();

            try {
                $task = Task::inRandomOrder()->where([
                    ['location_type_id', $random_location_type],
                    ['preference_id', $random_preference_from_intersect],
                ])->firstOrFail();

                $detailed_task = DetailedTask::inRandomOrder()->with('partner_tasks')->where([
                    ['location_type_id', $random_location_type],
                    ['preference_id', $random_preference_from_intersect],
                    ['duration_id', $user->duration_id],
                    ['user_level_id', $final_user_level]
                ])->firstOrFail(); // TODO додати фільтрацію по статі, лайкам
            } catch(ModelNotFoundException $e) {
                dd($e->getMessage(), $random_location_type, $random_preference_from_intersect, $user->duration_id, $final_user_level);
                return view('errors.quest-error2');
            }
            
            // $accessories = $task->accessories; 
            // dd($task, $accessories);
            // dump($user->locations->where('location_type_id', $random_location_type)); // user locations from type
            // dump($user->locations->where('location_type_id', $random_location_type)->random()->location_descriptions); // descriptions from location
            dump($user->locations->where('location_type_id', $random_location_type)->random()->location_descriptions->random()->description);
            dump($task->description);
            dd($detailed_task->description);


            $generated_task = new GeneratedTask();
            if($organisator == 1) {
                $generated_task->user_id = $user->id;
                $generated_task->partner_id = $partner->id;
            } elseif($organisator == 0) {
                $generated_task->user_id = $partner->id;
                $generated_task->partner_id = $user->id;
            }
            $random_location_id = $user->locations->random()->id;
            $generated_task->location_id = $random_location_id;
            $generated_task->location_description_id = LocationDescription::inRandomOrder()->where('location_id', $random_location_id)->first()->id;
            $generated_task->started_at = $request->quest_start;
            $generated_task->task_id = $detailed_task->id;
            if($detailed_task->is_partner_task == 1) {
                $generated_task->partner_task_id = $detailed_task->partner_tasks->random()->id;
            }
            

            dd($generated_task);
            $generated_task->save();

            return redirect()->route('quest');
        } else {
                return view('errors.quest-error');
        }
    }
}
