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

class PartnerQuestGenerated extends Mailable
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
        $detailed_task = DetailedTask::findOrFail($this->generated_task->detailed_task_id);
        $generated_quest = [
            'user' => User::find($this->generated_task->partner_id),
            'location_description' =>  LocationDescription::find($this->generated_task->location_description_id)->partner_description,
            'task_description' => Task::findOrFail($this->generated_task->task_id)->partner_description,
        ];
        
        if(isset($detailed_task->custom_partner_task)) {
            $generated_quest['custom_detailed_task'] = $detailed_task->custom_partner_task;
        } elseif(isset($this->generated_task->partner_task_id)) {
            $generated_quest['detailed_task'] = $detailed_task->partner_tasks->find($this->generated_task->partner_task_id);
        } else {
            $generated_quest['detailed_task'] = DetailedTask::findOrFail($this->generated_task->detailed_task_id);
        }



        return $this->subject($subject)->view('emails.tasks.generated', $generated_quest);
    }
}
