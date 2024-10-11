<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Helper\SinglePageDataKeyManager;
use App\Http\Controllers\Controller;
use App\Models\SinglePageData;
use Illuminate\Http\Request;

class AboutBannerController extends Controller
{
    public ResourceAppManager $appManager;
    public function __construct()
    {
        $this->appManager = new ResourceAppManager(SinglePageData::class, 'about-banner', modelDataReference: SinglePageDataKeyManager::ABOUT_PAGE);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = $this->appManager->model::where('enum', $this->appManager->model_data_reference)->latest('id')->first();
        $contents = $data ? json_decode($data->contents, true) : array();

        return $this->appManager->addPageData('title', 'About Page Static Items Setup')
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
                'Primary Title',
                'primary_title',
                note: '*',
                className: 'col-6',
                value: isset($contents['primary_title']) ? $contents['primary_title'] : ''
            )
            ->addInput(
                'Primary Heading',
                'primary_heading',
                note: '*',
                className: 'col-6',
                value: isset($contents['primary_heading']) ? $contents['primary_heading'] : ''
            )
            ->addInput(
                'Member Title',
                'member_title',
                note: '*',
                className: 'col-6',
                value: isset($contents['member_title']) ? $contents['member_title'] : ''
            )
            ->addInput(
                'Member Heading',
                'member_heading',
                note: '*',
                className: 'col-6',
                value: isset($contents['member_heading']) ? $contents['member_heading'] : ''
            )
            // mission
            ->separatorBlock('Mission Setup')
            ->addInput(
                'Mission Heading',
                'mission_heading',
                note: '*',
                className: 'col-4',
                value: isset($contents['mission']['heading']) ? $contents['mission']['heading'] : ''
            )
            ->addInput(
                'Mission Title',
                'mission_title',
                note: '*',
                className: 'col-4',
                value: isset($contents['mission']['title']) ? $contents['mission']['title'] : ''
            )
            ->addInput(
                'Mission Icon',
                'mission_icon',
                note: '* Fontawesome Free Icons V6',
                className: 'col-4',
                placeholder: 'e.g <i class="fa-solid fa-user"></i>',
                value: isset($contents['mission']['icon']) ? $contents['mission']['icon'] : ''
            )
            ->addFileInput(
                'Mission Image',
                'mission_image',
                editable: true,
                oldPath: isset($contents['mission']['image']) ? $contents['mission']['image'] : ''
            )
            ->addTextareaEditor(
                'Mission Description',
                'mission_description',
                note: '*',
                type: 'description',
                value: isset($contents['mission']['description']) ? $contents['mission']['description'] : ''
            )
            // vision
            ->separatorBlock('Vision Setup')
            ->addInput(
                'Vision Heading',
                'vision_heading',
                note: '*',
                className: 'col-4',
                value: isset($contents['vision']['heading']) ? $contents['vision']['heading'] : ''
            )
            ->addInput(
                'Vision Title',
                'vision_title',
                note: '*',
                className: 'col-4',
                value: isset($contents['vision']['title']) ? $contents['vision']['title'] : ''
            )
            ->addInput(
                'Vision Icon',
                'vision_icon',
                note: '* Fontawesome Free Icons V6',
                className: 'col-4',
                placeholder: 'e.g <i class="fa-solid fa-user"></i>',
                value: isset($contents['vision']['icon']) ? $contents['vision']['icon'] : ''
            )
            ->addFileInput(
                'Vision Image',
                'vision_image',
                editable: true,
                oldPath: isset($contents['vision']['image']) ? $contents['vision']['image'] : ''
            )
            ->addTextareaEditor(
                'Vision Description',
                'vision_description',
                note: '*',
                type: 'description',
                value: isset($contents['vision']['description']) ? $contents['vision']['description'] : ''
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
            ->addJsonData('contents', 'member_title')
            ->addJsonData('contents', 'member_heading')
            ->addJsonData('contents', 'primary_title')
            ->addJsonData('contents', 'primary_heading')
            ->addJsonFile('contents', 'image', 'image')

            // mission
            ->addJsonData('contents', 'mission', 'mission_heading', 'heading')
            ->addJsonData('contents', 'mission', 'mission_title', 'title')
            ->addJsonData('contents', 'mission', 'mission_icon', 'icon')
            ->addJsonFile('contents', 'mission', 'mission_image', 'image')
            ->addJsonData('contents', 'mission', 'mission_description', 'description')

            // vision
            ->addJsonData('contents', 'vision', 'vision_heading', 'heading')
            ->addJsonData('contents', 'vision', 'vision_title', 'title')
            ->addJsonData('contents', 'vision', 'vision_icon', 'icon')
            ->addJsonFile('contents', 'vision', 'vision_image', 'image')
            ->addJsonData('contents', 'vision', 'vision_description', 'description')

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
