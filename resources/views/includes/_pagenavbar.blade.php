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
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0)">
                                <path d="M23.923 10.6178C23.872 10.4958 23.799 10.3848 23.706 10.2918L20.707 7.29277C20.316 6.90277 19.684 6.90277 19.293 7.29277C18.902 7.68376 18.902 8.31676 19.293 8.70676L20.586 9.99976H15C14.447 9.99976 14 10.4477 14 10.9997C14 11.5517 14.447 11.9997 15 11.9997H20.586L19.293 13.2927C18.902 13.6837 18.902 14.3167 19.293 14.7067C19.488 14.9027 19.744 14.9997 20 14.9997C20.256 14.9997 20.512 14.9027 20.707 14.7067L23.706 11.7077C23.799 11.6157 23.872 11.5047 23.923 11.3817C24.024 11.1378 24.024 10.8618 23.923 10.6178Z" fill="currentColor"/>
                                <path d="M17 14C16.447 14 16 14.448 16 15V20H12V3.99998C12 3.55898 11.71 3.16898 11.287 3.042L7.81397 2.00002H16V7.00003C16 7.55203 16.447 8.00002 17 8.00002C17.553 8.00002 18 7.55203 18 7.00003V1.00003C18 0.447984 17.553 0 17 0H0.999984C0.963984 0 0.931969 0.015 0.897 0.0189844C0.849984 0.024 0.807 0.0319687 0.762 0.0429844C0.657 0.0699844 0.561984 0.111 0.473016 0.166969C0.451031 0.180984 0.424031 0.181969 0.403031 0.197953C0.394969 0.204 0.391969 0.215016 0.383953 0.221016C0.274969 0.306984 0.183984 0.411984 0.117984 0.537C0.103969 0.564 0.100969 0.593016 0.09 0.621C0.0579844 0.696984 0.0230156 0.771 0.0110156 0.855C0.006 0.885 0.015 0.912984 0.0140156 0.942C0.0130312 0.962016 0 0.980016 0 0.999984V21C0 21.477 0.336984 21.887 0.804 21.98L10.804 23.98C10.869 23.994 10.935 24 11 24C11.229 24 11.454 23.9211 11.634 23.773C11.865 23.583 12 23.3 12 23V22H17C17.553 22 18 21.552 18 21V15C18 14.448 17.553 14 17 14Z" fill="currentColor"/>
                            </g>
                            <defs>
                                <clipPath id="clip0">
                                    <rect width="24" height="24" fill="white"/>
                                </clipPath>
                            </defs>
                        </svg>
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                        @csrf
                    </form>
                </div>
            @endauth
        @endif
    </div>
</div>