@extends('layouts.client.app') 
@section('page-title') || Login @endsection

@section('contents')
<article class="min-h-screen w-full flex items-center justify-center font-['Montserrat',_sans-serif] p-4">
    <div class="authContainer !pt-20 px-4" id="authContainer">
        <div class="form-authContainer sign-up !w-full md:!w-1/2">
            <form action="{{ route('frontend.auth.register') }}" method="POST"> @csrf
                <h1 class="text-3xl font-bold text-primary uppercase">{{ $details['sign_up_heading'] }}</h1>    
                <div class="social-icons">
                    <a href="{{ route('frontend.o-auth.google.redirect') }}" class="icon">{!! $details['google_icon'] !!}</a>
                    <a href="{{ route('frontend.o-auth.facebook.redirect') }}" class="icon">{!! $details['fb_icon'] !!}</a>
                </div>
                <span>{{ $details['sign_up_alt_title'] }}</span>
                <input type="text" placeholder="{{ $details['name_placeholder'] }}" name="name" id="name">
                <input type="text" placeholder="{{ $details['email_placeholder'] }}" name="username_or_email" id="register_username_or_email">

                <div class="w-full relative">
                    <input type="password" placeholder="{{ $details['password_placeholder'] }}" name="password" id="reg_password">
                    <p class="absolute right-3 cursor-pointer top-1 password group" password="#password">
                        {!! $details['show_pass_icon'] !!} {!! $details['hidden_pass_icon'] !!}
                    </p>
                </div>
                <strong href="{{ route('frontend.password_forgot') }}" id="login-account" class="block md:hidden mb-4 cursor-pointer duration-500 hover:tracking-wide hover:!text-primary hover:drop-shadow-primary !text-violet-500 font-semibold">{{ $details['go_to_login_title'] }}</strong>
                <button class="duration-500 hover:drop-shadow-primary hover:tracking-wider font-bold">{{ $details['sign_up_btn_title'] }}</button>
            </form>
        </div>
        <div class="form-authContainer sign-in !w-full md:!w-1/2">
            <form action="{{ route('frontend.auth.login') }}" method="POST"> @csrf
                <h1 class="text-3xl font-bold text-primary uppercase">{{ $details['sign_in_heading'] }}</h1>
                <div class="social-icons">
                    <a href="{{ route('frontend.o-auth.google.redirect') }}" class="icon">{!! $details['google_icon'] !!}</a>
                    <a href="{{ route('frontend.o-auth.facebook.redirect') }}" class="icon">{!! $details['fb_icon'] !!}</a>
                </div>
                <span>{{ $details['sign_in_alt_title'] }}</span>
                <input type="text" placeholder="{{ $details['email_placeholder'] }}" name="username_or_email" id="username_or_email">

                <div class="w-full relative">
                    <input type="password" placeholder="{{ $details['password_placeholder'] }}" name="password" id="password">
                    <p class="absolute right-3 cursor-pointer top-1 group" password="#password">
                        {!! $details['show_pass_icon'] !!} {!! $details['hidden_pass_icon'] !!}
                    </p>
                </div>
                <a href="{{ route('frontend.password_forgot') }}" class="!underline !text-rose-500">{{ $details['forgot_password_title'] }}</a>
                <strong href="{{ route('frontend.password_forgot') }}" id="create-account" class="block md:hidden mb-4 cursor-pointer duration-500 hover:tracking-wide hover:!text-primary hover:drop-shadow-primary !text-violet-500 font-semibold">{{ $details['go_to_register_title'] }}</strong>
                <button class="duration-500 hover:drop-shadow-primary hover:tracking-wider font-bold">{{ $details['sign_in_btn_title'] }}</button>
            </form>
        </div>
        <div class="toggle-authContainer hidden md:block">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1 class="font-semibold text-xl">{{ $details['sign_in_title'] }}</h1>
                    <p class="!text-md font-medium">{{ $details['sign_in_summery'] }}</p>
                    <button class="authHidden !bg-secondary font-semibold border-primary hover:border-slate-100 duration-500 hover:!bg-primary hover:!drop-shadow-primary hover:tracking-wide" id="login">{{ $details['sign_in_btn_title'] }}</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1 class="font-semibold text-xl">{{ $details['sign_up_title'] }}</h1>
                    <p class="!text-md font-medium">{{ $details['sign_up_summery'] }}</p>
                    <button class="authHidden !bg-secondary font-semibold border-primary hover:border-slate-100 duration-500 hover:!bg-primary hover:!drop-shadow-primary hover:tracking-wide" id="register">{{ $details['sign_up_btn_title'] }}</button>
                </div>
            </div>
        </div>
    </div>

    <div class="hidden">
        <span class="group-[.active]:!block !hidden"></span>
        <span class="group-[.active]:!hidden !block"></span>
    </div>
