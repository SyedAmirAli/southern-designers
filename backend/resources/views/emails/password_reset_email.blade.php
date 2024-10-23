<!DOCTYPE html>
<html lang="en">
<head>
  <title>Password Reset Code From - Pathgriho Foundation</title> 
</head>
<body style="overflow: hidden; margin: 0; padding: 0; font-family: 'Poppins', sans-serif; box-sizing: border-box;">
  <main style="display: flex; min-height: 70vh; width: 100%; align-items: center; justify-content: center; background-color: rgba(255, 255, 255, 0.1); background-image: linear-gradient(to top right, var(--tw-gradient-stops)); padding: 1.5rem;">
    <article style="max-width: 36rem; border-radius: 1.5rem; border-width: 1px; border-style: solid; border-color: rgba(203, 213, 225, 0.1); background-color: rgba(203, 213, 225, 0.1); padding: 2.5rem; box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);">
      <h1 style="text-align: center; font-size: 1.875rem; line-height: 2.25rem; font-weight: 600; color: rgb(1, 152, 219); margin: 0;">Password Reset Code</h1>
      <p style="border-width: 0px; border-top-width: 1px; border-style: solid; border-color: rgba(97, 97, 97, 0.3); margin: 0; margin-top: 16px;"></p>
        <div style="margin-top: 16px;">
          <div>
            <h3 style="margin:0; text-align: center; font-weight: 700; text-transform: capitalize; color: rgb(34, 197, 94);">Your Password Reset Code is here</h3>
            <p style="margin:0; text-align: center; font-size: 0.875rem; line-height: 1rem; color: rgb(13, 56, 150); padding-bottom: 12px;">
              Thank you for joining our team <span style="font-weight: 700; color: rgb(1, 152, 219);">Pathgriho Foundation</span> & stay.
            </p>
          </div>
          <div style="width: 100%; text-align: center; font-size: 2rem; color: rgb(1, 152, 219); line-height: 2rem; font-weight: 900;">
            
            @foreach ($codes as $code)
            <span style="padding: 0px 6px;">{{ $code }}</span>
              {{-- <p style="padding: 8px; text-align: center; font-size: 1.5rem; line-height: 2rem; font-weight: 700; color: rgb(1, 152, 219); margin: 0;">{{ $code }}</p>--}}
            @endforeach 
          </div>
        </div>
    </article>
  </main>
</body>
</html>
