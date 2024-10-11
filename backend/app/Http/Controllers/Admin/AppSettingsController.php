<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Helper\SinglePageDataKeyManager;
use App\Http\Controllers\Controller;
use App\Models\AppSettings;
use App\Models\SinglePageData;
use Illuminate\Http\Request;

class AppSettingsController extends Controller
{
    // Display a listing of the resource.
    public ResourceAppManager $appManager;
    public array $counterSpell;
    public function __construct()
    {
        $this->appManager = new ResourceAppManager(SinglePageData::class, 'settings', modelDataReference: SinglePageDataKeyManager::APP_SETTINGS);
        $this->counterSpell  = ['Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten'];
    }

    // Make Protected Resources Function
    public function index()
    {
        $data = $this->appManager->model::where('enum', $this->appManager->model_data_reference)->latest('id')->first();
        $contents = $data ? json_decode($data->contents, true) : array();


        $create = $this->appManager
            ->addPageData('title', 'Save App Settings')
            ->addInput(
                'Main Identifier Title',
                'title',
                value: $data ? $data->title : '',
                note: '(Optional)',
            )

            ->addInput('App Name', 'app_name',  className: 'col-6', note: '*', value: isset($contents['app_name']) ? $contents['app_name'] : '')
            ->addInput('App Title', 'app_title',  className: 'col-6', note: '*', value: isset($contents['app_title']) ? $contents['app_title'] : '')

            ->addFileInput(
                'App Favicon',
                'app_favicon',
                className: 'col-4',
                note: '* (32x32)',
                editable: true,
                oldPath: isset($contents['app_favicon']) ? $contents['app_favicon'] : ''
            )
            ->addFileInput(
                'Header Image',
                'header_image',
                className: 'col-4',
                note: '* (200x200)',
                editable: true,
                oldPath: isset($contents['header_image']) ? $contents['header_image'] : ''
            )
            ->addFileInput(
                'Footer Image',
                'footer_image',
                className: 'col-4',
                note: '* (200x200)',
                editable: true,
                oldPath: isset($contents['footer_image']) ? $contents['footer_image'] : ''
            )

            ->addInput('Footer First Title', 'footer_title_1',  className: 'col-4', note: '*', value: isset($contents['footer_title_1']) ? $contents['footer_title_1'] : '')
            ->addInput('Footer Second Title', 'footer_title_2',  className: 'col-4', note: '*', value: isset($contents['footer_title_2']) ? $contents['footer_title_2'] : '')
            ->addInput('Footer Third Title', 'footer_title_3',  className: 'col-4', note: '*', value: isset($contents['footer_title_3']) ? $contents['footer_title_3'] : '')

            ->addTextareaEditor('Footer Description', 'footer_description', value: isset($contents['footer_description']) ? $contents['footer_description'] : '')

            ->separatorBlock('Factory Addresses')

            ->addInput("Factory Address Title One", "factory_address_title_1", className: 'col-6', note: "<strong>1</strong>", value: isset($contents['factory_address_1']['title']) ? $contents['factory_address_1']['title'] : '')
            ->addInput("Factory Address Location One", "factory_address_location_1", className: 'col-6', note: "<strong>1</strong>", value: isset($contents['factory_address_1']['location']) ? $contents['factory_address_1']['location'] : '')
            ->addInput("Factory Address Icon One", "factory_address_icon_1", className: 'col-4', note: "<strong>1</strong>", value: isset($contents['factory_address_1']['icon']) ? $contents['factory_address_1']['icon'] : '')
            ->addInput("Factory Address E-mail One", "factory_address_email_1", className: 'col-4', note: "<strong>1</strong>", value: isset($contents['factory_address_1']['email']) ? $contents['factory_address_1']['email'] : '')
            ->addInput("Factory Address Phone One", "factory_address_phone_1", className: 'col-4', note: "<strong>1</strong>", value: isset($contents['factory_address_1']['phone']) ? $contents['factory_address_1']['phone'] : '')

            ->addInput("Factory Address Title Two", "factory_address_title_2", className: 'col-6', note: "<strong>2</strong>", value: isset($contents['factory_address_2']['title']) ? $contents['factory_address_2']['title'] : '')
            ->addInput("Factory Address Location Two", "factory_address_location_2", className: 'col-6', note: "<strong>2</strong>", value: isset($contents['factory_address_2']['location']) ? $contents['factory_address_2']['location'] : '')
            ->addInput("Factory Address Icon Two", "factory_address_icon_2", className: 'col-4', note: "<strong>2</strong>", value: isset($contents['factory_address_2']['icon']) ? $contents['factory_address_2']['icon'] : '')
            ->addInput("Factory Address E-mail Two", "factory_address_email_2", className: 'col-4', note: "<strong>2</strong>", value: isset($contents['factory_address_2']['email']) ? $contents['factory_address_2']['email'] : '')
            ->addInput("Factory Address Phone Two", "factory_address_phone_2", className: 'col-4', note: "<strong>2</strong>", value: isset($contents['factory_address_2']['phone']) ? $contents['factory_address_2']['phone'] : '')

            ->addInput("Factory Address Title Three", "factory_address_title_3", className: 'col-6', note: "<strong>3</strong>", value: isset($contents['factory_address_3']['title']) ? $contents['factory_address_3']['title'] : '')
            ->addInput("Factory Address Location Three", "factory_address_location_3", className: 'col-6', note: "<strong>3</strong>", value: isset($contents['factory_address_3']['location']) ? $contents['factory_address_3']['location'] : '')
            ->addInput("Factory Address Icon Three", "factory_address_icon_3", className: 'col-4', note: "<strong>3</strong>", value: isset($contents['factory_address_3']['icon']) ? $contents['factory_address_3']['icon'] : '')
            ->addInput("Factory Address E-mail Three", "factory_address_email_3", className: 'col-4', note: "<strong>3</strong>", value: isset($contents['factory_address_3']['email']) ? $contents['factory_address_3']['email'] : '')
            ->addInput("Factory Address Phone Three", "factory_address_phone_3", className: 'col-4', note: "<strong>3</strong>", value: isset($contents['factory_address_3']['phone']) ? $contents['factory_address_3']['phone'] : '')

            ->addInput("Factory Address Title Four", "factory_address_title_4", className: 'col-6', note: "<strong>4</strong>", value: isset($contents['factory_address_4']['title']) ? $contents['factory_address_4']['title'] : '')
            ->addInput("Factory Address Location Four", "factory_address_location_4", className: 'col-6', note: "<strong>4</strong>", value: isset($contents['factory_address_4']['location']) ? $contents['factory_address_4']['location'] : '')
            ->addInput("Factory Address Icon Four", "factory_address_icon_4", className: 'col-4', note: "<strong>4</strong>", value: isset($contents['factory_address_4']['icon']) ? $contents['factory_address_4']['icon'] : '')
            ->addInput("Factory Address E-mail Four", "factory_address_email_4", className: 'col-4', note: "<strong>4</strong>", value: isset($contents['factory_address_4']['email']) ? $contents['factory_address_4']['email'] : '')
            ->addInput("Factory Address Phone Four", "factory_address_phone_4", className: 'col-4', note: "<strong>4</strong>", value: isset($contents['factory_address_4']['phone']) ? $contents['factory_address_4']['phone'] : '')

            ->separatorBlock('Main Address')

            ->addInput("Main Address Icon", "main_address_icon", className: 'col-6', note: "Font Awesome Icon V6", value: isset($contents['main_address_icon']) ? $contents['main_address_icon'] : '')
            ->addInput("Main Address Name", "main_address_name", className: 'col-6', note: "*", value: isset($contents['main_address_name']) ? $contents['main_address_name'] : '')

            ->addInput("Main E-mail Icon", "main_email_icon", className: 'col-6', note: "Font Awesome Icon V6", value: isset($contents['main_email_icon']) ? $contents['main_email_icon'] : '')
            ->addInput("Main E-mail Name", "main_email_name", className: 'col-6', note: "*", value: isset($contents['main_email_name']) ? $contents['main_email_name'] : '')

            ->addInput("Main Phone Icon", "main_phone_icon", className: 'col-6', note: "Font Awesome Icon V6", value: isset($contents['main_phone_icon']) ? $contents['main_phone_icon'] : '')
            ->addInput("Main Phone Name", "main_phone_name", className: 'col-6', note: "*", value: isset($contents['main_phone_name']) ? $contents['main_phone_name'] : '')

            ->separatorBlock('Copyright Credentials')

            ->addInput("Copyright Title One", "copyright_title_one", className: 'col-6', note: "*", value: isset($contents['copyright_title']['one']) ? $contents['copyright_title']['one'] : '')
            ->addInput("Copyright Title Two", "copyright_title_two", className: 'col-6', note: "*", value: isset($contents['copyright_title']['two']) ? $contents['copyright_title']['two'] : '')

            ->addInput("Copyright Title", "copyright_title", className: 'col-5', note: "*", value: isset($contents['copyright']['title']) ? $contents['copyright']['title'] : '')
            ->addInput("Copyright Title URL", "copyright_url", className: 'col-5', placeholder: 'e.g https://www.example.com', note: "*", value: isset($contents['copyright']['url']) ? $contents['copyright']['url'] : '')
            ->addInput("Copyright Target", "copyright_target", className: 'col-2', placeholder: 'e.g _blank, _self, _parent', note: "*", value: isset($contents['copyright']['target']) ? $contents['copyright']['target'] : '')

            ->addInput("Facebook", "facebook_icon", className: 'col-4', note: "Fontawesome Free Icon V6", placeholder: 'e.g <i class="fa-solid fa-home"></i>', value: isset($contents['facebook']['icon']) ? $contents['facebook']['icon'] : '')
            ->addInput("Facebook", "facebook_url", className: 'col-4', note: "*", placeholder: 'e.g https://www.example.com', value: isset($contents['facebook']['url']) ? $contents['facebook']['url'] : '')
            ->addInput("Facebook", "facebook_target", className: 'col-4', note: "*", placeholder: 'e.g _blank, _self, _parent', value: isset($contents['facebook']['target']) ? $contents['facebook']['target'] : '')

            ->addInput("YouTube", "youtube_icon", className: 'col-4', note: "Fontawesome Free Icon V6", placeholder: 'e.g <i class="fa-solid fa-home"></i>', value: isset($contents['youtube']['icon']) ? $contents['youtube']['icon'] : '')
            ->addInput("YouTube", "youtube_url", className: 'col-4', note: "*", placeholder: 'e.g https://www.example.com', value: isset($contents['youtube']['url']) ? $contents['youtube']['url'] : '')
            ->addInput("YouTube", "youtube_target", className: 'col-4', note: "*", placeholder: 'e.g _blank, _self, _parent', value: isset($contents['youtube']['target']) ? $contents['youtube']['target'] : '')

            ->addInput("Twitter", "twitter_icon", className: 'col-4', note: "Fontawesome Free Icon V6", placeholder: 'e.g <i class="fa-solid fa-home"></i>', value: isset($contents['twitter']['icon']) ? $contents['twitter']['icon'] : '')
            ->addInput("Twitter", "twitter_url", className: 'col-4', note: "*", placeholder: 'e.g https://www.example.com', value: isset($contents['twitter']['url']) ? $contents['twitter']['url'] : '')
            ->addInput("Twitter", "twitter_target", className: 'col-4', note: "*", placeholder: 'e.g _blank, _self, _parent', value: isset($contents['twitter']['target']) ? $contents['twitter']['target'] : '')

            ->addInput("LinkedIn", "linkedin_icon", className: 'col-4', note: "Fontawesome Free Icon V6", placeholder: 'e.g <i class="fa-solid fa-home"></i>', value: isset($contents['linkedin']['icon']) ? $contents['linkedin']['icon'] : '')
            ->addInput("LinkedIn", "linkedin_url", className: 'col-4', note: "*", placeholder: 'e.g https://www.example.com', value: isset($contents['linkedin']['url']) ? $contents['linkedin']['url'] : '')
            ->addInput("LinkedIn", "linkedin_target", className: 'col-4', note: "*", placeholder: 'e.g _blank, _self, _parent', value: isset($contents['linkedin']['target']) ? $contents['linkedin']['target'] : '')

            ->addInput("Instagram", "instagram_icon", className: 'col-4', note: "Fontawesome Free Icon V6", placeholder: 'e.g <i class="fa-solid fa-home"></i>', value: isset($contents['instagram']['icon']) ? $contents['instagram']['icon'] : '')
            ->addInput("Instagram", "instagram_url", className: 'col-4', note: "*", placeholder: 'e.g https://www.example.com', value: isset($contents['instagram']['url']) ? $contents['instagram']['url'] : '')
            ->addInput("Instagram", "instagram_target", className: 'col-4', note: "*", placeholder: 'e.g _blank, _self, _parent', value: isset($contents['instagram']['target']) ? $contents['instagram']['target'] : '')

            ->separatorBlock('Meta Credentials')

            ->addInput("Meta Name", "meta_name", className: 'col-4', note: "*", value: isset($contents['meta_name']) ? $contents['meta_name'] : '')
            ->addInput("Meta Title", "meta_title", className: 'col-4', note: "*", value: isset($contents['meta_title']) ? $contents['meta_title'] : '')
            ->addInput("Meta keyword", "meta_keyword", className: 'col-4', note: "write by using comma separator <strong>','</strong> - e.g e-com, blog etc", value: isset($contents['meta_keyword']) ? $contents['meta_keyword'] : '')
            ->addTextareaEditor('Meta Descriptions', 'meta_description', value: isset($contents['meta_description']) ? $contents['meta_description'] : '')
            ->createPage();

        return $create;
    }

