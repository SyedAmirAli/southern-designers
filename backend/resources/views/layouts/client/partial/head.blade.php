@php $additional_resource = fn($key) => App\Helper\AdditionalResources::appInfo($key); @endphp
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{{ $additional_resource('title') }} @yield('page-title')</title>
    <meta name="description" content="{{ $additional_resource('meta_keyword') }}">
    <meta name="keywords" content="{{ $additional_resource('meta_description') }}">

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Oswald:wght@200;300;400;500;600;700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,900&family=Roboto+Mono:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,700&display=swap"
        rel="stylesheet"
    />
    <!--- favicon--> 
    <link rel="icon" href="{{ asset($additional_resource('favicon')) }}" type="image/x-icon" />

    <style>
        @font-face {
            font-family: AdorNormal;
            src: url("{{ asset('fonts/ador-noirrit/regular.ttf') }}");
            font-weight: 400;
            font-style: normal;
        }
        @font-face {
            font-family: AdorBold;
            src: url("{{ asset('fonts/ador-noirrit/bold.ttf') }}");
            font-weight: 900;
            font-style: bold;
        }
    </style>

    {{-- @viteReactRefresh --}}
    {{-- @vite(['resources/css/app.css']) --}}

    <link rel="stylesheet" href="{{ asset('/assets/css/build.css') }}">

    <!-- Includes The Scripts assets -->
    @include('layouts.client.partial.script')

    <!-- Custom Styles -->
    @stack('style')

</head>