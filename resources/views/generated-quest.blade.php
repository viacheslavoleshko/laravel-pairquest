@extends('layouts.app')

@section('title')
    <title>Enjoy your Quest</title>
@endsection

@section('content')
    <div class="main">
        <div class="main-title">
            <h1>
                Ваш новий квест
            </h1>
        </div>
        <div class="main__inner">
            <form method="POST" action="{{ route('end-quest', ['generated_task' => $generated_task]) }}">
                @csrf
                <div class="form-box">
                    @if (isset($generated_task->started_at)) 
                        <h4>Час</h4>
                        <p>{{ Carbon\Carbon::parse($generated_task->started_at)->locale('uk')->calendar() }}</p>
                    @endif
                    <h4>Завдання</h4>
                    <p>
                        {{ $location_description }} {{ $task_description }} 
                        @if(isset($custom_detailed_task))
                            {{ $custom_detailed_task }}</p>
                        @else
                            {{ $detailed_task->description }}
                        @endif
                    </p>
                    <h4>Правила</h4>
                    <p>{{ $task_rule->description }}</p>
                    <h4>Ідея</h4>
                    <p>{{ $detailed_task_notion->description }}</p>
                    @if (isset($accessories))
                        <h4>Аксесуари</h4>
                        @foreach ($accessories as $accessory)
                            <p>{{ $accessory->name }}</p>
                        @endforeach
                    @endif
                </div>

                <div class="form-btn">
                    <button type="submit" class="btn btn-danger " name="is_rejected" value="1">Відхилити</button>
                    <button type="submit" class="btn btn-success " name="is_rejected" value="0">Закінчити</button>
                </div>
            </form>
        </div>
    </div>
@endsection
