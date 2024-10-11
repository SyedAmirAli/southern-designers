<?php

namespace App\Http\Controllers;

use App\Helper\ResourceAppManager;
use App\Helper\SinglePageDataKeyManager;
use App\Models\SinglePageData;
use Illuminate\Http\Request;

class HomepageSetupController extends Controller
{
    public ResourceAppManager $appManager;
    public function __construct()
    {
        $this->appManager = new ResourceAppManager(SinglePageData::class, 'home-page-setup', modelDataReference: SinglePageDataKeyManager::HOME_PAGE);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = $this->appManager->model::where('enum', $this->appManager->model_data_reference)->latest('id')->first();
        $contents = $data ? json_decode($data->contents, true) : array();

        return $this->appManager->addPageData('title', 'Upcoming Event Page & Past Campaigns Page Static Title Setup')
            ->addInput(
                'Main Identifier Title',
                'title',
                value: $data ? $data->title : '',
                note: '(Optional)',
            )
            ->addFileInput(
                'Main Video',
                'video',
                editable: true,
                note: '(Max: 1min in 50MB - recommended)',
                oldPath: isset($contents['video']) ? $contents['video'] : '',
                type: 'video'
            )
            ->addInput(
                'Primary Video Title',
                'primary_video_title',
                note: '*',
                className: 'col-6',
                value: isset($contents['primary_video_title']) ? $contents['primary_video_title'] : ''
            )
            ->addInput(
                'Secondary Video Title',
                'secondary_video_title',
                note: '*',
                className: 'col-6',
                value: isset($contents['secondary_video_title']) ? $contents['secondary_video_title'] : ''
            )
            ->addInput(
                'Video Fancy Texts',
                'fancy_texts',
                note: '* Use Comma "," separator to write multiple keywords. (e.g Text1, Text2, etc)',
                value: isset($contents['fancy_texts']) ? $contents['fancy_texts'] : ''
            )

            // Blocking
            ->separatorBlock('Main Services')
            ->addInput(
                'Main Service Title',
                'main_services_title',
                note: '(Highlight Title)',
                className: 'col-6',
                value: isset($contents['main_services']['title']) ? $contents['main_services']['title'] : ''
            )
            ->addInput(
                'Main Service name',
                'main_services_name',
                note: '*',
                className: 'col-6',
                value: isset($contents['main_services']['name']) ? $contents['main_services']['name'] : ''
            )
            ->addTextareaEditor(
                'Main Services Summery',
                'main_services_summery',
                note: '*',
                value: isset($contents['main_services']['summery']) ? $contents['main_services']['summery'] : ''
            )

            ->separatorBlock('Counter Services')
            ->addInput(
                'Counter Service Title',
                'counter_services_title',
                note: '(Highlight Title)',
                className: 'col-6',
                value: isset($contents['counter_services']['title']) ? $contents['counter_services']['title'] : ''
            )
            ->addInput(
                'Counter Service name',
                'counter_services_name',
                note: '*',
                className: 'col-6',
                value: isset($contents['counter_services']['name']) ? $contents['counter_services']['name'] : ''
            )
            ->addTextareaEditor(
                'Counter Services Summery',
                'counter_services_summery',
                note: '*',
                value: isset($contents['counter_services']['summery']) ? $contents['counter_services']['summery'] : ''
            )

            ->separatorBlock('Primary Services')
            ->addInput(
                'Primary Service Title',
                'primary_services_title',
                note: '(Highlight Title)',
                className: 'col-6',
                value: isset($contents['primary_services']['title']) ? $contents['primary_services']['title'] : ''
            )
            ->addInput(
                'Primary Service name',
                'primary_services_name',
                note: '*',
                className: 'col-6',
                value: isset($contents['primary_services']['name']) ? $contents['primary_services']['name'] : ''
            )
            ->addTextareaEditor(
                'Primary Services Summery',
                'primary_services_summery',
                note: '*',
                value: isset($contents['primary_services']['summery']) ? $contents['primary_services']['summery'] : ''
            )

            ->separatorBlock('Reviews')
            ->addInput(
                'Reviews Title',
                'reviews_title',
                note: '(Highlight Title)',
                className: 'col-6',
                value: isset($contents['reviews']['title']) ? $contents['reviews']['title'] : ''
            )
            ->addInput(
                'Reviews name',
                'reviews_name',
                note: '*',
                className: 'col-6',
                value: isset($contents['reviews']['name']) ? $contents['reviews']['name'] : ''
            )
            ->addTextareaEditor(
                'Reviews Summery',
                'reviews_summery',
                note: '*',
                value: isset($contents['reviews']['summery']) ? $contents['reviews']['summery'] : ''
            )

            ->separatorBlock('Featured Products')
            ->addInput(
                'Featured Products Title',
                'featured_products_title',
                note: '(Highlight Title)',
                className: 'col-6',
                value: isset($contents['featured_products']['title']) ? $contents['featured_products']['title'] : ''
            )
            ->addInput(
                'Featured Products Name',
                'featured_products_name',
                note: '*',
                className: 'col-6',
                value: isset($contents['featured_products']['name']) ? $contents['featured_products']['name'] : ''
            )
            ->addTextareaEditor(
                'Featured Products Summery',
                'featured_products_summery',
                note: '*',
                value: isset($contents['featured_products']['summery']) ? $contents['featured_products']['summery'] : ''
            )

            ->separatorBlock('Brands')
            ->addInput(
                'Brands Title',
                'brands_title',
                note: '(Highlight Title)',
                className: 'col-6',
                value: isset($contents['brands']['title']) ? $contents['brands']['title'] : ''
            )
            ->addInput(
                'Brands Name',
                'brands_name',
                note: '*',
                className: 'col-6',
                value: isset($contents['brands']['name']) ? $contents['brands']['name'] : ''
            )
            ->addTextareaEditor(
                'Brands Summery',
                'brands_summery',
                note: '*',
                value: isset($contents['brands']['summery']) ? $contents['brands']['summery'] : ''
            )

            ->separatorBlock('Contact')
            ->addInput(
                'Contact Title',
                'contact_title',
                note: '(Highlight Title)',
                className: 'col-6',
                value: isset($contents['contact']['title']) ? $contents['contact']['title'] : ''
            )
            ->addInput(
                'Contact Name',
                'contact_name',
                note: '*',
                className: 'col-6',
                value: isset($contents['contact']['name']) ? $contents['contact']['name'] : ''
            )
            ->addTextareaEditor(
                'Contact Summery',
                'contact_summery',
                note: '*',
                value: isset($contents['contact']['summery']) ? $contents['contact']['summery'] : ''
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
            ->addJsonData('contents', 'primary_video_title', 'primary_video_title')
            ->addJsonData('contents', 'secondary_video_title', 'secondary_video_title')
            ->addJsonData('contents', 'fancy_texts', 'fancy_texts')
            ->addJsonFile('contents', 'video', 'video', fileType: 'video')

            ->addJsonData('contents', 'main_services', 'main_services_name', 'name')
            ->addJsonData('contents', 'main_services', 'main_services_title', 'title')
            ->addJsonData('contents', 'main_services', 'main_services_summery', 'summery')

            ->addJsonData('contents', 'primary_services', 'primary_services_name', 'name')
            ->addJsonData('contents', 'primary_services', 'primary_services_title', 'title')
            ->addJsonData('contents', 'primary_services', 'primary_services_summery', 'summery')

            ->addJsonData('contents', 'counter_services', 'counter_services_name', 'name')
            ->addJsonData('contents', 'counter_services', 'counter_services_title', 'title')
            ->addJsonData('contents', 'counter_services', 'counter_services_summery', 'summery')

            ->addJsonData('contents', 'reviews', 'reviews_name', 'name')
            ->addJsonData('contents', 'reviews', 'reviews_title', 'title')
            ->addJsonData('contents', 'reviews', 'reviews_summery', 'summery')

            ->addJsonData('contents', 'featured_products', 'featured_products_name', 'name')
            ->addJsonData('contents', 'featured_products', 'featured_products_title', 'title')
            ->addJsonData('contents', 'featured_products', 'featured_products_summery', 'summery')

            ->addJsonData('contents', 'brands', 'brands_name', 'name')
            ->addJsonData('contents', 'brands', 'brands_title', 'title')
            ->addJsonData('contents', 'brands', 'brands_summery', 'summery')

            ->addJsonData('contents', 'contact', 'contact_name', 'name')
            ->addJsonData('contents', 'contact', 'contact_title', 'title')
            ->addJsonData('contents', 'contact', 'contact_summery', 'summery')
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
