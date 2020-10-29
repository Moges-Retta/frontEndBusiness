"use strict";
document.getElementById("technicalError").style.display = "none";
const registerUrl = "http://localhost:8080/register";
const registerForm = document.getElementById("register");
registerForm.addEventListener("submit", handleFormSubmit);

document.getElementById("register").onsubmit = function() {
    document.getElementById("registerButton").disabled = true;
}
async function handleFormSubmit(event) {
    event.preventDefault();
    const form = event.currentTarget;
    const url = registerUrl;
    try {
        const formData = new FormData(form);
        const responseData = await postFormDataAsJson(url, formData);
    } catch {
        technicalError();
    }
}
async function postFormDataAsJson( url, formData ) {

    const plainFormData = Object.fromEntries(formData.entries());
    const formDataJsonString = JSON.stringify(plainFormData);
    const fetchOptions = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: formDataJsonString
    };
        const response = await fetch(url, fetchOptions);
    show(response)
        if (!response.ok) {
            const errorMessage = await response.text();
            throw new Error(errorMessage);
        }
        return response.json();
}
function technicalError() {
    document.getElementById("technicalError").hidden = false;
}
function show(response){
    var code = response.headers.get("Location");
    var location = code.toString().lastIndexOf("/");
    var id = code.substring(location);
    var span = document.getElementById("sucess");
    if(id){
        span.innerHTML = "<h4 class='sucess'>Registration sucessful</h4>";
    }else{
        span.innerHTML = "<h4 class='error'>Registration Not sucessful</h4>";
    }
}