@extends('layouts.app')

@section('title', 'Profile')

@section('content')
    @include('includes._pagenavbar')
    <div class="newsman-block no-margin">
        <div class="newsman-block-content">
            <div class="profile">
                <div class="post-author-img bg-color-teal newsman-object-fit profile-img">
                    <img src="./img/user2.png" alt="user2">
                </div>
                <h2>{{ Auth::user()->name }}</h2>
                <div class="form-wrapper single-page newsman-block">
                    <form method="POST" action="{{ route('partner.store', ['user' => Auth::user()->id]) }}">
                        @csrf
                        <div class="form-wrapper__inner">
                            <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                                @if ($errors->has('partner_email'))
                                        Вашої пари не знайдено
                                        <p>Перевірте введений емейл</p>
                                @else
                                        Введи емейл своєї пари
                                @endif
                            </div>
                            <div class="form-wrapper__content">
                                <input class="input-text" type="email" placeholder="Email">
                                @error('partner_email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-wrapper__button">
                                <button type="submit">Зберегти</button>
                            </div>

                        </div>
                    </form>
                </div>
                <div class="row">
                    <button class="col display-inline-block button button-outline button-round padding-left padding-right">Edit Profile</button>
                </div>

            </div>
        </div>
    </div>
    <!-- -->
    <div class="form-wrapper newsman-block">
        <form method="POST" action="{{ route('profile.update', ['user' => Auth::user()->id]) }}">
            @csrf
            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Змінити ім'я
                </div>
                <div class="form-wrapper__content">
                    <input class="input-text @error('name') is-invalid @enderror" type="text" placeholder="Edit Name" name="name" value="{{ old('name') }}" required autocomplete="name">
                    @error('name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                    <input class="input-text @error('current_password') is-invalid @enderror" type="password" placeholder="Current Password" name="current_password" required autocomplete="current_password">
                    @error('current_password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                @if (session('status'))
                    <div class="alert alert-success">
                        {{ session('status') }}
                    </div>
                @endif
                <div class="form-wrapper__button">
                    <button type="submit">Змінити</button>

                </div>

            </div>
        </form>
    </div>
@endsection