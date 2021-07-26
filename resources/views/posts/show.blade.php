@extends('layouts.app')

@section('title', 'Назад')


@section('content')
    <!-- Navbar -->
    @include('includes._pagenavbar')
    <!-- -->
    <div class="newsman-block no-margin">
        <div class="newsman-block-content">
            <div class="single-page">
                <img src="/img/22.jpg" alt="bp1">
                <div class="margin-top">
                    <div class="newsman-badge">
                        <a href="#" class="badge color-red text-color-white">{{ $post->category->name }}</a>
                    </div>
                    <h2>{{ $post->title }}</h2>
                    <div class="single-post-content margin-top">
                        <p>{{ $post->content }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -->
    <!-- / section -->
    <div class="newsman-block no-border">
        <div class="newsman-block-title display-flex align-items-center justify-content-space-between">
            <div>
                <div class="block-title-medium no-margin block-title text-semibold">More Topics from {{ $post->category->name }}</div>
                <div class="newsman-opacity block-title no-margin newsman-block-subtitle">Read trending news</div>
            </div>
        </div>
        <div class="newsman-block-content">
            <div class="big-list-post">
                <div class="blog-list-wrapper">
                    @foreach ($posts as $post)
                    <div class="blog-list display-flex align-items-start">
                        <div class="blog-list-img newsman-object-fit">
                            <img src="/img/09.jpg" alt="bl1">
                        </div>
                        <div class="blog-list-infos margin-left">
                            <div class="newsman-badge">
                                <a href="#" class="badge color-purple text-color-white">{{ $post->category->name }}</a>
                            </div>
                            <h2 class="margin-bottom-half"><a href="{{ route('posts.show', ['post' => $post->id]) }}">{{ $post->title }}</a></h2>
                            <span>Sience {{ $post->created_at->isoFormat('D MMMM, YYYY')}}</span>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection