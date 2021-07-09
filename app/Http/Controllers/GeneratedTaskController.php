<?php

namespace App\Http\Controllers;

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

        foreach($user->accessories as $accessory) {
            $user_accessories[$accessory->id] = $accessory->name;
        }
        foreach($partner->accessories as $accessory) {
            $partner_accessories[$accessory->id] = $accessory->name;
        }

        foreach($user->preferences as $preference) {
            $user_preferences[$preference->id] = $preference->description;
        }
        foreach($partner->preferences as $preference) {
            $partner_preferences[$preference->id] = $preference->description;
        }

        $intersect_locations = array_intersect($user_locations, $partner_locations);
        $intersect_accessories = array_intersect($user_accessories, $partner_accessories);
        $intersect_preferences = array_intersect($user_preferences, $partner_preferences);
        dump($intersect_preferences);

        $task = Task::inRandomOrder()->with('partner_tasks')->where('preference_id', array_rand($intersect_preferences))->first(); // TODO додати фільтрацію по тривалості, статі
        $partner_task = $task->partner_tasks->random(1)->first();
        dump($task->description, $partner_task->partner_description);


        $validatedData = $request->validate([
            'quest_start' => 'required|date',
        ]);

        dd($validatedData['quest_start']);

        $generated_task = new GeneratedTask();
        $generated_task->user_id = $user->id;
        $generated_task->partner_id = $partner->id;
        $generated_task->location_id = array_rand($intersect_locations);
        $generated_task->accessory_id = array_rand($intersect_accessories);
        $generated_task->started_at = $validatedData['quest_start'];
        $generated_task->task_id = $task->id;
        $generated_task->partner_task_id = $partner_task->id;
        $generated_task->save();

        return redirect()->route('quest');
        // dd($generated_task);
    }
}
