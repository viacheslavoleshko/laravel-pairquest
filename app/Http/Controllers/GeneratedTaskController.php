<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\GeneratedTask;
use Illuminate\Support\Facades\Auth;

class GeneratedTaskController extends Controller
{
    public function store(Request $request, $id)
    {
        $user = User::with(['locations', 'accessories', 'preferences', 'generated_task'])->findOrFail($id);
        $partner = User::with(['locations', 'accessories', 'preferences'])->where('email', $user->partner_email)->first();

        foreach($user->locations as $location) {
            $user_locations[$location->id] = $location->name;
        }
        foreach($partner->locations as $location) {
            $partner_locations[$location->id] = $location->name;
        }

        foreach($user->preferences as $preference) {
            $user_preferences[$preference->id] = $preference->description;
        }
        foreach($partner->preferences as $preference) {
            $partner_preferences[$preference->id] = $preference->description;
        }

        $intersect_locations = array_intersect($user_locations, $partner_locations);

        $intersect_preferences = array_intersect($user_preferences, $partner_preferences);
        $random_preference_from_intersect = array_rand($intersect_preferences);
        
        // dump($intersect_preferences); dump($random_preference_from_intersect);
        

        $task = Task::inRandomOrder()->with('partner_tasks')->where([
            ['preference_id', $random_preference_from_intersect],
            ['user_level_id', min($user->user_level_id, $partner->user_level_id)],
            ['duration_id', min($user->duration_id, $partner->duration_id)]
        ])->first(); // TODO додати фільтрацію по статі, лайкам
        // dump($task);
        $accessory = $user->accessories->where('preference_id', $random_preference_from_intersect)->first(); 
        // dump($accessory->name ?? 'null');
        $partner_task = $task->partner_tasks->random(1)->first();
        
        // dump($task->description, $partner_task->description);


        $validatedData = $request->validate([
            'quest_start' => 'required',
        ]);

        $generated_task = new GeneratedTask();
        $generated_task->user_id = $user->id;
        $generated_task->partner_id = $partner->id;
        $generated_task->location_id = array_rand($intersect_locations);
        if(isset($accessory)) {
            $generated_task->accessory_id = $accessory->id;
        }
        $generated_task->started_at = $validatedData['quest_start'];
        $generated_task->task_id = $task->id;
        $generated_task->partner_task_id = $partner_task->id;

        // dd($generated_task);
        $generated_task->save();

        return redirect()->route('quest');
    }
}
