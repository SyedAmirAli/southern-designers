<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Http\Controllers\Controller;
use App\Models\PrimaryService;
use Illuminate\Http\Request;

class PrimaryServicesController extends Controller
{
    public ResourceAppManager $appManger;

    public function __construct()
    {
        $this->appManger = new ResourceAppManager(PrimaryService::class, 'home-page-primary-services');
    }

    // Display a listing of the resource.
    public function index()
    {
        return $this->appManger
            ->addPageData('title', 'Manage Primary Services')
            ->addDataTablesCheckboxColumn()
            ->addDataTablesColumn('Priority Serial', 'serial')
            ->addDataTablesColumn('Name', 'name')
            ->addDataTablesColumn('Button URL', 'btn_url')
            ->addDataTablesFileColumn('Thumbnail Image', 'image')
            ->addDataTablesStatusColumn()
            ->addDataTablesActionsColumns()
            ->addDataTablesRawColumn()
            ->makeDataTables();
    }

    // Show the form for creating a new resource.
    public function create()
    {
        return $this->appManger
            ->addPageData('title', 'Add Primary Service')
            ->addInput('Name', 'name', className: 'col-5', note: '*')
            ->addInput('Priority Serial', 'serial', type: 'number', value: 1, className: 'col-2')
            ->addInput('Button Title', 'btn_title', className: 'col-5', note: '*')
            ->addInput('Button URL', 'btn_url', className: 'col-5')
            ->addInput('Button Target', 'btn_target', className: 'col-2')
            ->addInput('Button Icon', 'btn_icon', note: 'Font Awesome v6 Free Icons.', className: 'col-5')
            ->addFileInput('Thumbnail Image', 'image', note: '* (500x500)')
            ->addTextareaEditor('Summery', 'summery')
            ->createPage();
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {
        return $this->appManger
            ->storeRequestData($request)
            ->addData('name', required: 'required|max:254')
            ->addData('summery')
            ->addData('btn_title', required: 'required|max:254')
            ->addData('btn_url')
            ->addData('btn_target', required: 'required|max:20')
            ->addData('btn_icon', required: 'required|max:120')
            ->addData('serial')
            ->addFile('image', required: 'required|file|max:5000')
            ->addCreator()
            ->storeData();
    }

    // Show the form for editing the specified resource.
    public function edit(string $id)
    {
        $app = $this->appManger->addModelData($id);

        if (request()->ajax()) return $app->updateStatus();

        return $app
            ->addPageData('title', 'Edit Primary Service')
            ->addInput('Name', 'name', className: 'col-5', note: '*', editable: true)
            ->addInput('Priority Serial', 'serial', type: 'number', value: 1, className: 'col-2', editable: true)
            ->addInput('Button Title', 'btn_title', className: 'col-5', note: '*', editable: true)
            ->addInput('Button URL', 'btn_url', className: 'col-5', editable: true)
            ->addInput('Button Target', 'btn_target', className: 'col-2', editable: true)
            ->addInput('Button Icon', 'btn_icon', note: 'Font Awesome v6 Free Icons.', className: 'col-5', editable: true)
            ->addFileInput('Thumbnail Image', 'image', note: '* (500x500)', editable: true)
            ->addTextareaEditor('Summery', 'summery', editable: true)
            ->editPage($id);
    }

    // Update the specified resource in storage.
    public function update(Request $request, string $id)
    {
        return $this->appManger
            ->addModelData($id)
            ->storeRequestData($request)
            ->addData('name', required: 'required|max:254')
            ->addData('summery')
            ->addData('btn_title', required: 'required|max:254')
            ->addData('btn_url')
            ->addData('btn_target', required: 'required|max:20')
            ->addData('btn_icon', required: 'required|max:120')
            ->addData('serial')
            ->addFile('image')
            ->updateData($id);
    }

    protected function deleteWithFiles($id)
    {
        return $this->appManger
            ->addModelData($id)
            ->addDestroyingFile('image')
            ->destroyData(fileDeletable: true);
    }

    // Remove the specified resource from storage.
    public function destroy(string $id, Request $request)
    {
        if (is_array($request->id)) {
            foreach ($request->id as $_id) {
                $this->deleteWithFiles($_id);
            }

            return response()->json(['status' => 'success']);
        }

        return $this->deleteWithFiles($id);
    }
}
