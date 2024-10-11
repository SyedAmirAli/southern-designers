
<!DOCTYPE html>
<html lang="en">
    <!-- HTML Head Section -->
    @include('layouts.client.partial.head')

    <body class="font-poppins w-full">
        <main class="w-full"> <!-- Main Contents Start --->
            @yield('contents')
        </main> <!-- Main Contents Ends ---> 
          
          @stack('js') <!-- JavaScript -->
          @include('layouts.client.partial.foot') <!-- Footer Areas -->
    </body>
</html>
<!-- Done this -->
