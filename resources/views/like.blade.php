@extends('layouts.app')

@section('title', 'Like Quest')


@section('content')
    @include('includes._navbar')
    <div class="form-wrapper single-page more-page newsman-block">
        <form method="POST" action="{{ route('like', ['detailed_task' => $detailed_task->id]) }}">
            @csrf
            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Чи содобався вам квест?
                </div>
                <div class="form-wrapper__content">

                    <div class="form-wrapper__content-info">
                        <div class="form-wrapper__content-title">
                            Завдання
                        </div>
                        <div class="form-wrapper__content-text">
                            {{ $detailed_task->description }}
                        </div>
                    </div>

                </div>

                <div class="form-wrapper__button">
                    <button type="submit" name="is_like" value="1">Так</button>
                    <button type="submit" class="Reject" name="is_like" value="0">Ні</button>
                </div>

            </div>

        </form>
    </div>
@endsection
