
@extends('layouts.admin.app') 

@section('content')
<div class="row g-3">
    <div class="col-12">
        <form action="{{ $resources['routes']['update']($resources['id']) }}" method="POST" 
            enctype="multipart/form-data" id="main-form">
            @csrf
            @method('PUT')
            <div class="card">
                <div class="card-header px-3 py-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="h6 mb-0 text-uppercase">{{ isset($resources['page_data']['title']) ? $resources['page_data']['title'] : 'Create Page' }}</h6>
                        <a href="{{ $resources['routes']['index'] }}" class="btn btn-primary btn-sm text-uppercase">
                            Go Back
                        </a>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">

                        @foreach ($resources['form_data'] as $key => $input)
                            {!! $input !!}
                        @endforeach

                    </div>
                </div>

                <div class="card-footer text-end px-3 py-2">
                    <button type="submit" class="btn btn-primary btn-sm">Save</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection


@push('js')
    <script>
        $(document).ready(function(){
            $('.input-images input').change(function(event){
                const showImagesContainer = $($(event.target).attr("show-images"));
                const files = Array.from($(event.target)[0].files);

                const filesHtml = files.map((file, index) => 
                    `<div class='show-input-image col-3'>
                        <figure>
                            <img src='${URL.createObjectURL(file)}' alt='image-${index}'/>
                            <p>${file.name}</p>
                        </figure>
                    </div>`
                ).join("\n");
                
                showImagesContainer.html(filesHtml);
            });

            $('.remove-file').click(function() {
                const index = $(this).parent().index();
                const oldFilesElement = $($(this).attr('old-files-id'));
                const oldFiles = JSON.parse(oldFilesElement.val());
                const removeOldFile = $(this).attr('old-file');

                const editableFile = oldFiles.filter((file) => file !== removeOldFile);
                oldFilesElement.val(JSON.stringify(editableFile))
                $(this).parent().remove(); // Remove file display from container
            });
        })


        $('#main-form').submit(function(e) {
            // Show SweetAlert loader
            Swal.fire({
                title: 'Please wait...',
                text: 'Your form is being submitted',
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading(); // Show the loading spinner
                }
            });
        });
    </script>

    @isset($resources['page_data']['scripts'])
        {!! $resources['page_data']['scripts'] !!}
    @endisset
@endpush

