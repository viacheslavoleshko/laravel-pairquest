<?php

namespace App\Mail;

use App\Models\Task;
use App\Models\User;
use App\Models\DetailedTask;
use App\Models\GeneratedTask;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use App\Models\LocationDescription;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class UserQuestGenerated extends Mailable
{
    use Queueable, SerializesModels;

    public $generated_task;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(GeneratedTask $generated_task)
    {
        $this->generated_task = $generated_task;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $subject = "У вас з'явився новий квест!";
        $user = User::find($this->generated_task->user_id);
        $location_description = LocationDescription::find($this->generated_task->location_description_id)->description;
        $task = Task::findOrFail($this->generated_task->task_id);
        $task_description = $task->description;
        $detailed_task = DetailedTask::findOrFail($this->generated_task->detailed_task_id);

        return $this->subject($subject)->view('emails.tasks.generated', ['user' => $user, 'location_description' => $location_description, 'task' => $task, 'task_description' => $task_description, 'detailed_task' => $detailed_task]);
    }
}
