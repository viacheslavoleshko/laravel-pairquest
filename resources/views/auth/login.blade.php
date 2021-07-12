@extends('layouts.app')

@section('title')
    <title>Login</title>
@endsection

@section('content')
    <div class="main">
        <div class="main-title">
            <h1>
                Login
            </h1>
        </div>
        <div class="main__inner">
            <form method="POST" action="{{ route('login') }}">
                @csrf
                <div class="form-outline mb-4">
                    <input type="email" id="form2Example1" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus/>
                    <label class="form-label" for="form2Example1">Email </label>
                    
                    @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                

                <div class="form-outline mb-4">
                    <input type="password  @error('password') is-invalid @enderror"  id="form2Example2" class="form-control" name="password" required autocomplete="current-password"/>
                    <label class="form-label" for="form2Example2">Password</label>
                    
                    @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <a class="reg-link" href="{{ route('register') }}">Зареєструватися</a>
                <button type="submit" class="btn btn-success mb-4 btn-centr">Login</button>
            </form>
        </div>
    </div>
@endsection
