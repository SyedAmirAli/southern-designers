<?php

namespace App\Helper;

use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\View;
use Intervention\Image\Facades\Image;
use Yajra\DataTables\Facades\DataTables;

class ResourceAppManager
{
    public bool $error_state;
    public int $auth_id;
    static string $asset_prefix = "media/";
    public $model, $request, $db_tables, $model_data;
    public string $route_prefix, $route_suffix, $route_name, $view_folder_name, $model_data_reference, $message;
    public array $route, $asset, $view, $make_data, $db_tables_raws, $resources, $page_data, $form_data, $destroying_files, $validate_inputs, $make_json_model, $error;

    public function __construct($model, string $routeName, string $viewFolderName = "content-upload-page", string $routePrefix = "admin", string $routeSuffix = "", string $viewPrefix = "", string $viewSuffix = "", string $modelDataReference = "")
    {
        $this->model = $model;
        $this->route_prefix = $routePrefix;
        $this->route_suffix = $routeSuffix;
        $this->route_name = $routeName;
        $this->view_folder_name = $viewFolderName;
        $this->model_data_reference = $modelDataReference;

        $this->auth_id = Auth::user()->id ?? 0;

        $route = array();
        $view = array();
        $view = array();

        $route_prefix = empty($routePrefix) ? '' : "{$routePrefix}.";
        $route_suffix = empty($routeSuffix) ? '' : "{$routeSuffix}.";

        $view_prefix = empty($viewPrefix) ? '' : "{$viewPrefix}.";
        $view_suffix = empty($viewSuffix) ? '' : "{$viewSuffix}.";


        $route_index = "{$route_prefix}{$this->route_name}.index{$route_suffix}";
        $route_create = "{$route_prefix}{$this->route_name}.create{$route_suffix}";
        $route_store = "{$route_prefix}{$this->route_name}.store{$route_suffix}";
        $route_edit = "{$route_prefix}{$this->route_name}.edit{$route_suffix}";
        $route_update = "{$route_prefix}{$this->route_name}.update{$route_suffix}";
        $route_show = "{$route_prefix}{$this->route_name}.show{$route_suffix}";
        $route_destroy = "{$route_prefix}{$this->route_name}.destroy{$route_suffix}";

        $route['index'] = Route::has($route_index) ? route($route_index) : '#';
        $route['create'] = Route::has($route_create) ? route($route_create) : '#';
        $route['store'] = Route::has($route_store) ? route($route_store) : '#';

        $route['edit'] = Route::has($route_edit) ? fn(array|string|int $arg = 0) => route($route_edit, $arg) : fn() => '#';
        $route['update'] = Route::has($route_update) ? fn(array|string|int $arg = 0) => route($route_update, $arg) : fn() => '#';
        $route['show'] = Route::has($route_show) ? fn(array|string|int $arg = 0) => route($route_show, $arg) : fn() => '#';
        $route['destroy'] = Route::has($route_destroy) ? fn(array|string|int $arg = 0) => route($route_destroy, $arg) : fn() => '#';

        $asset['files'] = static::$asset_prefix . $this->route_name . '/files/';
        $asset['icons'] = static::$asset_prefix . $this->route_name . '/icons/';
        $asset['videos'] = static::$asset_prefix . $this->route_name . '/videos/';
        $asset['images'] = static::$asset_prefix . $this->route_name . '/images/';

        $view_index = "{$view_prefix}{$this->view_folder_name}.index{$view_suffix}";
        $view_create = "{$view_prefix}{$this->view_folder_name}.create{$view_suffix}";
        $view_edit = "{$view_prefix}{$this->view_folder_name}.edit{$view_suffix}";
        $view_show = "{$view_prefix}{$this->view_folder_name}.show{$view_suffix}";

        $view['index'] = View::exists($view_index) ? fn($compact) => view($view_index, $compact) : fn() => '404 | Not Found';
        $view['create'] = View::exists($view_create) ? fn($compact) => view($view_create, $compact) : fn() => '404 | Not Found';
        $view['edit'] = View::exists($view_edit) ? fn($compact) => view($view_edit, $compact) : fn() => '404 | Not Found';
        $view['show'] = View::exists($view_show) ? fn($compact) =>  view($view_show, $compact) : fn() => '404 | Not Found';

        $this->route = $route;
        $this->view = $view;
        $this->asset = $asset;

        $this->form_data = array();
        $this->resources = array();
        $this->db_tables_raws = array();
        $this->validate_inputs = array();
        $this->destroying_files = array();
        $this->make_json_model = array();

        $this->error_state = false;
        $this->message = "There is an serious error occurred!";
        $this->error = array(
            'status' => 404,
            'type' => 'error',
            'message' => $this->message,
            'redirect' => fn() => redirect()->back()->withErrors($this->message),
            'result' => null,
        );

        $this->db_tables = DataTables::eloquent($this->model::query());
    }

