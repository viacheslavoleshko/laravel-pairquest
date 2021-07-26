@extends('layouts.app')

@section('title', 'Create Quest')

@section('content')
    @include('includes._navbar')
    <!-- form -->
    <div class="form-wrapper single-page more-page newsman-block">
        <form method="POST" action="{{ route('generator', ['user' => Auth::user()->id]) }}">
            @csrf
            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Коли відбудеться?
                </div>

                <div class="form-wrapper__content">
                    <input class="input-text input-date @error('quest_start') is-invalid @enderror" type="datetime-local" name="quest_start" value="{{ old('quest_start') }}">
                </div>
                @error('quest_start')
                    <div class="alert alert-danger">
                        {{ $message }}
                    </div>
                @enderror

                <div class="form-wrapper__button">
                    <button type="submit">Далі</button>

                </div>
            </div>
        </form>
    </div>
@endsection
