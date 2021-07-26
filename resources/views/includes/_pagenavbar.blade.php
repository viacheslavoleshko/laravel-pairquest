<div class="navbar navbar-transparent">
    <div class="navbar-bg"></div>
    <div class="navbar-inner">
        <div class="left">
            <a href="{{ redirect()->back()->getTargetUrl() }}" class="link back">
            <i class="icon icon-back"></i>
            </a>
        </div>
        <div class="title title-navbar-transparent">@yield('title')</div>
    </div>
</div>