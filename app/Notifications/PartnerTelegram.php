<?php

namespace App\Notifications;

use Carbon\Carbon;
use App\Models\Task;
use App\Models\DetailedTask;
use Illuminate\Bus\Queueable;
use App\Models\LocationDescription;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use NotificationChannels\Telegram\TelegramChannel;
use NotificationChannels\Telegram\TelegramMessage;

class PartnerTelegram extends Notification
{
    use Queueable;

    public $generated_task;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($generated_task)
    {
        $this->generated_task = $generated_task;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return [TelegramChannel::class];
    }

    /**
     * Get the telegram representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \NotificationChannels\Telegram\TelegramMessage
     */
    public function toTelegram($notifiable)
    {
        $url = url('/quest/');
        $detailed_task = DetailedTask::findOrFail($this->generated_task->detailed_task_id);
        $location_description =  LocationDescription::find($this->generated_task->location_description_id)->partner_description;
        $task_description = Task::findOrFail($this->generated_task->task_id)->partner_description;
        
        if(isset($detailed_task->custom_partner_task)) {
            $detailed_task = $detailed_task->custom_partner_task;
        } elseif(isset($this->generated_task->partner_task_id)) {
            $detailed_task = $detailed_task->partner_tasks->find($this->generated_task->partner_task_id)->description;
        } else {
            $detailed_task = DetailedTask::findOrFail($this->generated_task->detailed_task_id)->description;
        }
        return TelegramMessage::create()
            // Optional recipient user id.
            ->to($notifiable->telegram_user_id)
            // Markdown supported.
            ->content("Привіт, " . $notifiable->name . ". Щойно був створений новий цікавий квест для тебе. Спробуй його виконати!\n\nЧас: " . Carbon::parse($this->generated_task->started_at)->locale('uk')->calendar() . "\n\nЗавдання: " . $location_description . $task_description . $detailed_task)
            
            // (Optional) Blade template for the content.
            // ->view('notification', ['url' => $url])
            
            // (Optional) Inline Buttons
            ->button('Переглянути квест', $url);
    }
}
