<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Http\Controllers\Controller;
use App\Models\ServicesCounter;
use Illuminate\Http\Request;

class ServicesCounterController extends Controller
{
    public ResourceAppManager $appManger;

    public function __construct()
    {
        $this->appManger = new ResourceAppManager(ServicesCounter::class, 'home-page-services-counter');
    }

    // Display a listing of the resource.
    public function index()
    {
        return $this->appManger
            ->addPageData('title', 'Manage Services Counters')
            ->addDataTablesCheckboxColumn()
            ->addDataTablesColumn('Priority Serial', 'serial')
            ->addDataTablesColumn('Name', 'name')
            ->addDataTablesColumn('Value', 'value')
            ->addDataTablesColumn('Icon', 'icon')
            ->addDataTablesStatusColumn()
            ->addDataTablesActionsColumns()
            ->addDataTablesRawColumn()
            ->makeDataTables();
    }

    // Show the form for creating a new resource.
    public function create()
    {
        return $this->appManger
            ->addPageData('title', 'Add Services Counter')
            ->addInput('Name', 'name', className: 'col-10', note: '*')
            ->addInput('Priority Serial', 'serial', type: 'number', value: 1, className: 'col-2')
            ->addInput('Value', 'value', type: 'number', className: 'col-6', note: '*')
            ->addInput('Icon', 'icon', note: 'Font Awesome v6 Free Icons.', className: 'col-6')
            ->createPage();
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {
        return $this->appManger
            ->storeRequestData($request)
            ->addData('name', required: 'required|max:254')
            ->addData('value', required: 'required|numeric')
            ->addData('icon', required: 'required|max:120')
            ->addData('serial')
            ->addCreator()
            ->storeData();
    }

    // Show the form for editing the specified resource.
    public function edit(string $id)
    {
        $app = $this->appManger->addModelData($id);

        if (request()->ajax()) return $app->updateStatus();

        return $app
            ->addPageData('title', 'Edit Services Counter')
            ->addInput('Name', 'name', className: 'col-10', note: '*', editable: true)
            ->addInput('Priority Serial', 'serial', type: 'number', value: 1, className: 'col-2', editable: true)
            ->addInput('Value', 'value', type: 'number', className: 'col-6', note: '*', editable: true)
            ->addInput('Icon', 'icon', note: 'Font Awesome v6 Free Icons.', className: 'col-6', editable: true)
            ->editPage($id);
    }

    // Update the specified resource in storage.
    public function update(Request $request, string $id)
    {
        return $this->appManger
            ->addModelData($id)
            ->storeRequestData($request)
            ->addData('name', required: 'required|max:254')
            ->addData('value', required: 'required|numeric')
            ->addData('icon', required: 'required|max:120')
            ->addData('serial')
            ->updateData($id);
    }

    protected function deleteWithFiles($id)
    {
        return $this->appManger
            ->addModelData($id)
            ->destroyData(fileDeletable: false);
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
