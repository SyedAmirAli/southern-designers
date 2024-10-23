<?php

namespace App\Http\Controllers\Test;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helper\ResourceAppManager;
use App\Models\Test\TestModel;

class TestController extends Controller
{
    public $helper;

    public function __construct(){
        $this->helper = new ResourceAppManager(model: TestModel::class, routeName: "new-helper", viewFolderName: "test", routePrefix: "test", viewPrefix: "");
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view("test.index");
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view("test.create");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->helper
            ->storeRequestData($request) 
            ->addData('email')
            ->addData('username');
            // ->addFile('image', 'picture');

        return response()->json($this->helper->render());
        
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
