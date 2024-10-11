<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ResourceAppManager;
use App\Http\Controllers\Controller;
use App\Models\Member;
use Illuminate\Http\Request;

class AboutController extends Controller
{
    public ResourceAppManager $appManger;

    // Initialize the ResourceAppManager with the 'Member' model and resource route
    public function __construct()
    {
        $this->appManger = new ResourceAppManager(Member::class, 'about-us');
    }

    // Display a listing of the resource
    public function index()
    {
        return $this->appManger
            ->addPageData('title', 'Manage Members')
            ->addDataTablesCheckboxColumn()
            ->addDataTablesColumn('Name', 'name')
            ->addDataTablesColumn('Title', 'title')
            ->addDataTablesColumn('Phone', 'phone')
            ->addDataTablesColumn('Email', 'email')
            ->addDataTablesFileColumn('Image', 'image')
            ->addDataTablesStatusColumn()
            ->addDataTablesActionsColumns()
            ->addDataTablesRawColumn()
            ->makeDataTables();
    }

    // Show the form for creating a new resource
    public function create()
    {
        return $this->appManger
            ->addPageData('title', 'Add New Member')

            ->addInput('Name', 'name', className: 'col-5', note: '*')
            ->addInput('Title', 'title', className: 'col-5')
            ->addSerialInput()
            ->addInput('Phone', 'phone', className: 'col-6')
            ->addInput('Email', 'email', type: 'email', className: 'col-6')
            ->addFileInput('Image', 'image', note: '* (Recommended size)')

            // Social media inputs
            ->addInput('Facebook Icon', 'fb_icon', className: 'col-4', value: '<i class="fa-brands fa-facebook"></i>')
            ->addInput('Facebook URL', 'fb_url', className: 'col-4')
            ->addInput('Facebook Target', 'fb_target', className: 'col-4', value: '_target')

            ->addInput('X (Twitter) Icon', 'x_icon', className: 'col-4', value: '<i class="fa-brands fa-x-twitter"></i>')
            ->addInput('X (Twitter) URL', 'x_url', className: 'col-4')
            ->addInput('X (Twitter) Target', 'x_target', className: 'col-4', value: '_target')

            ->addInput('Instagram Icon', 'instagram_icon', className: 'col-4', value: '<i class="fa-brands fa-instagram"></i>')
            ->addInput('Instagram URL', 'instagram_url', className: 'col-4')
            ->addInput('Instagram Target', 'instagram_target', className: 'col-4', value: '_target')

            ->addInput('LinkedIn Icon', 'linkedin_icon', className: 'col-4', value: '<i class="fa-brands fa-linkedin"></i>')
            ->addInput('LinkedIn URL', 'linkedin_url', className: 'col-4')
            ->addInput('LinkedIn Target', 'linkedin_target', className: 'col-4', value: '_target')

            ->createPage();
    }

    // Store a newly created resource in storage
    public function store(Request $request)
    {
        return $this->appManger
            ->storeRequestData($request)
            ->addData('name', required: 'required|max:255')
            ->addData('title')
            ->addData('phone')
            ->addData('email', required: 'email|nullable')
            ->addFile('image', required: 'required|file|max:5000')

            // Social media data
            ->addData('fb_icon')
            ->addData('fb_url')
            ->addData('fb_target')

            ->addData('x_icon')
            ->addData('x_url')
            ->addData('x_target')

            ->addData('instagram_icon')
            ->addData('instagram_url')
            ->addData('instagram_target')

            ->addData('linkedin_icon')
            ->addData('linkedin_url')
            ->addData('linkedin_target')

            ->addData('serial')
            ->addCreator()
            ->storeData();
    }

    // Show the form for editing the specified resource
    public function edit(string $id)
    {
        $app = $this->appManger->addModelData($id);

        if (request()->ajax()) return $app->updateStatus();

        return $app
            ->addPageData('title', 'Edit Member')
            ->addModelData($id)
            ->addInput('Name', 'name', className: 'col-5', note: '*', editable: true)
            ->addInput('Title', 'title', className: 'col-5', editable: true)
            ->addInput('Priority Serial', 'serial', type: 'number', className: 'col-2', editable: true)
            ->addInput('Phone', 'phone', className: 'col-6', editable: true)
            ->addInput('Email', 'email', type: 'email', className: 'col-6', editable: true)
            ->addFileInput('Image', 'image', note: '* (Recommended size)', editable: true)

            // Social media inputs
            ->addInput('Facebook Icon', 'fb_icon', className: 'col-4', editable: true)
            ->addInput('Facebook URL', 'fb_url', className: 'col-4', editable: true)
            ->addInput('Facebook URL Target', 'fb_target', className: 'col-4', editable: true)

            ->addInput('X (Twitter) Icon', 'x_icon', className: 'col-4', editable: true)
            ->addInput('X (Twitter) URL', 'x_url', className: 'col-4', editable: true)
            ->addInput('X (Twitter) Target', 'x_target', className: 'col-4', editable: true)

            ->addInput('Instagram Icon', 'instagram_icon', className: 'col-4', editable: true)
            ->addInput('Instagram URL', 'instagram_url', className: 'col-4', editable: true)
            ->addInput('Instagram URL Target', 'instagram_target', className: 'col-4', editable: true)

            ->addInput('LinkedIn Icon', 'linkedin_icon', className: 'col-4', editable: true)
            ->addInput('LinkedIn URL', 'linkedin_url', className: 'col-4', editable: true)
            ->addInput('LinkedIn URL Target', 'linkedin_target', className: 'col-4', editable: true)

            ->editPage($id);
    }

    // Update the specified resource in storage
    public function update(Request $request, string $id)
    {
        return $this->appManger
            ->addModelData($id)
            ->storeRequestData($request)
            ->addData('name', required: 'required|max:255')
            ->addData('title')
            ->addData('phone')
            ->addData('email', required: 'email|nullable')
            ->addFile('image')

            // Social media data
            ->addData('fb_icon')
            ->addData('fb_url')
            ->addData('fb_target')

            ->addData('x_icon')
            ->addData('x_url')
            ->addData('x_target')

            ->addData('instagram_icon')
            ->addData('instagram_url')
            ->addData('instagram_target')

            ->addData('linkedin_icon')
            ->addData('linkedin_url')
            ->addData('linkedin_target')

            ->addData('serial')
            ->updateData($id);
    }

    // Delete with image file
    protected function deleteWithFiles($id)
    {
        return $this->appManger
            ->addModelData($id)
            ->addDestroyingFile('image')
            ->destroyData(fileDeletable: true);
    }

    // Remove the specified resource from storage
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
