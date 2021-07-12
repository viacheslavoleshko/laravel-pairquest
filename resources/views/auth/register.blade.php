@extends('layouts.app')

@section('title')
    <title>Registration</title>
@endsection

@section('content')
    <div class="main">
        <div class="main-title">
            <h1>
                Registration
            </h1>
        </div>
        <div class="main__inner">
            <form method="POST" action="{{ route('register') }}">
                @csrf
                <div class="form-outline mb-4">
                    <input type="email" id="form2Example1" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus/>
                    <label class="form-label" for="form2Example1">Email</label>

                    @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-outline mb-4">
                    <input type="password" id="form2Example2" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password" />
                    <label class="form-label" for="form2Example2">Password</label>

                    @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-outline mb-4">
                    <input type="text" id="form2Example3" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" />
                    <label class="form-label" for="form2Example3">Nickname</label>

                    @error('name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-outline mb-4">
                    <select class="form-select @error('gender') is-invalid @enderror" name="gender" value="{{ old('gender') }}" required autocomplete="gender" aria-label="Default select example">
                        <option selected disabled>Select gender</option>
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
                <a class="reg-link" href="{{ route('login') }}">Вхід</a>
                <button type="submit" class="btn btn-success mb-4 btn-centr">create account</button>
            </form>
        </div>
    </div>
@endsection
