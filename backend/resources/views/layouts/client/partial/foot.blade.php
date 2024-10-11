@include('layouts.client.partial.footer') <!-- Footer Areas -->
@include('sweetalert::alert') <!-- Sweet Alert With Alert/Error/Success Message -->
      
@if (session()->has('error'))
    <script>
        swalToast('error', "{{ session()->get('error') }}")
    </script>
@endif
@if (session()->has('success'))
    <script>
        swalToast('success', "{{ session()->get('success') }}")
    </script>
@endif
@if ($errors->any())
    <script>
      const errors = @json($errors->all());
      console.log(errors);

      errors.forEach(error => {
        swalToast('error', error);
      });
    </script>
@endif

