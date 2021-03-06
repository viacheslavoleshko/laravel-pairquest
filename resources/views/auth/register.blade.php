@extends('layouts.app')

@section('title', 'Registration')

@section('style')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/please-wait/0.0.5/please-wait.min.css" integrity="sha512-qHOnOjE4dPoo197XSBBgRB4bcqwiJkbZhvtvX/djtgkzEYLZtI4aods6PRPTNe8Yok1/O0CZnH0SkAvXQx4Vdg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@endsection

@section('content')
    <!-- form -->
    <div class="form-wrapper single-page newsman-block">
        <form method="POST" action="{{ route('register') }}">
            @csrf
            <div class="form-wrapper__inner">

                <div class="form-wrapper__inner-logo">
                    <img src="/img/main-logo.svg" alt="">
                </div>
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Реєстрація
                </div>
                <div class="form-wrapper__content">
                    <input class="input-text @error('email') is-invalid @enderror" type="email" placeholder="Email" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                    @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                    <input class="input-text @error('telegram_user_id') is-invalid @enderror" type="text" placeholder="Telegram Login" name="telegram_user_id" value="{{ old('telegram_user_id') }}" autocomplete="telegram_user_id">
                    @error('telegram_user_id')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                    <input class="input-text @error('password') is-invalid @enderror" type="password" placeholder="Password" name="password" required autocomplete="password">
                    @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                    <input class="input-text @error('name') is-invalid @enderror" type="text" placeholder="Nickname" name="name" value="{{ old('name') }}" required autocomplete="name">
                    @error('name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                    <select class="input-text select-content @error('gender') is-invalid @enderror" name="gender" value="{{ old('gender') }}" required autocomplete="gender">
                        <option selected disabled>Виберіть стать</option>
                        @foreach ($genders as $gender)
                            <option value="{{ $gender->id }}">{{ $gender->name }}</option>
                        @endforeach
                    </select>
                    @error('gender')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                    
                </div>
                <div class="form-wrapper__inner-text">
                    <a href="{{ route('login') }}">Вхід</a>
                </div>
                <div class="form-wrapper__button">
                    <button type="submit">Зареєструватися</button>
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
