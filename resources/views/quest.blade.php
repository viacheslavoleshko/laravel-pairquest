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
            <form method="POST" action="{{ route('quest-duration', ['user' => Auth::user()->id]) }}" >
                @csrf
                @foreach ($durations as $duration)
                <button type="submit" name="duration" class="btn-link" value="{{ $duration->id }}">{{ $duration->name }}</button>
                @endforeach

                <select class="form-control form-input-items" name="user_level">
                    <option selected disabled>Select collective user level</option>
                    @foreach ($user_levels as $key => $user_level)
                        <option value="{{ $user_level }}">{{ $key }}</option>
                    @endforeach
                </select>
                
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <a class="reg-link" href="{{ route('prefs') }}">Редагувати вподобання</a>
            </form>
        </div>
    </div>
@endsection
