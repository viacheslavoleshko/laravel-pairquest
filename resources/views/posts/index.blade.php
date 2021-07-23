@extends('layouts.app')

@section('title')
    <title>News</title>
@endsection

@section('content')
    @include('includes._navbar')
    <!-- World News TV -->
    <div class="newsman-block no-border">
        <div class="newsman-block-title display-flex align-items-center justify-content-space-between">
            <div>
                <div class="block-title-medium no-margin block-title text-semibold">World News TV</div>
                <div class="newsman-opacity block-title no-margin newsman-block-subtitle">Read trending news</div>
            </div>
            <div class="newsman-badge">
                <a href="#" class="badge bg-color-white text-color-black">SEE ALL</a>
            </div>
        </div>
        <div class="newsman-block-content">
            <div id="masonry">
                @foreach ($posts as $post)
                    <div class="masonry-item">
                        <img src="./img/04.jpg" alt="m1" class="masonry-img">
                        <div class="post-title">
                            <a href="{{ route('posts.show', ['post' => $post->id]) }}">
                                <h2 class="no-margin-bottom">{{ $post->title }}</h2>
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection