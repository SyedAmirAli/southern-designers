<?php

namespace App\Helper\CustomControllers;
use App\Helper\HelperClass;
use App\Models\MissionVision;

class MissionOrVisionController {
    // Display a listing of the resource.
    public $path, $table, $model, $type;
    public function __construct(string $type){
        $this->type = $type;
        $this->path = [
            'asset'=> "media/mission-{$type}/",
            'view'=> 'dynamic-content-upload-page',
            'route'=> "our-{$type}",
        ];
        $this->table = 'mission_visions';
        $this->model = MissionVision::class;
     }

    // Make Protected Resources Function
    protected function resources(string|NULL $type = null)
    { 

        $others = [
            'title' => 'About Page Setup', 
            'path' => $this->path
        ];

        $index = null;

        $create = [
            ['label'=> '', 'name'=> 'type', 'type'=> 'hidden', 'placeholder'=> 'Write here...', 'value'=> $this->type, 'options'=> null], 
            ['label'=> 'Heading', 'name'=> 'heading', 'type'=> 'text', 'placeholder'=> 'Write here...', 'value'=> null, 'options'=> '(*)'], 
            ['label'=> 'Main Title', 'name'=> 'title', 'type'=> 'text', 'placeholder'=> 'Write here...', 'value'=> null, 'options'=> '(*)'], 
            ['label'=> 'Main Description', 'name'=> 'description', 'type'=> 'description', 'placeholder'=> 'Write here...', 'value'=> null, 'options'=> '(*)'],
            ['label'=> 'Banner Image', 'name'=> 'image', 'type'=> 'file', 'placeholder'=> 'Select here...', 'value'=> null, 'options'=> '* (1920x1080)'], 
            ['label'=> 'Video Title', 'name'=> 'primary_title', 'type'=> 'text', 'placeholder'=> 'Write here...', 'value'=> null, 'options'=> null], 
            ['label'=> 'Video Description', 'name'=> 'primary_description', 'type'=> 'textarea', 'placeholder'=> 'Write here...', 'value'=> null, 'options'=> null], 
            ['label'=> 'Video iFrame', 'name'=> 'iframe', 'type'=> 'textarea', 'placeholder'=> '<iframe src="https://www."></iframe>', 'value'=> null, 'options'=> 'e.g. embed iframe'],
            ['label'=> 'Button Title', 'name'=> 'btn_title', 'type'=> 'text', 'placeholder'=> 'Write here...', 'value'=> null, 'options'=> null], 
            ['label'=> 'Button Link', 'name'=> 'btn_link', 'type'=> 'text', 'placeholder'=> 'e.g https://www.example.com', 'value'=> null, 'options'=> null], 
        ]; 

        $edit = $create;

        if($type == 'index'){
            return [
                ...$others,
                'items' => $index, 
            ];
        }

        if($type == 'create'){
            return [
                ...$others,
                'items' => $create, 
            ];
        }

        if($type == 'edit'){
            return [
                ...$others,
                'items' => $edit, 
            ];
        }

        if($type == 'undefined'){
            return [
                ...$others, 
            ];
        }

        return [
            ...$others,
            'index' => $index,
            'create' => $create,
            'edit' => $edit
        ];
    }
    // Return the Indexing page
    public function index() 
    {
        $data = $this->model::where('type', $this->type)->latest('id')->first();
        
        if($data){
            $resources = $this->resources('edit');
            return view("admin.{$this->path['view']}.edit", compact("resources", "data"));
        }

        $resources = $this->resources('create');
        return view("admin.{$this->path['view']}.create", compact('resources'));
    }

    // Show the form for creating a new resource.
    public function create()
    {
        
        $resources = $this->resources('create');
        return view("admin.{$this->path['view']}.create", compact('resources'));
    }

    // Store a newly created resource in storage.
    public function store($request)
    {
        $request->validate([
            'heading'=> 'required',
            'title'=> 'required',
            'description'=> 'required',
            'iframe'=> 'required',
            'primary_title'=> 'required',
            'primary_description'=> 'required', 
            'image'=> 'required|file',
        ]);

        $resources = $this->resources('edit');
        return HelperClass::resourceDataStore($this->table, $request, [
            'heading',
            'title',
            'description',
            'iframe',
            'primary_title',
            'primary_description',
            'btn_title',
            'type',
            'btn_link',
        ], ['image'], $this->path['asset'], $this->path, null, $resources);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        if(request()->ajax()){
            return null;
        }
    }

    // Show the form for editing the specified resource.
    public function edit(string $id)
    {
        $resources = $this->resources('edit');
        return HelperClass::resourceDataEdit($this->table, $id, $this->path, $resources);
    }

    // Update the specified resource in storage.
    public function update($request, string $id)
    {
        $request->validate([
            'heading'=> 'required',
            'title'=> 'required',
            'description'=> 'required',
            'iframe'=> 'required',
            'primary_title'=> 'required',
            'primary_description'=> 'required', 
        ]);
        
        $resources = $this->resources('index');
        return HelperClass::resourceDataUpdate($this->table, $id, $request, [
            'heading',
            'title',
            'description',
            'iframe',
            'primary_title',
            'primary_description',
            'btn_title',
            'type',
            'btn_link',
        ], ['image'], $this->path['asset'], $this->path, null, $resources);
    }

    // Remove the specified resource from storage.
    public function destroy(string $id, $request)
    {
        return HelperClass::resourceDataDelete($this->table, $request, $id, null);
    }
} 