    public function storeImage($file, $extension, $oldImage, $width = 1920, $height = 1200)
    {
        $create_path = public_path($this->asset['images']);
        if (!File::isDirectory($create_path)) {
            File::makeDirectory($create_path, 0777, true, true);
        }

        $ext = $extension ?? $file->getClientOriginalExtension();
        // $ext = 'webp';
        $file_name = Carbon::now()->toDateString() . '-' . Str::random(40) . '.' . $ext;
        $path_file_name = $this->asset['images'] . $file_name;
        $file = Image::make($file);

        $file->resize($width, $height, function ($constraint) {
            $constraint->aspectRatio();
            $constraint->upsize();
        })->stream($ext, 100);

        $file->save($path_file_name);

        if (file_exists($oldImage)) {
            unlink($oldImage);
        }

        return $path_file_name;
    }

    public function storeFile($file, string $path, ?string $old_file = null)
    {
        $create_path = public_path($path);

        if (!File::isDirectory($create_path)) File::makeDirectory($create_path, 0777, true, true);

        $ext = $file->getClientOriginalExtension();
        $file_name = Carbon::now()->toDateString() . '___' . mt_rand(10000, 999999999) . '.' . $ext;
        $file->move($create_path, $file_name);

        if ($old_file && file_exists($old_file)) unlink($old_file);

        return $path . $file_name;
    }

    public function saveFile($file, $old_file = null, string $fileType = "image", string|NULL $extension = null, $width = 1920, $height = 1200)
    {
        switch ($fileType) {
            case "image":
                return $this->storeImage($file, $extension, $old_file, $width, $height);

            case 'icon':
                return $this->storeFile($file, $this->asset['icons'], $old_file);

            case 'video':
                return $this->storeFile($file, $this->asset['videos'], $old_file);

            default:
                return $this->storeFile($file, $this->asset['files'], $old_file);
        }
    }

    public function storeRequestData($request)
    {
        $this->request = $request;
        return $this;
    }

    public function addModelData(string|int $id)
    {
        $this->model_data = $this->model::findOrFail($id);
        return $this;
    }

    public function addSinglePageModelData(string $identifierKey = 'enum', bool $unique = true)
    {
        $model = $this->model::where($identifierKey, $this->model_data_reference);

        if ($unique && $model->count() > 1) {
            $this->error_state = true;
            $this->message = 'The Identifier key must required an unique key!';

            return $this;
        }

        $this->model_data = $model->latest('id')->first();
        if (!is_null($this->model_data) || $this->model_data) {
            return $this;
        }

        $this->make_data[$identifierKey] = $this->model_data_reference;
        $this->model_data = new $this->model();
        return $this;
    }

    public function addData(string $tableKey, ?string $inputName = null, string|NULL $required = null, NULL|string|int|bool $value = null)
    {
        $name = $inputName ?? $tableKey;
        $defaultValue = $value ?? $this->request[$name];

        if ($required) {
            $this->validate_inputs[$name] = $required;
        }

        $this->make_data[$tableKey] = $defaultValue;
        return $this;
    }

    public function addJsonData(string $tableKey = "contents", string $fieldName, string $inputName = '', ?string $key = null, string|NULL $required = null, NULL|string|int|bool $value = null)
    {
        if (empty($inputName)) $inputName = $fieldName;
        $defaultValue = $value ?? $this->request[$inputName];

        if ($required) {
            $this->validate_inputs[$inputName] = $required;
        }

        if ($key) {
            $this->make_json_model[$tableKey][$fieldName][$key] = $defaultValue;
        } else {
            $this->make_json_model[$tableKey][$fieldName] = $defaultValue;
        }

        return $this;
    }