    // Show the form for creating a new resource.
    public function create()
    {
        return 'create.app-setting';
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {

        return $this->appManager
            ->storeRequestData($request)
            ->addData('title')
            ->addSinglePageModelData()

            ->addJsonData('contents', 'app_name')
            ->addJsonData('contents', 'app_title')
            ->addJsonData('contents', 'footer_title_1')
            ->addJsonData('contents', 'footer_title_2')
            ->addJsonData('contents', 'footer_title_3')
            ->addJsonData('contents', 'footer_description')
            ->addJsonData('contents', 'main_address_icon')
            ->addJsonData('contents', 'main_address_name')
            ->addJsonData('contents', 'main_email_icon')
            ->addJsonData('contents', 'main_email_name')
            ->addJsonData('contents', 'main_phone_icon')
            ->addJsonData('contents', 'main_phone_name')
            ->addJsonData('contents', 'meta_name')
            ->addJsonData('contents', 'meta_title')
            ->addJsonData('contents', 'meta_keyword')
            ->addJsonData('contents', 'meta_description')

            ->addJsonData('contents', 'factory_address_1', 'factory_address_title_1', 'title')
            ->addJsonData('contents', 'factory_address_1', 'factory_address_location_1', 'location')
            ->addJsonData('contents', 'factory_address_1', 'factory_address_icon_1', 'icon')
            ->addJsonData('contents', 'factory_address_1', 'factory_address_email_1', 'email')
            ->addJsonData('contents', 'factory_address_1', 'factory_address_phone_1', 'phone')
            ->addJsonData('contents', 'factory_address_2', 'factory_address_title_2', 'title')
            ->addJsonData('contents', 'factory_address_2', 'factory_address_location_2', 'location')
            ->addJsonData('contents', 'factory_address_2', 'factory_address_icon_2', 'icon')
            ->addJsonData('contents', 'factory_address_2', 'factory_address_email_2', 'email')
            ->addJsonData('contents', 'factory_address_2', 'factory_address_phone_2', 'phone')
            ->addJsonData('contents', 'factory_address_3', 'factory_address_title_3', 'title')
            ->addJsonData('contents', 'factory_address_3', 'factory_address_location_3', 'location')
            ->addJsonData('contents', 'factory_address_3', 'factory_address_icon_3', 'icon')
            ->addJsonData('contents', 'factory_address_3', 'factory_address_email_3', 'email')
            ->addJsonData('contents', 'factory_address_3', 'factory_address_phone_3', 'phone')
            ->addJsonData('contents', 'factory_address_4', 'factory_address_title_4', 'title')
            ->addJsonData('contents', 'factory_address_4', 'factory_address_location_4', 'location')
            ->addJsonData('contents', 'factory_address_4', 'factory_address_icon_4', 'icon')
            ->addJsonData('contents', 'factory_address_4', 'factory_address_email_4', 'email')
            ->addJsonData('contents', 'factory_address_4', 'factory_address_phone_4', 'phone')

            ->addJsonData('contents', 'copyright_title', 'copyright_title_one', 'one')
            ->addJsonData('contents', 'copyright_title', 'copyright_title_two', 'two')

            ->addJsonData('contents', 'copyright', 'copyright_title', 'title')
            ->addJsonData('contents', 'copyright', 'copyright_url', 'url')
            ->addJsonData('contents', 'copyright', 'copyright_target', 'target')

            ->addJsonData('contents', 'facebook', 'facebook_icon', 'icon')
            ->addJsonData('contents', 'facebook', 'facebook_url', 'url')
            ->addJsonData('contents', 'facebook', 'facebook_target', 'target')

            ->addJsonData('contents', 'youtube', 'youtube_icon', 'icon')
            ->addJsonData('contents', 'youtube', 'youtube_url', 'url')
            ->addJsonData('contents', 'youtube', 'youtube_target', 'target')

            ->addJsonData('contents', 'twitter', 'twitter_icon', 'icon')
            ->addJsonData('contents', 'twitter', 'twitter_url', 'url')
            ->addJsonData('contents', 'twitter', 'twitter_target', 'target')

            ->addJsonData('contents', 'linkedin', 'linkedin_icon', 'icon')
            ->addJsonData('contents', 'linkedin', 'linkedin_url', 'url')
            ->addJsonData('contents', 'linkedin', 'linkedin_target', 'target')

            ->addJsonData('contents', 'instagram', 'instagram_icon', 'icon')
            ->addJsonData('contents', 'instagram', 'instagram_url', 'url')
            ->addJsonData('contents', 'instagram', 'instagram_target', 'target')

            ->addJsonFile('contents', 'app_favicon', 'app_favicon')
            ->addJsonFile('contents', 'header_image', 'header_image')
            ->addJsonFile('contents', 'footer_image', 'footer_image')

            ->makeOrUpdateData();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return 'show.app-setting';
    }

    // Show the form for editing the specified resource.
    public function edit(string $id)
    {
        return 'edit.app-setting';
    }

    // Update the specified resource in storage.
    public function update(Request $request, string $id)
    {
        return 'update.app-setting';
    }

    // Remove the specified resource from storage.
    public function destroy(string $id, Request $request)
    {
        return 'destroy.app-setting';
    }
}
