@extends('layouts.app')

@section('title')
    <title>Like Quest</title>
@endsection

@section('content')
    <div class="main">
        <div class="main-title">
            <h1>
                Чи сподообався вам квест?
            </h1>
        </div>
        <div class="main__inner">
            <form method="POST" action="{{ route('like', ['detailed_task' => $detailed_task->id]) }}">
                @csrf
                <div class="form-box">
                    <h4>Завдання</h4>
                    <p>{{ $detailed_task->description }}</p>
                </div>

                <div class="form-btn">
                    <button type="submit" class="btn btn-success " name="is_like" value="1">Так</button>
                    <button type="submit" class="btn btn-danger " name="is_like" value="0">Ні</button>
                </div>
            </form>
        </div>
    </div>
@endsection