    public function addJsonFile(string $tableKey = "contents", string $fieldName, string $inputName, ?string $key = null, bool $multiple = false, string $fileType = "image", string|NULL $extension = null, $width = 1920, $height = 1200, string $oldPath = null)
    {
        if ($multiple) {
            $files = array();

            if ($this->request->hasFile($inputName)) {
                foreach ($this->request->file($inputName) as $file) {
                    $files[] = $this->saveFile($file, $oldPath, $fileType, $extension, $width, $height);
                }

                if ($oldPath) {
                    foreach (json_decode($oldPath, true) as $rm_file) {
                        if (file_exists($rm_file)) unlink($rm_file);
                    }
                }
            } else {
                if ($oldPath) {
                    $old_files = $oldPath ? json_decode($oldPath, true) : array();
                    $valid_old_files = json_decode($this->request["old_{$inputName}"], true);

                    $removable_files = array_filter($old_files, fn($rm_file) => !in_array($rm_file, $valid_old_files));

                    foreach ($removable_files as $rm_file) {
                        if (file_exists($rm_file)) unlink($rm_file);
                    }

                    $files = $valid_old_files;
                }
            }

            if ($key) {
                $this->make_json_model[$tableKey][$fieldName][$key] = json_encode($files);
            } else {
                $this->make_json_model[$tableKey][$fieldName] = json_encode($files);
            }
            return $this;
        }

        $old_file = $this->request["old_$inputName"];

        if ($this->request->hasFile($inputName)) {
            $file = $this->saveFile($this->request->file($inputName), $old_file, $fileType, $extension, $width, $height);

            if ($key) {
                $this->make_json_model[$tableKey][$fieldName][$key] = $file;
            } else {
                $this->make_json_model[$tableKey][$fieldName] = $file;
            }
        } else {
            if ($key) {
                $this->make_json_model[$tableKey][$fieldName][$key] = $old_file;
            } else {
                $this->make_json_model[$tableKey][$fieldName] = $old_file;
            }
        }

        return $this;
    }

    public function makeJsonData(string $tableKey = 'contents', ?string $refKey = null, bool $encoded = true)
    {
        $ref_key = $refKey ?? $tableKey;

        if ($encoded) {
            $this->make_data[$tableKey] = json_encode($this->make_json_model[$ref_key]);
        } else {
            $this->make_data[$tableKey] = $this->make_json_model[$ref_key];
        }

        return $this;
    }

    public function makeOrUpdateData(?string $tableKey = 'contents', ?string $refKey = null, string $redirect = 'index')
    {
        if ($this->error_state) {
            return $this->error['redirect']();
        }

        $contents = array();
        $ref_key = $refKey ?? $tableKey;

        if ($tableKey) {
            $contents[$tableKey] = is_array($this->make_json_model[$ref_key]) ? json_encode($this->make_json_model[$ref_key]) : $this->make_json_model[$ref_key];
        } else {
            foreach ($this->make_json_model as $key => $make_data) {
                $contents[$key] = is_array($make_data) ? json_encode($make_data) : $make_data;
            }
        }

        $make_or_update_data = array_merge($this->make_data, $contents);

        if ($this->model_data->id) {
            $data = $this->model_data->update($make_or_update_data);
        } else {
            $data = $this->model_data->create($make_or_update_data);
        }

        if (in_array($redirect, ['show', 'edit', 'update', 'destroy'])) {
            return redirect($this->route[$redirect]())->withSuccessMessage('Data Updated Successfully!');
        }

        return redirect($this->route[$redirect])->withSuccessMessage('Data Updated Successfully!');
    }

    public static function hasChangePermission(bool $creatorChecker, int $created_by_id)
    {

        if ($creatorChecker) {
            if (Auth::id() == $created_by_id || UserManagement::role('admin')) {
                return true;
            }

            return false;
        }

        return true;
    }

    public function addDataTablesCheckboxColumn(string $label = 'Select', bool $creatorChecker = true)
    {
        $this->db_tables_raws[] = 'checkbox';
        $this->resources['items']['labels'][] = $label;
        $this->resources['items']['columns'][] = ['data' => 'checkbox', 'name' => 'checkbox', 'orderable' => false, 'searchable' => false, 'width' => 'auto'];

        $this->db_tables->addColumn('checkbox', function ($row) use ($creatorChecker) {
            if (self::hasChangePermission($creatorChecker, $row->created_by)) {
                return "<div class='custom-control custom-checkbox'><input type='checkbox' class='custom-control-input multi_checkbox' id='{$row->id}' name='multi_checkbox[]' value='{$row->id}'><label for='{$row->id}' class='custom-control-label'></label></div>";
            }

            return "<div class='custom-control custom-checkbox'><input type='checkbox' class='custom-control-input multi_checkbox' id='' disabled name='multi_checkbox[]' value=''><label for='' class='custom-control-label'></label></div>";
        });

        return $this;
    }

