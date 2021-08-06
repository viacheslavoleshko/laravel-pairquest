@extends('layouts.app')

@section('title', 'Create Quest')

@section('content')
    @include('includes._navbar')
    <div class="form-wrapper single-page more-page newsman-block">
        <form>
            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Створити новий квест
                </div>
                
                <div class="form-wrapper__content">
                    @foreach ($user_levels as $key => $user_level)
                        <a class="button-link" href="{{ route('quest-final-user-level', ['user_level' => $user_level]) }}">{{ $key }}</a>
                    @endforeach
                </div>

                <div class="form-wrapper__inner-text">
                    <a href="{{ route('prefs') }}">Редагувати вподобання</a>
                </div>
            </div>
        </form>
    </div>
@endsection
