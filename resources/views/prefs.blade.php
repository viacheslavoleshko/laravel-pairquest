@extends('layouts.app')

@section('title', 'Preferences')

@section('content')
    @include('includes._navbar')
    <div class="form-wrapper single-page more-page newsman-block">
        <form method="POST" action="{{ route('prefs.store', ['user' => Auth::user()->id]) }}">
            @csrf
            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Вподобання
                </div>
                <div class="form-wrapper__content">
                    <div class="form-wrapper__content-checkbox-wrapper">
                        @foreach ($preferences as $key => $preference)
                            <div class="form-wrapper__content-checkbox-inner">
                                <input id="preferences-{{$key}}" class="categories-radio" type="checkbox" name="preferences[]" value="{{ $preference->id }}" {{ old('preferences[]', Auth::user()->preferences->contains('id', $preference->id) ? 'checked' : '') }} >
                                <label class="fpreferences-{{$key}}" for="preferences-{{$key}}">
                                    {{ $preference->description }}
                                </label>
                            </div>
                        @endforeach
                        @error('preferences')
                            <div class="alert alert-danger">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                </div>

                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Локації
                </div>
                <div class="form-wrapper__content">
                    <div class="form-wrapper__content-checkbox-wrapper">
                        @foreach ($locations as $key => $location)
                            <div class="form-wrapper__content-checkbox-inner">
                                <input id="locations-{{$key}}" class="categories-radio" type="checkbox" name="locations[]" value="{{ $location->id }}" {{ old('locations[]', Auth::user()->locations->contains('id', $location->id) ? 'checked' : '') }} >
                                <label class="locations-{{$key}}" for="locations-{{$key}}">
                                    {{ $location->name }}
                                </label>
                            </div>
                        @endforeach
                        @error('locations')
                            <div class="alert alert-danger">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                </div>

                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Рівень користувача
                </div>
                <div class="form-wrapper__content">
                    <div class="form-wrapper__content-checkbox-wrapper">
                        @foreach ($user_levels as $key => $user_level)
                            <div class="form-wrapper__content-checkbox-inner">
                                <input id="level-{{$key}}" class="categories-radio" type="checkbox" value="{{ $user_level->id }}" name="user_levels[]" {{ old('user_levels[]', Auth::user()->user_levels->contains('id', $user_level->id) ? 'checked' : '') }} >
                                <label for="level-{{$key}}">
                                    {{ $user_level->name }}
                                </label>
                            </div>
                        @endforeach
                        @error('user_levels')
                            <div class="alert alert-danger">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                </div>

                <div class="form-wrapper__content">
                    <div class="checkbox">
                        <div class="checkbox-wrapper">
                                <div class="checkbox-inner">
                                    <input id="test-1" class="checkbox-categories" type="checkbox" name="field1">
                                    <label for="test-1">
                                        Вподобання 1
                                    </label>
                                </div>
                        </div>
                        <div class="checkbox-wrapper">
                                <div class="checkbox-inner">
                                    <input id="test-2" class="checkbox-categories" type="checkbox" name="field2">
                                    <label for="test-2">
                                        Вподобання 1
                                    </label>
                                </div>
                        </div>
                        <div class="checkbox-wrapper">
                                <div class="checkbox-inner">
                                    <input id="test-3" class="checkbox-categories" type="checkbox" name="field3">
                                    <label for="test-3">
                                        Вподобання 1
                                    </label>
                                </div>
                        </div>
                    </div>
                </div>

                <div class="form-wrapper__button">

                    <button type="submit">Далі</button>
                </div>

            </div>
        </form>
    </div>
@endsection

@section('javascript')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $('form').eq(0).on("change", function(e) {
    $('input[name^=field]').each(function() {
        if (e.target != this)
            this.checked = false;
    });
    console.log('1')
})

$('form').eq(0).on('submit', function() {
    return $('input[name^=field]:checked:enabled').length == 1;
});
</script>
@endsection
