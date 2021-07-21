<p>Привіт, {{ $user->name }}</p>
<p>Щойно був створений новий цікавий <a href="{{ route('quest') }}">квест</a> для тебе. Спробуй його виконати!</p>
@if (isset($generated_task->started_at)) 
    <h4>Час</h4>
    <p>{{ Carbon\Carbon::parse($generated_task->started_at)->locale('uk')->calendar() }}</p>
@endif
<h4>Завдання</h4>
<p>
    {{ $location_description }} {{ $task_description }} 
    @if(isset($custom_detailed_task))
        {{ $custom_detailed_task }}
    @else
        {{ $detailed_task->description }}
    @endif
</p>