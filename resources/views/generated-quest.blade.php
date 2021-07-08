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
            <form>
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
                    <h4>Аксесуари</h4>
                    <p>{{ $accessory->name }}</p>
                </div>

                <div class="form-btn">
                    <button type="submit" class="btn btn-danger ">Відхилити</button>
                    <button type="submit" class="btn btn-success ">Закінчити</button>
                </div>
            </form>
        </div>
    </div>
@endsection
