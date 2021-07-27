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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/please-wait/0.0.5/please-wait.min.css" integrity="sha512-qHOnOjE4dPoo197XSBBgRB4bcqwiJkbZhvtvX/djtgkzEYLZtI4aods6PRPTNe8Yok1/O0CZnH0SkAvXQx4Vdg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/framework7.bundle.min.css">
    
    <link rel="stylesheet" href="/css/app.css">
    <link rel="apple-touch-icon" href="/img/f7-icon-square.png">
    <link rel="icon" href="/img/f7-icon.png">
    @laravelPWA
</head>

<body class="theme-dark color-theme-white">
    <div id="app" class="framework7-root">
        <div class="view view-main view-init safe-areas" data-master-detail-breakpoint="800" data-url="/">
            <div class="page page-home " aria-hidden="true">
                <div class="page-content " data-aos="fade-up"  data-aos-delay="1200">
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
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#F32626" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                            <span class="tabbar-label">Discover</span>
                        </a>
                        <a class="link {{ Route::currentRouteNamed('profile') ? 'tab-link-active' : '' }}" href="{{ route('profile') }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                            <span class="tabbar-label">Profile</span>
                        </a>
                        <a class="link {{ Route::currentRouteNamed('feedback') ? 'tab-link-active' : '' }}" href="{{ route('feedback') }}">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none"  xmlns="http://www.w3.org/2000/svg">
                            <path d="M5.50002 7.00004H16.5C16.7764 7.00004 17 6.7764 17 6.50002C17 6.22364 16.7764 6 16.5 6H5.50002C5.22364 6 5 6.22364 5 6.50002C5.00005 6.77644 5.22369 7.00004 5.50002 7.00004Z" fill="currentColor"/>
                            <path d="M11.5 12H5.50002C5.22364 12 5 12.2236 5 12.5C5 12.7764 5.22364 13 5.50002 13H11.5C11.7764 13 12 12.7764 12 12.5C12 12.2236 11.7764 12 11.5 12Z" fill="currentColor"/>
                            <path d="M22.086 3.00002C22.057 3.00002 22.0289 3.00728 22 3.00864V3.00002C22 1.897 21.1026 1 20 1H2.00002C0.897469 1 0 1.897 0 3.00002V22.5C0 22.7022 0.122063 22.8848 0.308578 22.9619C0.370125 22.9878 0.435516 23 0.499969 23C0.629859 23 0.757781 22.9493 0.8535 22.8535L5.70703 18H20C21.1026 18 22 17.1031 22 16V7.70678L23.4395 6.26758C23.4395 6.26758 23.4395 6.26758 23.4395 6.26711C23.7959 5.91067 24 5.4175 24 4.91406C24 3.85844 23.1416 3.00002 22.086 3.00002ZM21 16C21 16.5513 20.5517 17 20 17H5.49998C5.36719 17 5.2402 17.0527 5.14645 17.1465L0.999984 21.293V3.00002C0.999984 2.44877 1.44825 2.00003 1.99997 2.00003H20C20.5518 2.00003 21 2.44877 21 3.00002V3.34155C20.9051 3.4068 20.8143 3.47856 20.7324 3.56055L15.2921 9.00002H5.49998C5.22361 9.00002 4.99997 9.22366 4.99997 9.50003C4.99997 9.77641 5.22361 10 5.49998 10H14.4899L14.0098 12.4019C13.9766 12.566 14.0283 12.7354 14.1465 12.8536C14.2412 12.9483 14.3692 13 14.5 13C14.5323 13 14.5655 12.9966 14.5977 12.9903L17.0967 12.4903C17.1944 12.4707 17.2832 12.4234 17.3526 12.3535L21 8.70667V16ZM16.7529 11.5396L15.1377 11.8628L15.461 10.2456L19.9998 5.70681L21.2929 6.99995L16.7529 11.5396ZM22.7324 5.56056L22 6.29298L20.7067 4.99975L21.4394 4.26709C21.6093 4.09764 21.8447 4 22.0859 4C22.5898 4 23 4.41016 23 4.91406C23 5.1543 22.9023 5.39017 22.7324 5.56056Z" fill="currentColor"/>
                        </svg>

                            <span class="tabbar-label">Feedback</span>
                        </a>
                    </div>
                </div>
                <!-- /Toolbar -->
            @endauth
        </div>
    </div>

    <div class="pg-loading-screen pg-loading" style="background-color: #202020;">
        <div class="pg-loading-inner">
            <div class="pg-loading-center-outer">
                <div class="pg-loading-center-middle">
                    <h1 class="pg-loading-logo-header">
                        <img class="pg-loading-logo" src="/img/main-logo.svg">
                    </h1>
                    <div class="pg-loading-html pg-loaded">
                        <div class="sk-spinner sk-spinner-wave">
                            <div class="sk-rect1"></div>
                            <div class="sk-rect2"></div>
                            <div class="sk-rect3"></div>
                            <div class="sk-rect4"></div>
                            <div class="sk-rect5"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <script src="/js/macy.js"></script>
    <script src="/js/framework7.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/please-wait/0.0.5/please-wait.min.js" integrity="sha512-mEe6gLbPz5ZrXPgwBNL6KSNLjE1zvv4G31w/UdsGkaYrmFBLhGRH4iRI5SeoUppqdq/Ydn5A+ctDO2felJ8p5w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        function fadeOutEffect() {
            var fadeTarget = document.querySelector('.pg-loading');
            var fadeEffect = setInterval(function() {
                if (!fadeTarget.style.opacity) {
                    fadeTarget.style.opacity = 1;
                }
                if (fadeTarget.style.opacity > 0) {
                    fadeTarget.style.opacity -= 0.1;
                } else {
                    clearInterval(fadeEffect);
                    fadeTarget.remove();
                }
            }, 50);
        }
        setTimeout(function() {
            fadeOutEffect();
        }, 500);
    </script>

    <script>
        AOS.init();
    </script>

    @yield('javascript')
    
</body>

</html>