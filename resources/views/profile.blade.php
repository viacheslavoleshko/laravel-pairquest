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
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0)">
                                <path d="M19.9963 8.82204C18.8871 4.40324 14.4058 1.72031 9.98704 2.82953C6.53385 3.69639 4.02646 6.68093 3.76811 10.2318C1.31621 10.6362 -0.343691 12.9516 0.0606558 15.4035C0.420101 17.5833 2.30886 19.1796 4.51803 19.1709H8.26762V17.671H4.51803C2.86136 17.671 1.51836 16.328 1.51836 14.6714C1.51836 13.0147 2.86136 11.6717 4.51803 11.6717C4.93222 11.6717 5.26794 11.3359 5.26794 10.9218C5.2642 7.19424 8.28294 4.16945 12.0105 4.16575C15.2372 4.16251 18.0148 6.44367 18.639 9.6094C18.7006 9.92549 18.9571 10.167 19.2764 10.2093C21.3266 10.5013 22.7519 12.3999 22.46 14.4501C22.1978 16.291 20.626 17.6617 18.7665 17.671H15.7668V19.1709H18.7665C21.6656 19.1621 24.0088 16.8047 24 13.9055C23.9926 11.4922 22.3408 9.39474 19.9963 8.82204Z" fill="white"/>
                                <path d="M11.484 11.8892L8.48438 14.8889L9.54176 15.9462L11.2666 14.2289V21.4206H12.7664V14.2289L14.4837 15.9462L15.5411 14.8889L12.5414 11.8892C12.2489 11.5984 11.7766 11.5984 11.484 11.8892Z" fill="white"/>
                                </g>
                                <defs>
                                <clipPath id="clip0">
                                <rect width="24" height="24" fill="white"/>
                                </clipPath>
                                </defs>
                            </svg>

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