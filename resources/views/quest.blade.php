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
                <button type="submit" name="duration" class="btn-quest" value="{{ $duration->id }}">{{ $duration->name }}</button>
                @endforeach

                <div class="form-outline mb-4">
                    <select class="form-select @error('user_level') is-invalid @enderror" name="user_level" required autocomplete="user_level">
                        <option selected disabled>Select collective user level</option>
                        @foreach ($user_levels as $key => $user_level)
                            <option value="{{ $user_level }}">{{ $key }}</option>
                        @endforeach
                    </select>

                    @error('user_level')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <a class="reg-link" href="{{ route('prefs') }}">Редагувати вподобання</a>
            </form>
        </div>
    </div>
@endsection
