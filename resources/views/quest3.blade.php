@extends('layouts.app')

@section('title')
    <title>Create Quest</title>
@endsection

@section('content')
    <div class="main">
        <div class="main-title">
            <h1>
                Коли відбудеться
            </h1>
        </div>
        <div class="main__inner">
            <form method="POST" action="{{ route('generator', ['user' => Auth::user()->id]) }}">
                @csrf
                <div class="form-date">
                    <input type="datetime-local" name="quest_start" class="form-control @error('quest_start') is-invalid @enderror" value="{{ old('quest_start') }}">
                </div>
                @error('quest_start')
                    <div class="alert alert-danger">
                        {{ $message }}
                    </div>
                @enderror
                <button type="submit" class="btn btn-success mb-4 btn-centr">Далі</button>
            </form>
        </div>
    </div>
@endsection
