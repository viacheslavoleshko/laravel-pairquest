@extends('layouts.app')

@section('title')
    <title>Create Quest</title>
@endsection

@section('content')
    <div class="main">
        <div class="main-title">
            <h1>
                Створити новий квест
            </h1>
        </div>
        <div class="main__inner">
            <form>
                @foreach ($durations as $duration)
                <a class="btn-link" href="{{ route('quest-duration', ['duration' => $duration->id]) }}">{{ $duration->name }}</a>
                @endforeach

                <a class="reg-link" href="{{ route('prefs') }}">Редагувати вподобання</a>
            </form>
        </div>
    </div>
@endsection
