@extends('layouts.app')

@section('title')
    <title>Preferences</title>
@endsection

@section('content')
<div class="main">
    <div class="main-title">
        <h1>
            Вподобання
        </h1>
    </div>
    <div class="main__inner">
        <form method="POST" action="{{ route('prefs.store', ['user' => Auth::user()->id]) }}">
            @csrf
            @foreach ($preferences as $key => $preference)
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="preferences[]" value="{{ $preference->id }}" id="flexCheckDefault" {{ old('preferences[]', Auth::user()->preferences->contains('id', $preference->id) ? 'checked' : '') }} />
                    <label class="form-check-label" for="flexCheckDefault">
                        {{ $preference->description }}
                    </label>
                </div>
            @endforeach
            @error('preferences')
                <div class="alert alert-danger">
                    {{ $message }}
                </div>
            @enderror


            <div class="main-title">
                <h1>
                    Локації
                </h1>
            </div>
            @foreach ($locations as $location)
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="{{ $location->id }}" id="flexCheckDefault" name="locations[]" {{ old('locations[]', Auth::user()->locations->contains('id', $location->id) ? 'checked' : '') }} />
                    <label class="form-check-label" for="flexCheckDefault">
                        {{ $location->name }}
                    </label>
                </div>
            @endforeach
            @error('locations')
                <div class="alert alert-danger">
                    {{ $message }}
                </div>
            @enderror


            <div class="main-title">
                <h1>
                    Рівень користувача
                </h1>
            </div>
            @foreach ($user_levels as $user_level)
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="{{ $user_level->id }}" id="flexCheckDefault" name="user_levels[]" {{ old('user_levels[]', Auth::user()->user_levels->contains('id', $user_level->id) ? 'checked' : '') }} />
                    <label class="form-check-label" for="flexCheckDefault">
                        {{ $user_level->name }}
                    </label>
                </div>
            @endforeach
            @error('user_levels')
                <div class="alert alert-danger">
                    {{ $message }}
                </div>
            @enderror

            <button type="submit" class="btn btn-success mb-4 btn-centr">Далі</button>
        </form>
    </div>
</div>
@endsection

@section('javascript')
@endsection