    public function addDataTablesStatusColumn(string $label = 'Status', string $tableKey = 'status', string $align = 'center', bool $creatorChecker = true)
    {
        $this->db_tables_raws[] = $tableKey;
        $this->resources['items']['labels'][] = $label;
        $this->resources['items']['columns'][] = ['data' => $tableKey, 'name' => $tableKey, 'orderable' => false, 'searchable' => false];

        $this->db_tables->addColumn($tableKey, function ($row) use ($tableKey, $align, $creatorChecker) {
            $status = $row->{$tableKey} == 1 ? 'checked' : '';
            $edit = $this->route['edit']($row->id);

            if (self::hasChangePermission($creatorChecker, $row->created_by)) {
                return "
                    <div style='width: 100%; display: flex; align-items: {$align}; justify-content: {$align}'>
                        <div class='form-check form-switch'>
                            <input class='form-check-input change-status c-pointer' data-url='{$edit}' type='checkbox' name={$tableKey} {$status}>
                        </div>
                    </div>
                ";
            } else {
                return "<div class='btn-group'>Unavailable</div>";
            }
        });

        return $this;
    }

    public function addDataTablesActionsColumns(string $label = "Actions", bool $editable = true, bool $deletable = true, bool $creatorChecker = true)
    {
        $this->db_tables_raws[] = "actions";
        $this->resources['items']['labels'][] = $label;
        $this->resources['items']['columns'][] = ['data' => 'actions', 'name' => 'actions', 'orderable' => false, 'searchable' => false];

        $this->db_tables->addColumn('actions', function ($row) use ($editable, $deletable, $creatorChecker) {
            $edit = $this->route['edit']($row->id);
            $destroy = $this->route['destroy']($row->id);

            $editable = $editable ? "<a href='{$edit}' class='btn btn-sm btn-warning border-0 px-10px fs-15 link-edit'><i class='far fa-pencil-alt'></i></a>" : "";
            $deletable = $deletable ? "<button type='button' class='btn btn-sm btn-danger border-0 px-10px fs-15 link-delete' data-url='{$destroy}'><i class='far fa-trash-alt'></i></button>" : "";

            if (self::hasChangePermission($creatorChecker, $row->created_by)) {
                return "<div class='btn-group'>{$editable}{$deletable}</div>";
            } else {
                return "<div class='btn-group'>Unavailable</div>";
            }
        });

        return $this;
    }

    public function addDataTablesColumn(string $label, string $tableKey, ?string $column_name = null, bool $orderable = true, bool $searchable = true, ?callable $callback = null)
    {
        $column = $column_name ?? $tableKey;
        $this->db_tables_raws[] = $column;
        $this->resources['items']['labels'][] = $label;
        $this->resources['items']['columns'][] = ['data' => $tableKey, 'name' => $column, 'orderable' => $orderable, 'searchable' => $searchable];

        if ($callback) {
            $this->db_tables->addColumn($column, fn($row) => $callback($row->{$tableKey}));
        } else {
            $this->db_tables->addColumn($column, fn($row) => $row->{$tableKey});
        }

        return $this;
    }

    public function addDataTablesFileColumn(string $label, string $tableKey, ?string $column_name = null, callable|string $fileHolder = "image", $width = 80)
    {
        $column = $column_name ?? $tableKey;
        $this->db_tables_raws[] = $column;
        $this->resources['items']['labels'][] = $label;
        $this->resources['items']['columns'][] = ['data' => $tableKey, 'name' => $column, 'orderable' => false, 'searchable' => false];

        $this->db_tables->addColumn($column, function ($row) use ($tableKey, $fileHolder, $width) {
            $src = asset($row->{$tableKey});
            $title = isset($row->title) ? $row->title : 'Thumbnail Image';

            if (is_string($fileHolder) && $fileHolder == 'image') {
                return "<img src='{$src}' alt='{$title}' width='{$width}' />";
            };

            return $fileHolder(array('src' => $src, 'title' => $title));
        });

        return $this;
    }

    public function addDataTablesRawColumn()
    {
        $this->db_tables->rawColumns($this->db_tables_raws);
        return $this;
    }

