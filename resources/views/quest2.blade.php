@extends('layouts.app')

@section('title')
    <title>Create Quest</title>
@endsection

@section('content')
    <div class="main">
        <div class="main-title">
            <h1>
                Хто організатор
            </h1>
        </div>
        <div class="main__inner">
            <form>
                <a class="btn-link" href="{{ route('quest-organisator', ['organisator' => 1]) }}">Я</a>
                <a class="btn-link" href="{{ route('quest-organisator', ['organisator' => 0]) }}">Партнер</a>
            </form>
        </div>
    </div>
@endsection
