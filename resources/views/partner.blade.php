@extends('layouts.app')

@section('title')
    <title>Partner Email</title>
@endsection

@section('content')
<div class="main">
    <div class="main-title">
        @if ($errors->has('partner_email'))
            <h1>
                Вашої пари не знайдено
            </h1>
            <p>
                Перевірте введений емейл
            </p>
        @else
            <h1>
                Введи емейл своєї пари
            </h1>
        @endif
    </div>
    <div class="main__inner">
        <form method="POST" action="{{ route('partner.store', ['user' => Auth::user()->id]) }}">
            @csrf
            <div class="form-outline mb-4">
                <input type="email" id="form2Example1" class="form-control @error('partner_email') is-invalid @enderror" name="partner_email" value="{{ old('partner_email') }}" required autocomplete="partner_email" autofocus />
                <label class="form-label" for="form2Example1">Email</label>

                @error('partner_email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
            <a class="reg-link" href="{{ route('prefs') }}">Пропустити</a>
            <button type="submit" class="btn btn-success mb-4 btn-centr">Ввести</button>
        </form>
    </div>
</div>
@endsection
