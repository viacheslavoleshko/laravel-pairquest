@extends('layouts.app')

@section('title')
    <title>Partner Error</title>
@endsection

@section('content')
<div class="main">
    <div class="main-title">
        <h1>
            Створення квесту неможливе
        </h1>
        <p>
            Чекаємо підтвердження від вашого партнера
        </p>
    </div>
    <div class="main__inner">
        <form>
            <a class="btn-link" href="{{ route('partner') }}">Оновити емейл партнера</a>
        </form>
    </div>
</div>
@endsection
