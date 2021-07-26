@extends('layouts.app')

@section('title', 'Feedback')

@section('content')
    @include('includes._pagenavbar')
    <div class="form-wrapper single-page newsman-block">
        <form method="POST" action="{{ route('feedback.store', ['user' => Auth::user()->id]) }}">
            @csrf
            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Зворотній зв'язок
                </div>
                <div class="form-wrapper__content">
                    <select class="input-text select-content select-content-quest @error('feedback_type') is-invalid @enderror" name="feedback_type" required autocomplete="feedback_type">
                        <option selected disabled>Тип звернення</option>
                        @foreach ($feedback_types as $feedback_type)
                            <option value="{{ $feedback_type->id }}">{{ $feedback_type->name }}</option>
                        @endforeach
                    </select>
                    @error('feedback_type')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                    <textarea class="input-text @error('feedback') is-invalid @enderror" rows="5" cols="33"  placeholder="Type something here..." name="feedback" value="{{ old('feedback') }}" required></textarea>
                    @error('feedback')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-wrapper__button">
                    <button type="submit">Зберегти</button>
                </div>
                @if (session('status'))
                    <div class="alert alert-success">
                        {{ session('status') }}
                    </div>
                @endif
            </div>
        </form>
    </div>
@endsection