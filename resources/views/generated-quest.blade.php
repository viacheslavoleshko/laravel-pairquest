@extends('layouts.app')

@section('title', 'Enjoy your Quest')


@section('content')
    @include('includes._navbar')
    <!-- form -->
    <div class="form-wrapper single-page more-page newsman-block">
        <form method="POST" action="{{ route('end-quest', ['generated_task' => $generated_task]) }}">
            @csrf
            <div class="form-wrapper__inner">
                <div class="form-wrapper__inner-title block-title-medium block-title text-semibold">
                    Ваш новий квест
                </div>
                <div class="form-wrapper__content">

                    <div class="post-grid">
                        <div class="post-grid-img newsman-object-fit">
                            <img src="{{ Storage::url($location_description_image) }}" alt="g1">
                            <img src="{{ Storage::url($task_image) }}" alt="g2">
                            <img src="{{ Storage::url($detailed_task->image) }}" alt="g3">
                        </div>
                    </div>
                    @if (isset($generated_task->started_at)) 
                        <div class="form-wrapper__content-info">
                            <div class="form-wrapper__content-title">
                                Час
                            </div>
                            <div class="form-wrapper__content-text">
                                {{ Carbon\Carbon::parse($generated_task->started_at)->locale('uk')->calendar() }}
                            </div>
                        </div>
                    @endif
                    <div class="form-wrapper__content-info">
                        <div class="form-wrapper__content-title">
                            Завдання
                        </div>
                        <div class="form-wrapper__content-text">
                            {{ $location_description }} {{ $task_description }} 
                            @if(isset($custom_detailed_task))
                                {{ $custom_detailed_task }}
                            @else
                                {{ $detailed_task->description }}
                            @endif
                        </div>
                    </div>
                    @if (isset($detailed_task->accessories) && $detailed_task->accessories->isNotEmpty()) 
                        <div class="form-wrapper__content-info">
                            <div class="form-wrapper__content-title">
                                Аксесуари
                            </div>
                        </div>
                        <div class="list-friends">
                            @foreach ($detailed_task->accessories as $accessory)
                                <div class="display-flex align-items-center justify-content-space-between">
                                    <div class="post-author display-flex align-items-center">
                                        <div class="post-author-img bg-color-orange newsman-object-fit">
                                            <img src="{{ Storage::url($accessory->image) }}" alt="user3">
                                        </div>
                                        <div class="post-author-infos margin-left-half">
                                            <span class="post-author-name display-block text-semibold"><a href="#">{{ $accessory->name }}</a></span>
                                            <span class="post-author-extra">{{ $accessory->description }}</span>
                                        </div>
                                    </div>
                                    <div class="newsman-badge">
                                        <a href="{{ $accessory->url }}" class="badge color-yellow text-color-black">Купити</a>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endif

                    <div class="form-wrapper__content-info">
                        <div class="form-wrapper__content-title">
                            Правила
                        </div>
                        <div class="form-wrapper__content-text">
                            {{ $task_rule->description }}
                        </div>
                    </div>
                    <div class="form-wrapper__content-info">
                        <div class="form-wrapper__content-title">
                            Ідея
                        </div>
                        <div class="form-wrapper__content-text">
                            {{ $detailed_task_notion->description }}
                        </div>
                    </div>
                </div>

                <div class="form-wrapper__button">
                    <button class="Reject" type="submit" name="is_rejected" value="1">Відхилити</button>
                    <button type="submit" name="is_rejected" value="0">Закінчити</button>
                </div>

            </div>
        </form>
    </div>
@endsection
