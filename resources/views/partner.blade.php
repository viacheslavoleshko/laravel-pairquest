@extends('layouts.app')

@section('title', 'Partner Email')

@section('content')
    <div class="form-wrapper single-page newsman-block">
        <form method="POST" action="{{ route('partner.store', ['user' => Auth::user()->id]) }}">
            @csrf
            <div class="form-wrapper__inner">
                @if ($errors->has('partner_email'))
                    <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                            Вашої пари не знайдено
                    </div>
                    <div class="form-wrapper__inner-text block-title-medium block-title text-semibold">
                        Перевірте введений емейл
                    </div>
                @else
                    <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                        Введи емейл своєї пари
                    </div>
                    <div class="form-wrapper__inner-text block-title-medium block-title text-semibold">
                        Перед додаванням партнера, він має бути зареєстрованим в системі.
                    </div>
                @endif
                <div class="form-wrapper__content">
                    <input class="input-text @error('partner_email') is-invalid @enderror" type="email" placeholder="Email" name="partner_email" value="{{ old('partner_email') }}" required autocomplete="partner_email" autofocus>
                    @error('partner_email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-wrapper__button">
                    <a href="{{ route('prefs') }}">Пропустити</a>
                    <button type="submit">Зберегти</button>
                </div>

            </div>
        </form>
    </div>
@endsection
