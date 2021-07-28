@extends('layouts.app')

@section('title', 'Create Quest')

@section('content')
    @include('includes._navbar')
    <!-- Section -->
    <div class="form-wrapper single-page more-page newsman-block">
        <form>


            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Хто організатр
                </div>

                <div class="form-wrapper__content">
                    <a class="button-link" href="{{ route('quest-organisator', ['organisator' => 1]) }}">Я</a>
                    <a class="button-link" href="{{ route('quest-organisator', ['organisator' => 0]) }}">Партнер</a>
                </div>
            </div>

        </form>
    </div>
@endsection
