@extends('layouts.app')

@section('title', 'Login')

@section('content')
    <!-- form -->
    <div class="form-wrapper single-page newsman-block">
        <form method="POST" action="{{ route('login') }}">
            @csrf
            <div class="form-wrapper__inner">

                <div class="form-wrapper__inner-logo">
                    <img src="/img/main-logo.svg" alt="">
                </div>
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Логін
                </div>
                <div class="form-wrapper__content">
                    <input class="input-text @error('email') is-invalid @enderror" type="email" placeholder="Email" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                    @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                    <input class="input-text @error('password') is-invalid @enderror" type="password" placeholder="Password" name="password" required autocomplete="current-password">
                    @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-wrapper__inner-text">
                    <a href="{{ route('register') }}">Зареєструватися</a>
                </div>
                <div class="form-wrapper__button">
                    <button type="submit">Логін</button>
                </div>

            </div>
        </form>
    </div>
@endsection
