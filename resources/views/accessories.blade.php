@extends('layouts.app')

@section('title')
    <title>Add Accessories</title>
@endsection

@section('content')
<div class="main">
    <div class="main-title">
        <h1>
            Додати аксесуари
        </h1>
    </div>
    <div class="main__inner">
        <div class="main__inner-box">
            <form method="POST" action="{{ route('accessories.store', ['user' => Auth::user()->id]) }}">
                @csrf
                @foreach (Auth::user()->accessories as $accessory)
                    <div id="new_chq" class="form-input-item">
                        <div class="form-input-item-box mb-4 ">
                            <input type="text" id="form2Example3" name="accessories[]" class="form-control form-input-items" value="{{ old('accessories[]', $accessory->name) ?? null }}">
                            <select class="form-control form-input-items" name="preferences[]">
                                @foreach ($preferences as $preference)
                                    <option value="{{ $preference->id }}" {{ (old('preferences[]', $accessory->preference_id) == $preference->id  ? 'selected' : '') }}>{{ $preference->description}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                @endforeach
                @if (Auth::user()->accessories->isEmpty())
                    <div id="new_chq" class="form-input-item">
                        <div class="form-input-item-box mb-4 ">
                            <input type="text" id="form2Example3" name="accessories[]" class="form-control form-input-items">
                            <select class="form-control form-input-items" name="preferences[]">
                                @foreach ($preferences as $preference)
                                    <option value="{{ $preference->id }}">{{ $preference->description}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                @endif
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <button type="submit" class="btn btn-success mb-4 btn-centr">Далі</button>
            </form>
            <div class="btn-add-input"></div>
        </div>
    </div>
</div>
@endsection

@section('javascript')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $('.btn-add-input').on('click', function() {
            $('.form-input-item').before($(".form-input-item-box:last").clone());
        });
    </script>
@endsection
