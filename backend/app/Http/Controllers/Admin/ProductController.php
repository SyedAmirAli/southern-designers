<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public ResourceAppManager $appManger;
    public array $features;
    // Display a listing of the resource.
    public function __construct()
    {
        $this->appManger = new ResourceAppManager(Product::class, 'product');
        $this->features = [
            ['value' => 'general', 'label' => 'Shows Product only Product Page.'],
            ['value' => 'showcase', 'label' => 'Shows Product in Homepage as Featured.'],
        ];
    }

    // Return the Indexing page
    public function index()
    {
        $features = ['general' => 'Shows Product only Product Page.', 'showcase' => 'Shows Product in Homepage as Featured.'];
        return $this->appManger
            ->addPageData('title', 'Manage Products Page')
            ->addDataTablesCheckboxColumn()
            ->addDataTablesColumn('Serial', 'serial')
            ->addDataTablesColumn('Featured', 'featured', callback: fn($key) => isset($features[$key]) ? $features[$key] : $key)
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
        $categories = array_map(function ($category) {
            return ['label' => $category['name'], 'value' => $category['id']];
        }, Category::select('id', 'name')->latest('id')->get()->toArray());

        return $this->appManger
            ->addPageData('title', 'Add Brand Product')
            ->addInput('Product Name', 'name',  className: 'col-10', note: '*')
            ->addSerialInput()
            ->addSelectInput('Select A Category', 'category_id', $categories, className: 'col-6', note: '*')
            ->addSelectInput('Fields Required Status', 'featured', $this->features, className: 'col-6', note: '*')
            ->addFileInput('Thumbnail Image', 'image', note: '* (500x500)')
            ->addFileInput('Others Images', 'photos', note: '* (800x900)', multiple: true)
            ->addTextareaEditor('Short Summery', 'title')
            ->addTextareaEditor('Description', 'description', type: 'description')
            ->createPage();
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {
        return $this->appManger
            ->storeRequestData($request)
            ->addData('name', required: 'required|max:254')
            ->addData('title', required: 'max:599')
            ->addData('serial')
            ->addData('featured', required: 'required|max:20')
            ->addData('category_id', required: 'required|max:20')
            ->addFile('image', required: 'required|image|max:5000')
            ->addFile('photos', multiple: true)
            ->addData('description')
            ->addSlug('name')
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

        $categories = array_map(function ($category) {
            return ['label' => $category['name'], 'value' => $category['id']];
        }, Category::select('id', 'name')->latest('id')->get()->toArray());

        return $app
            ->addPageData('title', 'Add Products')
            ->addModelData($id)
            ->addInput('Product Name', 'name',  className: 'col-10', note: '*', editable: true)
            ->addInput('Priority Serial', 'serial', type: 'number', value: 1, className: 'col-2', editable: true)
            ->addSelectInput('Select A Category', 'category_id', $categories, className: 'col-6', note: '*', editable: true)
            ->addSelectInput('Fields Required Status', 'featured', $this->features, className: 'col-6', note: '*', editable: true)
            ->addFileInput('Thumbnail Image', 'image', note: '* (500x500)', editable: true)
            ->addFileInput('Others Images', 'photos', note: '* (800x900)', multiple: true, editable: true)
            ->addTextareaEditor('Short Summery', 'title', editable: true)
            ->addTextareaEditor('Description', 'description', type: 'description', editable: true)
            ->editPage($id);
    }

    // Update the specified resource in storage.
    public function update(Request $request, string $id)
    {
        return $this->appManger
            ->addModelData($id)
            ->storeRequestData($request)
            ->addData('name', required: 'required|max:254')
            ->addData('title', required: 'max:599')
            ->addData('serial')
            ->addData('description')
            ->addData('featured', required: 'required|max:20')
            ->addData('category_id', required: 'required|max:20')
            ->addFile('image')
            ->addFile('photos', multiple: true)
            ->addSlug('name')
            ->updateData($id);
    }

    protected function deleteWithFiles($id)
    {
        return $this->appManger
            ->addModelData($id)
            ->addDestroyingFile('image')
            ->addDestroyingFile('photos', true)
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
