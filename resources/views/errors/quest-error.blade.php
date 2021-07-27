@extends('layouts.app')

@section('title', 'Quest Error')

@section('content')
    <div class="form-wrapper single-page more-page newsman-block">
        <form>

            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Неможливо створити квест, не існує можливих комбінацій
                </div>
                <div class="form-wrapper__inner-text block-title-medium block-title text-semibold">
                    Оновіть список своїх уподобань та узгодьте його з вашою парою
                </div>
                <div class="form-wrapper__button">
                    <a href="{{ route('prefs') }}">Оновити список вподобань</a>
                </div>
            </div>

        </form>
    </div>
@endsection
