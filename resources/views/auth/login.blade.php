
@extends('layouts.app')

@section('title', 'Login')
@section('style')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/please-wait/0.0.5/please-wait.min.css" integrity="sha512-qHOnOjE4dPoo197XSBBgRB4bcqwiJkbZhvtvX/djtgkzEYLZtI4aods6PRPTNe8Yok1/O0CZnH0SkAvXQx4Vdg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@endsection

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
@section('javascript')

<script src="https://cdnjs.cloudflare.com/ajax/libs/please-wait/0.0.5/please-wait.min.js" integrity="sha512-mEe6gLbPz5ZrXPgwBNL6KSNLjE1zvv4G31w/UdsGkaYrmFBLhGRH4iRI5SeoUppqdq/Ydn5A+ctDO2felJ8p5w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        function fadeOutEffect() {
            var fadeTarget = document.querySelector('.pg-loading');
            var fadeEffect = setInterval(function() {
                if (!fadeTarget.style.opacity) {
                    fadeTarget.style.opacity = 1;
                }
                if (fadeTarget.style.opacity > 0) {
                    fadeTarget.style.opacity -= 0.1;
                } else {
                    clearInterval(fadeEffect);
                    fadeTarget.remove();
                }
            }, 50);
        }
        setTimeout(function() {
            fadeOutEffect();
        }, 500);
    </script>
@endsection
