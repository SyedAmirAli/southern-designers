<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Http\Controllers\Controller;
use App\Models\SustainabilityVideo;
use Illuminate\Http\Request;

class SustainabilityVideosController extends Controller
{
    public ResourceAppManager $appManger;
    // Display a listing of the resource.
    public function __construct()
    {
        $this->appManger = new ResourceAppManager(SustainabilityVideo::class, 'sustainability-videos');
    }

    // Return the Indexing page
    public function index()
    {
        return $this->appManger
            ->addPageData('title', 'Sustainability Videos Page')
            ->addDataTablesCheckboxColumn()
            ->addDataTablesColumn('Priority Serial', 'serial')
            ->addDataTablesColumn('Title', 'title')
            ->addDataTablesColumn('Embed Code', 'embed_code')
            ->addDataTablesStatusColumn()
            ->addDataTablesActionsColumns()
            ->addDataTablesRawColumn()
            ->makeDataTables();
    }

    // Show the form for creating a new resource.
    public function create()
    {
        return $this->appManger
            ->addPageData('title', 'Add Sustainability Videos')
            ->addInput('Title', 'title',  className: 'col-10', note: '*')
            ->addSerialInput()
            ->addTextareaEditor('Iframe Embed HTML Code', 'embed_code', placeholder: 'e.g <iframe src="https://www.youtube.com/_Qxsi98Xc"></iframe>')
            ->createPage();
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {
        return $this->appManger
            ->storeRequestData($request)
            ->addData('title', required: 'max:254')
            ->addData('embed_code', required: 'required|max:1000')
            ->addData('serial')
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
            ->addPageData('title', 'Edit Sustainability Videos')
            ->addModelData($id)
            ->addInput('Title', 'title',  className: 'col-10', note: '*', editable: true)
            ->addInput('Priority Serial', 'serial', type: 'number', value: 1, className: 'col-2', editable: true)
            ->addTextareaEditor('Iframe Embed HTML Code', 'embed_code', placeholder: 'e.g <iframe src="https://www.youtube.com/_Qxsi98Xc"></iframe>', editable: true)
            ->editPage($id);
    }

    // Update the specified resource in storage.
    public function update(Request $request, string $id)
    {
        return $this->appManger
            ->addModelData($id)
            ->storeRequestData($request)
            ->addData('title', required: 'max:254')
            ->addData('embed_code', required: 'required|max:1000')
            ->addData('serial')
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
