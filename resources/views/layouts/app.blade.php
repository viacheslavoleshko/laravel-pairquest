<!DOCTYPE html>
<html lang="en" class="md device-pixel-ratio-2 device-desctop device-windows">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="theme-color" content="#000000">
    <meta http-equiv="Content-Security-Policy" content="default-src * 'self' 'unsafe-inline' 'unsafe-eval' data: gap:">
    <title>@yield('title')</title>
    
    <link rel="stylesheet" href="/css/framework7.bundle.min.css">
    <link rel="stylesheet" href="/css/app.css">
    <link rel="apple-touch-icon" href="/img/f7-icon-square.png">
    <link rel="icon" href="/img/f7-icon.png">
    @laravelPWA
</head>

<body class="theme-dark color-theme-white">
    <div id="app" class="framework7-root">
        <div class="view view-main view-init safe-areas" data-master-detail-breakpoint="800" data-url="/">
            <div class="page page-home" aria-hidden="true">
                <div class="page-content ">
                    <!-- Section -->
                    @yield('content')
                </div>
            </div>
            <div id="fix-f7">
            </div>
            @auth
                <!-- Toolbar -->
                <div class="toolbar toolbar-bottom tabbar-labels">
                    <div class="toolbar-inner">
                        <a class="link {{ Route::currentRouteNamed('posts.*') ? 'tab-link-active' : '' }}" href="{{ route('posts.index') }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                            <span class="tabbar-label">News</span>
                        </a>
                        <a class="link {{ Route::currentRouteNamed('prefs') ? 'tab-link-active' : '' }}" href="{{ route('prefs') }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
                            <span class="tabbar-label">Preferences</span>
                        </a>
                        <a class="link {{ Route::currentRouteNamed('quest') ? 'tab-link-active' : '' }}" href="{{ route('quest') }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                            <span class="tabbar-label">Discover</span>
                        </a>
                        <a class="link {{ Route::currentRouteNamed('profile') ? 'tab-link-active' : '' }}" href="{{ route('profile') }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                            <span class="tabbar-label">Profile</span>
                        </a>
                        <a class="link {{ Route::currentRouteNamed('feedback') ? 'tab-link-active' : '' }}" href="{{ route('feedback') }}">
                            <i data-feather="square"></i>
                            <span class="tabbar-label">Feedback</span>
                        </a>
                    </div>
                </div>
                <!-- /Toolbar -->
            @endauth
        </div>
    </div>
    <script src="/js/macy.js"></script>
    <script src="/js/feather.min.js"></script>
    <script src="/js/framework7.bundle.min.js"></script>
    <script src="/js/routes.js"></script>
    <script src="/js/app.js"></script>
    @yield('javascript')
</body>

</html>