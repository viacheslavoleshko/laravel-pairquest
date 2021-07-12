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
                    {{-- {{ dump(Auth::user()->preferences->contains('id', $preference->id) ) }} --}}
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
                    Рівень користувача
                </h1>
            </div>
            @foreach ($user_levels as $user_level)
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="{{ $user_level->id }}" id="flexCheckDefault" name="user_level" {{ (old('user_level', Auth::user()->user_level_id) == $user_level->id ? 'checked' : '') }} />
                    <label class="form-check-label" for="flexCheckDefault">
                        {{ $user_level->name }}
                    </label>
                </div>
            @endforeach
            @error('user_level')
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $('form').eq(0).on("change", function(e) {
            $('input[name^=user_level]').each(function() {
                if (e.target != this)
                    this.checked = false;
            });
        })

        // $('form').eq(0).on('submit', function() {
        //     return $('input[name^=field]:checked:enabled').length == 1;
        // });
    </script>
@endsection
