@extends('layouts.app')

@section('title', 'Profile')

@section('content')
    @include('includes._pagenavbar')
    <div class="newsman-block no-margin">
        <div class="newsman-block-content">
            <div class="profile">
                <div class="post-author-img bg-color-teal newsman-object-fit profile-img">
                    @if(is_null(Auth::user()->avatar) && Auth::user()->gender_id == 1)
                        <img src="{{ Storage::url('users/default/dude.png') }}" alt="user2">
                    @elseif(is_null(Auth::user()->avatar) && Auth::user()->gender_id == 2)
                        <img src="{{ Storage::url('users/default/girl.png') }}" alt="user2">
                    @else
                    <img src="{{ Storage::url(Auth::user()->avatar) }}" alt="user2">
                    @endif
                </div>
                <h2>{{ Auth::user()->name }}</h2>
                <div class="form-wrapper ">
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
                                <input class="input-text" type="email" placeholder="Partner Email" name="partner_email" value="{{ old('partner_email', Auth::user()->partner_email ?? null) }}" required autocomplete="partner_email">
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
            </div>
        </div>
    </div>
    <!-- -->
    <div class="form-wrapper newsman-block">
        <form method="POST" action="{{ route('profile.update', ['user' => Auth::user()->id]) }}" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Змінити ім'я
                </div>
                <div class="form-wrapper__content">
                    <div class="form-wrapper__content-file">
                        <input id="upload-file" class="input-text @error('avatar') is-invalid @enderror"  type="file" name="avatar">
                        <label class="input-text @error('avatar') is-invalid @enderror" for="upload-file">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-upload-cloud"><polyline points="16 16 12 12 8 16"></polyline><line x1="12" y1="12" x2="12" y2="21"></line><path d="M20.39 18.39A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.3"></path><polyline points="16 16 12 12 8 16"></polyline></svg>

                                Виберіть файл</label>
                    </div>
      
                    <input class="input-text @error('name') is-invalid @enderror" type="text" placeholder="Edit Name" name="name" value="{{ old('name', Auth::user()->name ?? null) }}" required autocomplete="name">
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