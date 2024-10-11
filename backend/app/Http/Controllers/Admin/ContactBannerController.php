<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Helper\SinglePageDataKeyManager;
use App\Http\Controllers\Controller;
use App\Models\SinglePageData;
use Illuminate\Http\Request;

class ContactBannerController extends Controller
{
    public ResourceAppManager $appManager;
    public function __construct()
    {
        $this->appManager = new ResourceAppManager(SinglePageData::class, 'contacts-banner', modelDataReference: SinglePageDataKeyManager::CONTACT_PAGE);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = $this->appManager->model::where('enum', $this->appManager->model_data_reference)->latest('id')->first();
        $contents = $data ? json_decode($data->contents, true) : array();

        return $this->appManager->addPageData('title', 'Contact Page Static Items Setup')
            ->addInput(
                'Main Identifier Title',
                'title',
                value: $data ? $data->title : '',
                note: '(Optional)',
            )
            ->addInput(
                'Heading',
                'heading',
                note: '*',
                className: 'col-6',
                value: isset($contents['heading']) ? $contents['heading'] : ''
            )
            ->addInput(
                'Name',
                'name',
                note: '*',
                className: 'col-6',
                value: isset($contents['name']) ? $contents['name'] : ''
            )
            ->addFileInput(
                'Banner Image',
                'image',
                note: '1920x1080',
                oldPath: isset($contents['image']) ? $contents['image'] : '',
                editable: true
            )
            ->addInput(
                'Button Title',
                'btn_title',
                note: '*',
                placeholder: 'e.g Learn More',
                className: 'col-4',
                value: isset($contents['btn_title']) ? $contents['btn_title'] : ''
            )
            ->addInput(
                'Button Target',
                'btn_target',
                note: '*',
                placeholder: 'e.g _blank/_self/_parent',
                className: 'col-4',
                value: isset($contents['btn_target']) ? $contents['btn_target'] : ''
            )
            ->addInput(
                'Button URL',
                'btn_url',
                note: '*',
                placeholder: 'e.g https://www.example.com',
                className: 'col-4',
                value: isset($contents['btn_url']) ? $contents['btn_url'] : ''
            )
            ->addInput(
                'Contact Title',
                'contact_title',
                note: '*',
                value: isset($contents['contact_title']) ? $contents['contact_title'] : ''
            )
            ->addTextareaEditor(
                'Contact Description',
                'contact_description',
                note: '*',
                type: 'description',
                value: isset($contents['contact_description']) ? $contents['contact_description'] : ''
            )
            ->createPage();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return $this->appManager
            ->storeRequestData($request)
            ->addData('title')
            ->addSinglePageModelData()
            ->addJsonData('contents', 'heading')
            ->addJsonData('contents', 'name')
            ->addJsonData('contents', 'btn_title')
            ->addJsonData('contents', 'btn_target')
            ->addJsonData('contents', 'btn_url')
            ->addJsonData('contents', 'contact_title')
            ->addJsonData('contents', 'contact_description')
            ->addJsonFile('contents', 'image', 'image')
            ->makeOrUpdateData();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->appManager->unavailablePages();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return $this->appManager->unavailablePages();
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        return $this->appManager->unavailablePages();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->appManager->unavailablePages();
    }
}
