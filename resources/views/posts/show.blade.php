@extends('layouts.app')

@section('title')
    <title>Posts</title>
@endsection

@section('content')
    <h4>{{ $post->title }}</h4>
    <p>{{ $post->content }}</p>
@endsection