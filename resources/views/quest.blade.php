@extends('layouts.app')

@section('title')
    <title>Create Quest</title>
@endsection

@section('content')
    <div class="main">
        <div class="main-title">
            <h1>
                Створити новий квест
            </h1>
        </div>
        <div class="main__inner">
            <form>
                <a class="btn-link" href="">Короткий</a>
                <a class="btn-link" href="">На вечір</a>
                <a class="btn-link" href="">Великий квест</a>

                <a class="reg-link" href="#">Редагувати вподообання</a>
            </form>
        </div>
    </div>
@endsection
