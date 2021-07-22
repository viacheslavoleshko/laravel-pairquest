@extends('layouts.app')

@section('title')
    <title>Posts</title>
@endsection

@section('content')
    <ul>
        @foreach ($posts as $post)
            <li><a href="{{ route('posts.show', ['post' => $post->id]) }}">{{ $post->title }}</a></li>
        @endforeach
    </ul>
@endsection