    public function makeDataTables(bool $make = true)
    {
        if (request()->ajax()) {
            return $this->db_tables->make();
        }

        $this->resources['routes'] = $this->route;
        $resources = $this->resources;

        return $this->view['index'](compact('resources'));
    }

    public function addPageData(string $key, $value)
    {
        $this->page_data[$key] = $value;
        $this->resources['page_data'] = $this->page_data;
        return $this;
    }

    public function separatorBlock(string $title)
    {
        $this->form_data[] = "<div style='font-weight: 600; padding: 18px 24px; color: #c4c4c4; font-size: 32px; font-style: italic; text-decoration: underline;'>{$title}</div>";
        return $this;
    }

    public function addInput(string $label, string $tableKey, ?string $inputName = null, string $className = "col-12", string $note = null, string $type = "text", string|int $placeholder = "Write here...", string|int|NULL $value = null, bool $editable = false, string $attributes = '')
    {
        $name = $inputName ?? $tableKey;
        $old_value = $value ?? old($name);
        $default_value = $editable ? $this->model_data->{$tableKey} : $old_value;
        $html_value = htmlspecialchars($default_value, ENT_QUOTES);

        if ($type == "hidden") {
            $this->form_data[$tableKey] = "<input type='hidden' value='{$html_value}' id='{$name}' name='{$name}' {$attributes}>";
        } else {
            $this->form_data[$tableKey] =
                "<div class='{$className}'>
                    <label for='{$name}' class='form-label require'>
                        <b>{$label}</b> 
                            <span class='text-danger'>{$note}</span>
                        </label>
                    <input type='{$type}' value='{$html_value}' class='form-control custom-input input-number' id='{$name}' name='{$name}' placeholder='{$placeholder}' {$attributes}>
                </div>";
        }

        return $this;
    }

    public function addSerialInput(string $label = 'Priority Serial', string $tableKey = 'serial', ?string $inputName = null, string $className = "col-2", string $note = null, string|int|NULL $value = null, bool $editable = false, string $attributes = '')
    {
        $nextSerial = ($this->model::latest('id')->first()->id ?? 0) + 1;

        $name = $inputName ?? $tableKey;
        $old_value = $value ?? old($name);
        $default_value = $editable ? $this->model_data->{$tableKey} : ($old_value ?? $nextSerial);
        $html_value = htmlspecialchars($default_value, ENT_QUOTES);

        $this->form_data[$tableKey] =
            "<div class='{$className}'>
                    <label for='{$name}' class='form-label require'>
                        <b>{$label}</b> 
                            <span class='text-danger'>{$note}</span>
                        </label>
                    <input type='number' value='{$html_value}' class='form-control custom-input input-number' {$attributes} id='{$name}' name='{$name}' placeholder='Priority Serial e.g 1'>
                </div>";

        return $this;
    }

