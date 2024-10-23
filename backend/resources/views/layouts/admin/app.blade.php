@php $admin_app_info = fn($key) => App\Helper\AdditionalResources::adminAppInfo($key);@endphp
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}" />

    <title>{{ $admin_app_info('title') }}</title>
    <link rel="shortcut icon"
        href="{{ $admin_app_info('favicon') }}"
        type="image/x-icon">
    @include('layouts.admin.partial.styles')
    @include('layouts.admin.partial.alert')
    <style>
        :root {
            --bs-primary: @php echo $admin_app_info('primary_color'); @endphp;
            --bs-secondary: @php echo $admin_app_info('secondary_color'); @endphp;
        }

        input, textarea {
            background-color: rgb(241 245 249) !important;
        }
    </style>
</head>

<body class="bg-light">
    <div class="overflow-hidden site-wrapper @if (Session::has('sidebar-collapse')) session-sidebar @endif">
        @include('layouts.admin.partial.sidebar')

        <div class="content-wrapper">
            @include('layouts.admin.partial.header')
            <div class="content">
                <div class="p-sm-4 p-3">
                    @yield('content')
                </div>
            </div>
            @include('layouts.admin.partial.footer')
        </div>
    </div>
    <!-- End Site Wrapper -->

    @include('sweetalert::alert')
    @include('layouts.admin.partial.scripts')

    @stack('js')
</body>

</html>