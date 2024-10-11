<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Helper\SinglePageDataKeyManager;
use App\Http\Controllers\Controller;
use App\Models\SinglePageData;
use Illuminate\Http\Request;

class AuthPageSetupController extends Controller
{
    public $appManager;
    public function __construct(){
        $this->appManager = new ResourceAppManager(SinglePageData::class, 'auth-page', modelDataReference: SinglePageDataKeyManager::AUTHENTICATION_PAGE);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = $this->appManager->model::where('enum', $this->appManager->model_data_reference)->latest('id')->first();
        $contents = $data ? json_decode($data->contents, true) : array();

        return $this->appManager->addPageData('title', 'Edit Authentication Page')
            ->addInput(
                'Page Title', 
                'title', 
                note: '* (Just for Identify)',
                value: $data ? $data->title : ''
            )
            ->addInput(
                'Sign In Heading', 
                'sign_in_heading', 
                className: 'col-6',
                value: isset($contents['sign_in_heading']) ? $contents['sign_in_heading'] : ''
            )
            ->addInput(
                'Sign In Heading', 
                'sign_up_heading', 
                className: 'col-6',
                value: isset($contents['sign_up_heading']) ? $contents['sign_up_heading'] : ''
            )
            ->addInput(
                'Sign In Title', 
                'sign_in_title', 
                className: 'col-6',
                value: isset($contents['sign_in_title']) ? $contents['sign_in_title'] : ''
            )
            ->addInput(
                'Sign Up Title', 
                'sign_up_title', 
                className: 'col-6',
                value: isset($contents['sign_up_title']) ? $contents['sign_up_title'] : ''
            )
            ->addTextareaEditor(
                'Sign In Summery', 
                'sign_in_summery', 
                className: 'col-6',
                value: isset($contents['sign_in_summery']) ? $contents['sign_in_summery'] : ''
            )
            ->addTextareaEditor(
                'Sign Up Summery', 
                'sign_up_summery', 
                className: 'col-6',
                value: isset($contents['sign_up_summery']) ? $contents['sign_up_summery'] : ''
            )
            ->addTextareaEditor(
                'Facebook Icon', 
                'fb_icon', 
                className: 'col-6',
                note: "<a target='_blank' href='https://fontawesome.com/v6/'>Font Awesome</a> v6 => with `i` tag or svg text.",
                value: isset($contents['fb_icon']) ? $contents['fb_icon'] : ''
            )
            ->addTextareaEditor(
                'Google Icon', 
                'google_icon', 
                className: 'col-6',
                note: "<a target='_blank' href='https://fontawesome.com/v6/'>Font Awesome</a> v6 => with `i` tag or svg text.",
                value: isset($contents['google_icon']) ? $contents['google_icon'] : ''
            )
            ->addInput(
                'Forgot Password Title', 
                'forgot_password_title', 
                className: 'col-4',
                value: isset($contents['forgot_password_title']) ? $contents['forgot_password_title'] : ''
            )
            ->addInput(
                'Go to Login Title', 
                'go_to_login_title', 
                className: 'col-4',
                value: isset($contents['go_to_login_title']) ? $contents['go_to_login_title'] : ''
            )
            ->addInput(
                'Go to Create Account Title', 
                'go_to_register_title', 
                className: 'col-4',
                value: isset($contents['go_to_register_title']) ? $contents['go_to_register_title'] : ''
            )
            ->addInput(
                'Sign In Button Title', 
                'sign_in_btn_title', 
                className: 'col-6',
                value: isset($contents['sign_in_btn_title']) ? $contents['sign_in_btn_title'] : ''
            )
            ->addInput(
                'Sign Up Button Title', 
                'sign_up_btn_title', 
                className: 'col-6',
                value: isset($contents['sign_up_btn_title']) ? $contents['sign_up_btn_title'] : ''
            )
            ->addInput(
                'Name Place Holder', 
                'name_placeholder', 
                className: 'col-4',
                value: isset($contents['name_placeholder']) ? $contents['name_placeholder'] : ''
            )
            ->addInput(
                'E-mail Place Holder', 
                'email_placeholder', 
                className: 'col-4',
                value: isset($contents['email_placeholder']) ? $contents['email_placeholder'] : ''
            )
            ->addInput(
                'Password Place Holder', 
                'password_placeholder', 
                className: 'col-4',
                value: isset($contents['password_placeholder']) ? $contents['password_placeholder'] : ''
            )
            ->addTextareaEditor(
                'Show Password Icon', 
                'show_pass_icon', 
                className: 'col-6',
                note: "<a target='_blank' href='https://fontawesome.com/v6/'>Font Awesome</a> v6 => with `i` tag or svg text.",
                value: isset($contents['show_pass_icon']) ? $contents['show_pass_icon'] : ''
            )
            ->addTextareaEditor(
                'Hidden Password Icon', 
                'hidden_pass_icon', 
                className: 'col-6',
                note: "<a target='_blank' href='https://fontawesome.com/v6/'>Font Awesome</a> v6 => with `i` tag or svg text.",
                value: isset($contents['hidden_pass_icon']) ? $contents['hidden_pass_icon'] : ''
            )
            ->addInput(
                'Sign In Alternative Title', 
                'sign_in_alt_title', 
                className: 'col-6',
                value: isset($contents['sign_in_alt_title']) ? $contents['sign_in_alt_title'] : ''
            )
            ->addInput(
                'Sign Up Alternative Title', 
                'sign_up_alt_title', 
                className: 'col-6',
                value: isset($contents['sign_up_alt_title']) ? $contents['sign_up_alt_title'] : ''
            )
            ->createPage();
    }

    /** 
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return $this->appManager->unavailablePages();
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
            ->addJsonData('contents', 'sign_in_heading', 'sign_in_heading')
            ->addJsonData('contents', 'sign_up_heading', 'sign_up_heading')
            ->addJsonData('contents', 'sign_in_title', 'sign_in_title')
            ->addJsonData('contents', 'sign_up_title', 'sign_up_title')
            ->addJsonData('contents', 'sign_in_summery', 'sign_in_summery')
            ->addJsonData('contents', 'sign_up_summery', 'sign_up_summery')
            ->addJsonData('contents', 'fb_icon', 'fb_icon')
            ->addJsonData('contents', 'google_icon', 'google_icon')
            ->addJsonData('contents', 'forgot_password_title', 'forgot_password_title')
            ->addJsonData('contents', 'go_to_login_title', 'go_to_login_title')
            ->addJsonData('contents', 'go_to_register_title', 'go_to_register_title')
            ->addJsonData('contents', 'sign_in_btn_title', 'sign_in_btn_title')
            ->addJsonData('contents', 'sign_up_btn_title', 'sign_up_btn_title') 
            ->addJsonData('contents', 'name_placeholder', 'name_placeholder') 
            ->addJsonData('contents', 'email_placeholder', 'email_placeholder') 
            ->addJsonData('contents', 'password_placeholder', 'password_placeholder') 
            ->addJsonData('contents', 'show_pass_icon', 'show_pass_icon') 
            ->addJsonData('contents', 'hidden_pass_icon', 'hidden_pass_icon') 
            ->addJsonData('contents', 'sign_up_alt_title', 'sign_up_alt_title') 
            ->addJsonData('contents', 'sign_in_alt_title', 'sign_in_alt_title') 
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