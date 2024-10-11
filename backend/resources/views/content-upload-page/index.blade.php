@extends('layouts.admin.app')

@section('content')
<style>
    /* thead th:first-child,
    tbody td:first-child{
        text-align: end;
        width: 80%;
        display: flex;
        align-items: center;
        justify-content: flex-start;
    }

    th,
    td {
        text-align: start !important;
        margin: 0 auto;
    } */
    
    thead th:last-child,
    tbody td:last-child{
        text-align: end;
        width: 80%;
        display: flex;
        align-items: center;
        justify-content: flex-end;
    }

    .dataTable thead th{
        text-align: start !important;
    }
</style>
<div class="row g-3">
    <div class="col-12">
        <div class="card">
            <div class="card-header px-3 py-2">
                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="h6 mb-0 text-uppercase">{{ isset($resources['page_data']['title']) ? $resources['page_data']['title'] : 'Manage Page' }}</h6>
                    @isset($resources['page_data']['disabled_add_new_btn'])
                        @else
                        <a href="{{ $resources['routes']['create'] }}" class="btn btn-primary btn-sm text-uppercase">Add New</a>
                    @endisset
                </div>
            </div>
            <div class="card-body">
                <table class="dataTable table align-middle" style="width:100%">
                    <thead>
                        <tr class="text-nowrap">
                            @foreach ($resources['items']['labels'] as $label)
                                <th class="text-center">{{ $label }}</th>
                            @endforeach
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    
                    @isset($resources['page_data']['disabled_multiple_delete'])
                        @else
                        <tfoot>
                            <tr class="text-start">
                                <th style="padding-left: 16px;">
                                    <div class="custom-control custom-checkbox text-start">
                                        <input type="checkbox" class="custom-control-input" id="selectAll">
                                        <label class="custom-control-label" for="selectAll"></label>
                                    </div>
                                </th>
                                <th>
                                    <button type="button" name="bulk_delete"
                                        data-url="{{ $resources['routes']['destroy'](0) }}" id="bulk_delete"
                                        class="btn btn btn-xs btn-danger">Delete</button>
                                </th>
                            </tr>
                        </tfoot>
                    @endisset
                    
                </table>
            </div>
        </div>
    </div>
</div>
@endsection 


@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            var table = $('.dataTable').dataTable({
                processing: true,
                serverSide: true,
                scrollX: true,
                ajax: {
                    url: `{{ $resources['routes']['index'] }}`,
                    type: "GET",
                },
                columns: @json($resources['items']['columns']),
            });
            
        });
    </script>

    @isset($resources['page_data']['scripts'])
        {!! $resources['page_data']['scripts'] !!}
    @endisset
@endpush


