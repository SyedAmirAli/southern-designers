<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;

class BrandsController extends Controller
{
    public ResourceAppManager $appManger;
    // Display a listing of the resource.
    public function __construct()
    {
        $this->appManger = new ResourceAppManager(Brand::class, 'home-page-brands');
    }

    // Return the Indexing page
    public function index()
    {
        return $this->appManger
            ->addPageData('title', 'Manage Brands Page')
            ->addDataTablesCheckboxColumn()
            ->addDataTablesColumn('Priority Serial', 'serial')
            ->addDataTablesColumn('Name', 'name')
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
            ->addPageData('title', 'Add Brand Product')

            ->addInput('Name', 'name',  className: 'col-10', note: '*')
            ->addInput('Priority Serial', 'serial', type: 'number', value: 1, className: 'col-2')
            ->addFileInput('Thumbnail Image', 'image', note: '* (500x500)', className: 'col-12')

            ->createPage();
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {
        return $this->appManger
            ->storeRequestData($request)
            ->addData('name', required: 'max:254')
            ->addData('serial')
            ->addFile('image', required: 'required|image|max:5000')
            ->addCreator()
            ->storeData();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->appManger->unavailablePages();
    }

    // Show the form for editing the specified resource.
    public function edit(string $id)
    {
        $app = $this->appManger->addModelData($id);

        if (request()->ajax()) return $app->updateStatus();

        return $app
            ->addPageData('title', 'Add Brands')
            ->addModelData($id)
            ->addInput('Name', 'name',  className: 'col-10', note: '*', editable: true)
            ->addInput('Priority Serial', 'serial', type: 'number', value: 1, className: 'col-2', editable: true)
            ->addFileInput('Thumbnail Image', 'image', note: '* (500x500)', className: 'col-12', editable: true)
            ->editPage($id);
    }

    // Update the specified resource in storage.
    public function update(Request $request, string $id)
    {
        return $this->appManger
            ->addModelData($id)
            ->storeRequestData($request)
            ->addData('name', required: 'max:254')
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
