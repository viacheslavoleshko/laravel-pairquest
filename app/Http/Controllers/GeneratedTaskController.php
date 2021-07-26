<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Task;
use App\Models\User;
use App\Models\Duration;
use App\Models\DetailedTask;
use Illuminate\Http\Request;
use App\Models\GeneratedTask;
use App\Notifications\Telegram;
use App\Mail\UserQuestGenerated;
use App\Mail\PartnerQuestGenerated;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Notifications\PartnerTelegram;
use App\Notifications\TelegramNotification;
use Illuminate\Support\Facades\Notification;
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
        $random_location_description = $user->locations->where('location_type_id', $random_location_type)->random()->location_descriptions->random();

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
                // dd($e->getMessage(), $random_location_type, $random_preference_from_intersect, $user->duration_id, $final_user_level);
                return view('errors.quest-error2');
            }

            // dump($random_location_description->description);
            // dump($task->description);
            // dump($detailed_task->description);


            $generated_task = new GeneratedTask();
            if($organisator == 1) {
                $generated_task->user_id = $user->id;
                $generated_task->partner_id = $partner->id;
            } elseif($organisator == 0) {
                $generated_task->user_id = $partner->id;
                $generated_task->partner_id = $user->id;
            }
            $generated_task->location_description_id = $random_location_description->id;
            $generated_task->started_at = $request->quest_start;
            $generated_task->task_id = $task->id;
            $generated_task->detailed_task_id = $detailed_task->id;
            if($detailed_task->partner_tasks->isNotEmpty()) {
                $generated_task->partner_task_id = $detailed_task->partner_tasks->random()->id;
            }

            // dd($generated_task);
            $generated_task->save();
            Mail::to(User::find($generated_task->user_id))->send(new UserQuestGenerated($generated_task));
            Mail::to(User::find($generated_task->partner_id))->send(new PartnerQuestGenerated($generated_task));
            Notification::send(User::find($generated_task->user_id), new Telegram($generated_task));
            Notification::send(User::find($generated_task->partner_id), new PartnerTelegram($generated_task));

            return redirect()->route('quest');
        } else {
                return view('errors.quest-error');
        }
    }
}