    public function addFileInput(string $label, string $tableKey, ?string $inputName = null, string $className = "col-12", bool $multiple = false, string $note = null, bool $editable = false, ?string $oldPath = null, string $type = 'image')
    {
        $name = $inputName ?? $tableKey;
        $value = $oldPath ?? ($editable ? $this->model_data->{$tableKey} : null);

        if ($multiple) {
            $imagesArray = array();
            $images = null;
            $old_images = null;

            if ($editable && $value) {
                if (is_array($value)) {
                    foreach ($value as $key => $img) {
                        $image = asset($img);
                        $imagesArray[] = "<div class='show-input-image col-3'><figure><img src='{$image}' alt='image-{$key}'/><p>{$img}</p><span class='remove-file' old-file='{$img}' old-files-id='#old_{$name}'>x</span></figure></div>";
                    }
                } else {
                    foreach (json_decode($value) as $key => $img) {
                        $image = asset($img);
                        $imagesArray[] = "<div class='show-input-image col-3'><figure><img src='{$image}' alt='image-{$key}'/><p>{$img}</p><span class='remove-file' old-file='{$img}' old-files-id='#old_{$name}'>x</span></figure></div>";
                    }
                }

                $images = implode("\n", $imagesArray);
                $old_images = "<input type='hidden' value='{$value}' name='old_{$name}' id='old_{$name}' />";
            }

            $this->form_data[$name] =
                "<div class='input-images {$className}'>
                    <label for='{$name}' class='form-label require'>
                        <b>{$label}</b> 
                        <span class='text-danger'>{$note}</span>
                    </label>
                    <input type='file' class='form-control custom-input input-number' id='{$name}' name='{$name}[]' multiple show-images='#input-images-{$name}'>
                    {$old_images} 
                    <div class='input-images-box col-12 row d-100 p-2' id='input-images-{$name}'>$images</div>
                </div>";
        } else {
            $image = "";

            if ($editable && $value) {
                $url = asset($value);

                if ($type == 'video') {
                    $image = ($editable && $value) ? "
                        <div class='show-input-image col-3'>
                            <figure style='height: 300px;'>
                                <video id='preview-video' width='400' height='300' controls>
                                    <source src='{$url}' type='video/mp4'>
                                    Your browser does not support the video tag.
                                </video>
                                <p>{$value}</p>
                            </figure>
                        </div>" : null;
                } else {
                    $image = "<div class='show-input-image col-3'><figure><img src='{$url}' alt='image-0'/><p>{$value}</p></figure></div>";
                }
            }

            $this->form_data[$name] =
                "<div class='input-images {$className}'>
                    <label for='{$name}' class='form-label require'>
                        <b>{$label}</b> 
                        <span class='text-danger'>{$note}</span>
                    </label>
                    <input type='hidden' value='{$value}' name='old_{$name}' id='old_{$name}' />
                    <input type='file' class='form-control custom-input input-number' id='{$name}' name='{$name}' show-images='#input-images-{$name}'>
                    <div class='input-images-box col-12 row d-100 p-2' id='input-images-{$name}'>{$image}</div>
                </div>";
        }


        return $this;
    }

    public function addFile(string $tableKey, ?string $inputName = null, bool $multiple = false, string $fileType = "image", string|NULL $extension = null, $width = 1920, $height = 1200, bool $editable = false, ?string $required = null)
    {
        $name = $inputName ?? $tableKey;

        if (!$editable && !is_null($required)) {
            $this->validate_inputs[$name] = $required;
        }

        $old_file = $editable ? $this->model_data->{$tableKey} : null;

        if ($multiple) {
            $files = array();

            if ($this->request->hasFile($name)) {
                foreach ($this->request->file($name) as $file) {
                    $files[] = $this->saveFile($file, $old_file, $fileType, $extension, $width, $height);
                }

                if ($editable && $old_file) {
                    foreach (json_decode($old_file, true) as $rm_file) {
                        if (file_exists($rm_file)) unlink($rm_file);
                    }
                }
            }

            if ($editable && $this->request->hasFile($name)) {
                $old_files = $old_file ? json_decode($old_file, true) : array();
                $valid_old_files = json_decode($this->request["old_{$name}"], true);

                $removable_files = array_filter($old_files, fn($rm_file) => !in_array($rm_file, $valid_old_files));

                foreach ($removable_files as $rm_file) {
                    if (file_exists($rm_file)) unlink($rm_file);
                }

                // Merge old valid files with newly uploaded files
                $files = array_merge($valid_old_files, $files);
            }

            // Only update make_data if files were uploaded or it's an editable scenario
            if ($this->request->hasFile($name) || $editable) {
                $this->make_data[$tableKey] = json_encode($files);
            }

            return $this;
        }

        if ($this->request->hasFile($name)) {
            if ($editable) {
                $this->make_data[$tableKey] = $this->saveFile($this->request->file($name), $this->model_data->{$name}, $fileType, $extension, $width, $height);
            } else {
                $this->make_data[$tableKey] = $this->saveFile($this->request->file($name), null, $fileType, $extension, $width, $height);
            }
        }

        return $this;
    }

    public function addSelectInput(string $label, string $name, array $options, ?string $tableKey = null, string $className = "col-12", bool $multiple = false, string $note = null, string|int $placeholder = "Select here...", bool $editable = false)
    {
        $fetch_options = [];
        $key = $tableKey ?? $name;
        $value = $editable ? $this->model_data->{$key} : null;

        foreach ($options as $key => $option) {
            $fetch_options[] = "<option value='{$option['value']}' " . ($option['value'] == $value ? 'selected' : '') . ">{$option['label']}</option>";
        }

        $implode_options = implode(" ", $fetch_options);

        if ($multiple) {
            $this->form_data[$name] =
                "<div class='{$className}'>
                    <label for='{$name}' class='form-label require'>
                        <b>{$label}</b> 
                        <span class='text-danger'>{$note}</span>
                    </label>
                    <select name='{$name}[]' id='{$name}' class='select form-control' data-placeholder='{$placeholder}' multiple>
                        <option value=''></option>
                        {$implode_options}
                        </select>                
                </div>";
        } else {
            $this->form_data[$name] =
                "<div class='{$className}'>
                    <label for='{$name}' class='form-label require'>
                        <b>{$label}</b> 
                        <span class='text-danger'>{$note}</span>
                    </label>
                    <select name='{$name}' id='{$name}' class='select form-control' data-placeholder='{$placeholder}'>
                        <option value=''></option>
                        {$implode_options}
                        </select>                
                </div>";
        }

        return $this;
    }

