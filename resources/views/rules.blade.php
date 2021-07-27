@extends('layouts.app')

@section('title', 'User Rules')

@section('content')
    @include('includes._navbar')
    <div class="form-wrapper single-page newsman-block">
        <form method="POST" action="{{ route('user.accept', ['user' => Auth::user()->id]) }}">
            @csrf
            <div class="form-wrapper__inner">
                <div class="form-wrapper__content">
                    <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                        Правила користувача
                </div>
                <div class="form-wrapper__inner-text block-title-medium block-title text-semibold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis suscipit nisl, sed cursus erat. Donec at accumsan dolor, ac imperdiet dui. Vivamus eu purus congue orci vulputate ultricies id ac nulla. Ut sodales velit nec mi condimentum sagittis. Suspendisse venenatis non ipsum id dignissim. Vivamus consectetur massa metus, ac facilisis nisi dignissim ut. Vivamus porttitor augue sed ipsum porta, at gravida purus congue. Vivamus eget quam a nunc luctus eleifend ut consectetur lectus. Sed tempor nisi eu odio fermentum, quis pharetra sapien iaculis. Aliquam imperdiet velit sit amet risus imperdiet ultrices. Suspendisse ligula ipsum, vestibulum vitae convallis et, volutpat quis magna. Vivamus aliquam purus nec turpis efficitur, eu pellentesque magna vestibulum. Integer lacinia lorem id nisl vulputate, non egestas est eleifend. Sed non metus arcu. Ut ac nunc non lorem convallis rhoncus.
                    Fusce varius consequat eros, sit amet commodo nibh dignissim eget. Donec urna felis, vestibulum eget placerat ut, mattis suscipit nulla. Nullam iaculis urna finibus nisi venenatis sollicitudin. Ut nec enim gravida nibh luctus efficitur at non nibh. Duis sodales purus velit, in vehicula urna iaculis at. Fusce tempor nibh nec pellentesque vehicula. Integer non eleifend metus, vitae mattis tortor. Etiam maximus eget purus ac posuere. Vivamus sed lacinia nulla, in aliquam tortor. Nam maximus nulla eget vehicula porttitor.
                    Mauris pharetra commodo dui, vel eleifend velit scelerisque et. Duis sed libero augue. Suspendisse cursus nibh et tincidunt posuere. Fusce eu fermentum dui. Aliquam erat volutpat. Fusce ut risus ipsum. Proin molestie felis sed rutrum efficitur. Integer lobortis, urna nec blandit aliquam, justo quam dictum ligula, sit amet interdum lectus eros a tellus. Suspendisse vulputate sit amet magna condimentum euismod. In rhoncus volutpat elit nec rutrum. Donec at accumsan velit, eu luctus libero. Aenean purus mauris, hendrerit sed cursus a, fringilla vel erat. Vivamus accumsan mi sit amet faucibus finibus. Pellentesque id dolor vulputate, finibus elit aliquet, bibendum nisl. Maecenas ultricies euismod libero et dignissim.
                </div>
                </div>
                <div class="form-wrapper__button">
                    <button type="submit">Погоджуюсь</button>
                </div>

            </div>
        </form>
    </div>
@endsection
