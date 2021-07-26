@extends('layouts.app')

@section('title', 'Create Quest')

@section('content')
    @include('includes._navbar')
    <div class="form-wrapper single-page more-page newsman-block">
        <form method="POST" action="{{ route('quest-duration', ['user' => Auth::user()->id]) }}">
            @csrf
            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Створити новий квест
                </div>
                <div class="form-wrapper__content">
                    @foreach ($durations as $duration)
                        <button type="submit" name="duration" value="{{ $duration->id }}">{{ $duration->name }}</button>
                    @endforeach
                    <select class="input-text select-content select-content-quest @error('user_level') is-invalid @enderror" name="user_level" required autocomplete="user_level">
                        <option selected disabled>Рівень користувача</option>
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

                <div class="form-wrapper__button">
                    <a href="{{ route('prefs') }}">Редагувати вподобання</a>
                </div>
            </div>
        </form>
    </div>
@endsection