    public function addTextareaEditor(string $label, string $tableKey, ?string $inputName = null, string $note = null, ?string $type = null, string $className = "col-12", string|int $placeholder = "Write here...", string|int|NULL $value = null, bool $editable = false)
    {
        $name = $inputName ?? $tableKey;
        $old_value = $value ?? old($name);
        $def_value = $editable ? $this->model_data->{$tableKey} : $old_value;

        if ($type == 'description') {
            $this->form_data[$name] =
                "<div class='{$className}'>
                    <label for='{$name}' class='form-label require'>
                        <b>{$label}</b> 
                        <span class='text-danger'>{$note}</span>
                    </label>
                    <textarea name='{$name}' id='{$name}' class='description' cols='30' rows='10' placeholder='{$placeholder}'>{$def_value}</textarea>
                </div>";
        } else if ($type == 'summery') {
            $this->form_data[$name] =
                "<div class='{$className}'>
                    <label for='{$name}' class='form-label require'>
                        <b>{$label}</b> 
                        <span class='text-danger'>{$note}</span>
                    </label>
                    <textarea name='{$name}' id='{$name}' class='short_description' cols='30' rows='10' placeholder='{$placeholder}'>{$def_value}</textarea>
                </div>";
        } else {
            $this->form_data[$name] =
                "<div class='{$className}'>
                    <label for='{$name}' class='form-label require'>
                        <b>{$label}</b> 
                        <span class='text-danger'>{$note}</span>
                    </label>
                    
                    <textarea class='form-control custom-input' id='{$name}' name='{$name}' placeholder='{$placeholder}' cols='10' rows='4'>{$def_value}</textarea>          
                </div>";
        }

        return $this;
    }

    public function createPage()
    {
        if ($this->error_state) {
            return $this->error['redirect']();
        }

        $this->resources['routes'] = $this->route;
        $this->resources['form_data'] = $this->form_data;

        $resources = $this->resources;
        return $this->view['create'](compact('resources'));
    }

    public function editPage(string|int $id, bool $creatorChecker = true)
    {
        if ($this->error_state) {
            return $this->error['redirect']();
        }

        $this->resources['routes'] = $this->route;
        $this->resources['form_data'] = $this->form_data;

        $this->resources['id'] = $id;
        $resources = $this->resources;

        if ($creatorChecker) {
            if (UserManagement::role('admin')) {
                return $this->view['edit'](compact('resources'));
            }

            if ($this->model_data->created_by == Auth::id()) {
                return $this->view['edit'](compact('resources'));
            }

            if (request()->ajax()) {
                return response()->json(['status' => 'error']);
            }

            return redirect()->back()->withErrors("You don't have a permission to do this!");
        }

        return $this->view['edit'](compact('resources'));
    }

    public function addCreator(string $tableKey = 'created_by', ?int $auth_id = null)
    {
        $id = is_null($auth_id) ? Auth::id() : $auth_id;
        $this->make_data[$tableKey] = $id;

        return $this;
    }

    public function storeData(bool $encoded = false)
    {
        $create = function () use ($encoded) {
            // validate the request data order by laravel rule validation before create a model
            $this->request->validate($this->validate_inputs);

            // create the model to insert all the data
            $crate_model = $this->model::create($this->make_data);

            // make a json response returning data for ajax/api request handling.
            if ($encoded) {
                return response()->json([
                    'status' => 200,
                    'type' => 'success',
                    'message' => 'Data Created Successfully!',
                    'result' => $crate_model,
                ]);
            }

            return redirect($this->route['index'])->withSuccessMessage('Data Added Successfully!');
        };

        return $create();
    }