</article> 
@endsection

@push('js')
    <script>
        const authContainer = document.getElementById('authContainer');
        const registerBtn = document.getElementById('register');
        const loginBtn = document.getElementById('login');
        const dom = (selector) => document.querySelector(selector);

        registerBtn.addEventListener('click', () => {
            authContainer.classList.add("active");
        });

        loginBtn.addEventListener('click', () => {
            authContainer.classList.remove("active");
        });


        dom('#create-account').addEventListener('click', function (){
            dom('.form-authContainer.sign-in').style.display = 'none';
            dom('.form-authContainer.sign-up').style.opacity = 1;
        })

        dom('#login-account').addEventListener('click', function (){
            dom('.form-authContainer.sign-in').style.display = 'block';
            dom('.form-authContainer.sign-up').style.opacity = 0;
        })

        document.querySelectorAll("[password]").forEach(element => {
            element.addEventListener("click", function(){
                const input = dom(element.getAttribute("password"));

                if(element.classList.contains("active")){
                    element.classList.remove("active")
                    input.type = "password";
                }else{
                    element.classList.add("active");
                    input.type = "text";
                }
            })
        });
    </script>
@endpush    

@push('style')
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

        .authContainer{
            background-color: #fff;
            border-radius: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 480px;
        }

        .authContainer p{
            font-size: 14px;
            line-height: 20px;
            letter-spacing: 0.3px;
            margin: 20px 0;
        }

        .authContainer span{
            font-size: 12px;
        }

        .authContainer a{
            color: #333;
            font-size: 13px;
            text-decoration: none;
            margin: 15px 0 10px;
        }

        .authContainer button{
            background-color: rgb(1 152 219);
            color: #fff;
            font-size: 12px;
            padding: 10px 45px;
            border: 1px solid transparent;
            border-radius: 8px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-top: 10px;
            cursor: pointer;
        }

        .authContainer button.authHidden{
            background-color: transparent;
            /* border-color: #fff; */
        }

        .authContainer form{
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            height: 100%;
        }

        .authContainer input{
            background-color: #eee;
            border: none;
            margin: 8px 0;
            padding: 10px 15px;
            font-size: 13px;
            border-radius: 8px;
            width: 100%;
            outline: none;
        }

        .form-authContainer{
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .sign-in{
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .authContainer.active .sign-in{
            transform: translateX(100%);
        }

        .sign-up{
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .authContainer.active .sign-up{
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: move 0.6s;
        }

        @keyframes move{
            0%, 49.99%{
                opacity: 0;
                z-index: 1;
            }
            50%, 100%{
                opacity: 1;
                z-index: 5;
            }
        }

        .social-icons{
            margin: 20px 0;
            display: flex;
            gap: 12px;
        }

        .social-icons a i {
            font-size: 28px;
            color: rgb(1 152 219);
        }
        .social-icons a{
            border: 1px solid #ccc;
            border-radius: 20%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 3px;
            width: 70px;
            height: 70px;
        }

        .toggle-authContainer{
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: all 0.6s ease-in-out;
            border-radius: 150px 0 0 100px;
            z-index: 20;
        }

        .authContainer.active .toggle-authContainer{
            transform: translateX(-100%);
            border-radius: 0 150px 100px 0;
        }

        .toggle{
            background-color: rgb(1 152 219);
            height: 100%;
            background: linear-gradient(to right, #5c6bc0, rgb(1 152 219));
            color: #fff;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: all 0.6s ease-in-out;
        }

        .authContainer.active .toggle{
            transform: translateX(50%);
        }

        .toggle-panel{
            position: absolute;
            width: 50%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 30px;
            text-align: center;
            top: 0;
            transform: translateX(0);
            transition: all 0.6s ease-in-out;
        }

        .toggle-left{
            transform: translateX(-200%);
        }

        .authContainer.active .toggle-left{
            transform: translateX(0);
        }

        .toggle-right{
            right: 0;
            transform: translateX(0);
        }

        .authContainer.active .toggle-right{
            transform: translateX(200%);
        }
    </style>
@endpush