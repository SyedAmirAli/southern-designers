// var duration = 60; // 1 hrs
const codes = document.querySelectorAll("[input-code-and-focus-id]");
let interval;
let requestStatus = true;

codes.forEach(function (code, index) {
  code.oninput = function (event) {
    const codeId = event.target.getAttribute("input-code-and-focus-id");
    const focusCode = document.querySelector(`#code${Number(codeId) + 1}`);

    if (focusCode) {
      focusCode.focus();
    }
  };

  code.onkeydown = function (event) {
    console.log(event.key);

    const codeId = event.target.getAttribute("input-code-and-focus-id");
    const focusCode = document.querySelector(`#code${Number(codeId) - 1}`);

    if (focusCode) {
      if (event.key === "Backspace" && event.target.value === "") {
        focusCode.focus();
        event.preventDefault();
      }
    }
  };
});

function codeValidationTimer(validity) {
  clearInterval(interval);

  const startTime = new Date(validity?.start).getTime();
  const endTime = new Date(validity?.end).getTime(); // + 1000 * 60 * duration
  const availableTIme = endTime - startTime;
  let minutes = Math.floor(availableTIme / (1000 * 60));
  let seconds = Math.floor((availableTIme / 1000) % 60);

  seconds = seconds < 10 ? `0${seconds}` : seconds;

  function intervalTime() {
    let log = `${minutes}:${seconds}`;

    seconds--;

    if (seconds < 0) {
      seconds = 59;
      minutes--;
    }

    if (minutes < 0) {
      clearInterval(interval);
      log = "00:00";
    }

    if (log === "00:00") {
      dom("#submit-btn-box").classList.add("active");
      dom("#interval-alert-actions").classList.add("active");
    }

    dom("#checkout-available-time").textContent = log;
  }

  interval = setInterval(intervalTime, 1000);
}

async function fetchFindUser(event) {
  dom("#submit-btn-box").classList.add("loader");
  event.preventDefault();

  try {
    const response = await fetch(findUserUrl, {
      method: "POST",
      body: new FormData(dom("#find-user")),
    });

    const data = await response.json();
    console.log(data);

    if (data?.status === 200) {
      dom("#code-container").classList.remove("hidden");
      dom("#find-user button").textContent = "Reset Password";
      requestStatus = false;
      requestHandler();

      dom('[name="id"]').value = data?.validity?.id;
    } else {
      dom("#code-container").classList.add("hidden");
    }

    dom("#message").classList.value = "group " + data?.type;
    dom("#message h3").innerHTML = data?.notification;
    dom("#message p").innerHTML = data?.message;

    codeValidationTimer(data?.validity);
  } catch (error) {
    console.log("INVALID ERRORS =>", error);
    dom("#message").classList.value = "group error";
    dom("#message h3").innerHTML = error?.message;
    dom("#message p").innerHTML = "";
  }

  dom("#interval-alert-actions").classList.remove("active");
  dom("#submit-btn-box").classList.remove("loader");
}

function dom(indemnificator) {
  return document.querySelector(indemnificator);
}

function requestHandler() {
  dom("#find-user").onsubmit = async function (event) {
    event.preventDefault();

    dom('[name="email"]').value = dom('[name="user_identity"]').value;

    if (
      codes[0].value !== "" &&
      codes[1].value !== "" &&
      codes[2].value !== "" &&
      codes[3].value !== "" &&
      codes[4].value !== "" &&
      codes[5].value !== ""
    ) {
      const formData = new FormData(dom("#find-user"));
      const setPasswordFormData = new FormData(dom("#set-password"));

      for (var [key, value] of setPasswordFormData.entries()) {
        formData.append(key, value);
      }

      try {
        const response = await fetch(forgotPasswordUrl, {
          method: "POST",
          body: formData,
        });

        const data = await response.json();

        console.log(data);

        if (data?.status === 200) {
          dom("#main").classList.remove("find-user");
        }

        dom("#message").classList.value = "group " + data?.type;
        dom("#message h3").innerHTML = data?.notification;
        dom("#message p").innerHTML = data?.message;
      } catch (error) {
        console.log("INVALID ERRORS =>", error);
        dom("#message").classList.value = "group error";
        dom("#message h3").innerHTML = error?.message;
        dom("#message p").innerHTML = "";
      }
      return;
    }

    if (requestStatus) {
      return await fetchFindUser(event);
    } else {
      dom("#message").classList.value = "group error";
      dom("#message h3").innerHTML = "Code already sended!";
    }
  };
}

requestHandler();

// resend code button clicked
dom("#resend-code").onclick = async function (event) {
  requestStatus = true;
  requestHandler();
  dom("#interval-alert-actions").classList.remove("active");
  dom("#submit-btn-box").classList.remove("active");
  await fetchFindUser(event);
};

dom("#set-password").onsubmit = async function (event) {
  dom("#submit-btn-box").classList.remove("loader");
  event.preventDefault();

  const formData = new FormData(dom("#find-user"));
  const setPasswordFormData = new FormData(event.target);

  for (var [key, value] of setPasswordFormData.entries()) {
    formData.append(key, value);
  }

  try {
    const response = await fetch(setNewPasswordUrl, {
      method: "POST",
      body: formData,
    });

    const data = await response.json();

    console.log(data);

    if (data?.status === 200) {
      dom("#main").classList.remove("find-user");
      dom("#main").classList.add("success");
    }

    dom("#set-password-message").classList.value = "group " + data?.type;
    dom("#set-password-message h3").innerHTML = data?.notification;
    dom("#set-password-message p").innerHTML = data?.message;
  } catch (error) {
    console.log("INVALID ERRORS =>", error);
    dom("#set-password-message").classList.value = "group error";
    dom("#set-password-message h3").innerHTML = error?.message;
    dom("#set-password-message p").innerHTML = "";
  }

  dom("#submit-btn-box").classList.remove("loader");
};

// function se
// dom("#find-user").onsubmit = async function(event){
//   return await fetchFindUser(event);
// }

// const messageContains = dom("#message")
// dom("#message").classList.remove("hidden")

// dom("#message").classList.remove('success')
// dom("#message").classList.remove('error')
// dom("#message").classList.remove("hidden");
// dom("#message").classList.remove('success');
// dom("#message").classList.add('error');

// if(interval){ clearInterval(interval); }