    public function updateData(string|int $id, bool $encoded = false, $ajax = true, bool $creatorChecker = true)
    {
        // make an update initiative function for reuse!
        $update = function () use ($id, $encoded, $ajax) {
            $this->request->validate($this->validate_inputs);

            if ($ajax && request()->ajax()) {
                return response()->json(['status' => 'success']);
            }

            // find the data and update this using model
            $update_data = $this->model::findOrFail($id)->update($this->make_data);

            if ($encoded) {
                return response()->json([
                    'status' => 200,
                    'type' => 'success',
                    'message' => 'Data Updated Successfully!',
                    'result' => $update_data,
                ]);
            }

            return redirect($this->route['index'])->withSuccessMessage('Data Updated Successfully!');
        };

        if ($creatorChecker) {
            if ($this->model_data->created_by == Auth::id() || UserManagement::role('admin')) {
                return $update();
            }
            return redirect()->back()->withErrors("You don't have a permission to do this!");
        }

        return $update();
    }

    public function updateStatus(string $tableKey = 'status', bool $creatorChecker = true)
    {
        $update = function () use ($tableKey) {
            // if(request()->ajax() && request('status') == 'true'){
            $key = request('name') ?? $tableKey;
            $this->model_data->{$key} = !$this->model_data->{$key};
            $this->model_data->save();

            return response()->json(['status' => 'success']);
            // }
        };

        if ($creatorChecker) {
            if ($this->model_data->created_by == Auth::id() || UserManagement::role('admin')) {
                return $update();
            }
            return response()->json(['status' => 'error']);
        }

        return $update();
    }

    public function destroyData(bool $fileDeletable = false, bool $creatorChecker = true)
    {
        $delete = function () use ($fileDeletable) {
            if ($fileDeletable) {
                $this->destroyingFiles();
            }

            $this->model_data->delete();
            return response()->json(['status' => 'success']);
        };

        if ($creatorChecker) {
            if ($this->model_data->created_by == Auth::id() || UserManagement::role('admin')) {
                return $delete();
            }
            return response()->json(['status' => 'error']);
        }

        return $delete();
    }

    public function addDestroyingFile(string $tableKey, bool $encoded = false)
    {
        if ($encoded && isset($this->model_data->{$tableKey})) {
            if ($encoded_files = $this->model_data->{$tableKey}) {
                foreach (json_decode($encoded_files, true) as $file) {
                    $this->destroying_files[] = $file;
                }
            }

            return $this;
        }

        if (isset($this->model_data->{$tableKey})) {
            $this->destroying_files[] = $this->model_data->{$tableKey};
        }

        return $this;
    }

    public function checkCreator()
    {
        if (UserManagement::role('admin')) {
            return $this;
        }
        if ($this->model_data->created_by == Auth::id()) {
            return $this;
        }

        if (request()->ajax()) {
            return response()->json(['status' => 'error']);
        }

        return redirect()->back()->withErrors("You don't have a permission to do this!");
    }

    public function destroyingFiles()
    {
        foreach ($this->destroying_files as $key => $file) {
            if (file_exists($file)) unlink($file);
        }

        return $this;
    }

    public function unavailablePages(bool $encoded = false)
    {
        if ($encoded) {
            return response()->js([
                'status' => 404,
                'type' => 'error',
                'message' => 'Unfortunately this page is unavailable!'
            ], 404);
        }
        return redirect()->back()->withErrors("Unfortunately this page is unavailable!");
    }

    public static function unavailablePage(bool $encoded = false)
    {
        if ($encoded) {
            return response()->js([
                'status' => 404,
                'type' => 'error',
                'message' => 'Unfortunately this page is unavailable!'
            ], 404);
        }
        return redirect()->back()->withErrors("Unfortunately this page is unavailable!");
    }

    public function addSlug(string $inputField = "title", ?string $string = null, string $key = 'slug')
    {
        $str = $string ?? $this->request[$inputField];

        if (empty($str)) {
            $this->error_state = true;
            $this->error['message'] = "Slug's `{$inputField} Input field must be required";
        }

        $slug = Str::slug($str);

        if ($this->model::where('slug', $slug)->exists()) {
            $counter = 1;

            while ($this->model::where('slug', $slug . '-' . $counter)->exists()) {
                $counter++;
            }

            $slug = $slug . '-' . $counter;
        }

        $this->make_data[$key] = $slug;
        return $this;
    }

    public function render(): array|object
    {
        return response()->json($this->form_data);
    }
}
