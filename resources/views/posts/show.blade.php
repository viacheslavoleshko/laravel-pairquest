@extends('layouts.app')

@section('title')
    <title>Posts</title>
@endsection

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
                        <a href="#" class="badge color-red text-color-white">Health news</a>
                    </div>
                    <h2>{{ $post->title }}</h2>
                    <div class="post-author display-flex align-items-center">
                        <div class="post-author-img bg-color-pink newsman-object-fit">
                            <img src="/img/user6.png" alt="user6">
                        </div>
                        <div class="post-author-infos margin-left-half">
                            <span class="post-author-name display-block text-semibold"><a href="/profile/">Mike Fox</a></span>
                            <span class="post-author-extra">San francisco</span>
                        </div>
                    </div>
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
            <div class="block-title-medium no-margin block-title text-semibold">Popular Topics</div>
            <div class="newsman-opacity block-title no-margin newsman-block-subtitle">Read trending news</div>
        </div>
        <div class="newsman-badge">
            <a href="#" class="badge bg-color-white text-color-black">SEE ALL</a>
        </div>
        </div>
        <div class="newsman-block-content">
        <div class="big-list-post">
            <div class="blog-list-wrapper">
            <div class="blog-list display-flex align-items-start">
                <div class="blog-list-img newsman-object-fit">
                <img src="/img/09.jpg" alt="bl1">
                </div>
                <div class="blog-list-infos margin-left">
                <div class="newsman-badge">
                    <a href="#" class="badge color-purple text-color-white">Health news</a>
                </div>
                <h2 class="margin-bottom-half"><a href="/single/">Physical distancing. Image created by Samuel Rodriguez.</a></h2>
                <span>Sience . 26 May, 2020</span>
                </div>
            </div>
            <!-- -->
            <div class="blog-list display-flex align-items-start">
                <div class="blog-list-img newsman-object-fit">
                <img src="/img/10.jpg" alt="bl2">
                </div>
                <div class="blog-list-infos margin-left">
                <div class="newsman-badge">
                    <a href="#" class="badge color-lightblue text-color-white">Health news</a>
                </div>
                <h2 class="margin-bottom-half">
                    <a href="/single/">This piece is about turning a negative into positive.</a>
                </h2>
                <span>Sience . 26 May, 2020</span>
                </div>
            </div>
            <!-- -->
            <div class="blog-list display-flex align-items-start">
                <div class="blog-list-img newsman-object-fit">
                <img src="/img/11.jpg" alt="bl2">
                </div>
                <div class="blog-list-infos margin-left">
                <div class="newsman-badge">
                    <a href="#" class="badge color-teal text-color-white">Health news</a>
                </div>
                <h2 class="margin-bottom-half">
                    <a href="/single/"> Stay Home Safe for World. Image created by Dzana Serdarevic </a>
                </h2>
                <span>Sience . 26 May, 2020</span>
                </div>
            </div>
            <!-- -->
            </div>
        </div>
        </div>
    </div>
@endsection