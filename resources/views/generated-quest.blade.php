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
                    <h4>Назва</h4>
                    @if (isset($task->name))
                        <p>{{ $task->name }}</p>
                    @else
                        <p>{{ $name }}</p>
                    @endif
                    
                    <h4>Локація</h4>
                    <p>{{ $location->name }}</p>
                    <h4>Час</h4>
                    <p>{{ Carbon\Carbon::parse($generated_task->started_at)->locale('uk')->calendar() }}</p>
                    <h4>Завдання</h4>
                    <p>{{ $task->description }}</p>
                    @if (isset($accessory))
                        <h4>Аксесуари</h4>
                        <p>{{ $accessory->name }}</p>
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
