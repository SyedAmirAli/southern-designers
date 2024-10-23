@extends('layouts.admin.app')

@section('content')

<style>
    .password-fields-icon{
        padding: 10px 12px;
        background: var(--bs-warning);
        border-radius: 0 4px 4px 0;
        font-size: 22px;
        cursor: pointer;
    }

    .password-fields-icon.active #show { display: block; color: var(--bs-danger)}
    .password-fields-icon.active #hidden { display: none; color: var(--bs-green)}
    .password-fields-icon #show { display: none; color: var(--bs-danger)}
    .password-fields-icon #hidden { display: block; color: var(--bs-green)}

</style>

<form class="p-4" style="background-color: rgb(226 232 240); border-radius: 8px;" method="POST" action="{{ route('admin.password_reset') }}">
    @csrf
    
    <h1>Change Password</h1>
    <div class="form-row row">
      <div class="col-md-6">
        <label for="validationServer01" class="font-weight-bold" style="font-weight: 600; font-size: 16px;">E-mail </label>
        <input type="text" readonly class="form-control is-valid" id="validationServer01" value="{{ Auth::user()->email }}" required>
        <div class="valid-feedback">
          {{ Auth::user()->user_name }}
        </div>
      </div>
      <div class="col-md-6">
        <label for="" style="font-weight: 600; font-size: 16px;">Current Password</label>
        <div class="input-group" password-fields>
          <div class="input-group-prepend">
            <span class="input-group-text" style="padding: 12px 8px;"><i class="fal fa-key"></i></span>
          </div>
          <input type="password" class="form-control" id="password" name="password" placeholder="********" required>
          <div class="password-fields-icon">
            <i class="fas fa-eye" id="show" input-id="#password"></i>
            <i class="fas fa-eye-slash" id="hidden" input-id="#password"></i>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <label for="" style="font-weight: 600; font-size: 16px;">New Password</label>
        <div class="input-group" password-fields>
          <div class="input-group-prepend">
            <span class="input-group-text" style="padding: 12px 8px;"><i class="fal fa-key"></i></span>
          </div>
          <input type="password" class="form-control" id="new_password" name="new_password" placeholder="********" required>
          <div class="password-fields-icon">
            <i class="fas fa-eye" id="show" input-id="#new_password"></i>
            <i class="fas fa-eye-slash" id="hidden" input-id="#new_password"></i>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <label for="" style="font-weight: 600; font-size: 16px;">Re-type Password</label>
        <div class="input-group" password-fields>
          <div class="input-group-prepend">
            <span class="input-group-text" style="padding: 12px 8px;"><i class="fal fa-key"></i></span>
          </div>
          <input type="password" class="form-control" id="conf_password" name="conf_password" placeholder="********" required>
          <div class="password-fields-icon">
            <i class="fas fa-eye" id="show" input-id="#conf_password"></i>
            <i class="fas fa-eye-slash" id="hidden" input-id="#conf_password"></i>
          </div>
        </div>
      </div>
    </div> 

    <div class="mt-3" style="width: 100%; display: flex; align-items: flex-end; justify-content: space-between;">
        <a href="{{ route('frontend.password_forgot') }}" style="text-decoration: underline; color: var(--bs-danger); font-size: 15px;">Forgot Your Password!</a>
        <button class="btn btn-primary" type="submit">Reset Now</button>
    </div>
</form>

<form class="p-4 mt-4" style="background-color: rgb(226 232 240); border-radius: 8px;" method="POST" action="{{ route('admin.change_email_or_user_name') }}">
    @csrf

    <h1>Change Email/Username</h1>
    <div class="form-row row">
      <div class="col-md-4">
        <label for="" class="font-weight-bold" style="font-weight: 600; font-size: 16px;">E-mail </label>
        <input type="text" class="form-control" id="email" name="email" value="{{ Auth::user()->email }}" required> 
      </div>
      <div class="col-md-4">
        <label for="" class="font-weight-bold" style="font-weight: 600; font-size: 16px;">E-mail </label>
        <input type="text" class="form-control" name="user_name" id="user_name" value="{{ Auth::user()->user_name }}" required> 
      </div>
      <div class="col-md-4">
        <label for="" style="font-weight: 600; font-size: 16px;">Current Password</label>
        <div class="input-group" password-fields>
          <div class="input-group-prepend">
            <span class="input-group-text" style="padding: 12px 8px;"><i class="fal fa-key"></i></span>
          </div>
          <input type="password" class="form-control" id="password" name="password" placeholder="********" required>
          <div class="password-fields-icon">
            <i class="fas fa-eye" id="show" input-id="#password"></i>
            <i class="fas fa-eye-slash" id="hidden" input-id="#password"></i>
          </div>
        </div>
      </div> 
    </div> 

    <div class="mt-3" style="width: 100%; display: flex; align-items: flex-end; justify-content: space-between;">
        <a href="#"></a>
        <button class="btn btn-primary" type="submit">Change Now</button>
    </div>
</form>

@endsection

@push('js')
    <script>
        $(document).ready(function(){
            $("[password-fields] i#hidden").click(function(e){
                $($(this).attr('input-id')).attr("type", "text")
                $(e.target).parent().addClass("active")
            });

            $("[password-fields] i#show").click(function(e){
                $($(this).attr('input-id')).attr("type", "password")
                $(e.target).parent().removeClass("active")
            });
        })
    </script>
@endpush

{{-- 
<div class="col-md-4 mb-3">
    <label for="" style="font-weight: 600; font-size: 16px;">Last name</label>
    <input type="text" class="form-control is-valid" id="validationServer02" placeholder="Last name" value="Otto" required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div> --}}