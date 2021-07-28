<div class="navbar navbar-transparent">
    <div class="navbar-bg"></div>
    <div class="navbar-inner navbar-inner-profile">
        <div class="left">
            <a href="{{ redirect()->back()->getTargetUrl() }}" class="link back">
                <i class="icon icon-back"></i>
            </a>
            <div class="title title-navbar-transparent">@yield('title')</div>
        </div>
        @if(Route::currentRouteNamed('profile'))
            @auth
                <div class="navbar-inner-exit">
                    <a href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                        @csrf
                    </form>
                </div>
            @endauth
        @endif
    </div>
</div>