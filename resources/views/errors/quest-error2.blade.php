@extends('layouts.app')

@section('title')
    <title>Quest Error</title>
@endsection

@section('content')
<div class="main">
    <div class="main-title">
        <h1>
            Неможливо створити квест, не існує можливих комбінацій
        </h1>
        <p>
            Немає підходящих завдань під ваші параметри
        </p>
    </div>
    <div class="main__inner">
        <form>
            <a class="btn-link" href="{{ route('prefs') }}">Оновити список вподобань</a>
        </form>
    </div>
</div>
@endsection
