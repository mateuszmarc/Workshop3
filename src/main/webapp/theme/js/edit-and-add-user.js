document.addEventListener("DOMContentLoaded", function () {
    let usernameRequirement = "Musi składać się z co najmniej 8 symboli";
    let passwordRequirement = "Musi składać się z co najmniej 8 symboli, posiadać co najmniej jedną dużą literę, co najmniej jedną małą literę, co najmniej jedną cyfrę oraz co najmniej jednen specjalny symbol";
    const EMAIL_VALIDATION_REGEX = new RegExp("[_a-zA-z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*\\.([a-zA-Z]{2,}){1}");
    const PASSWORD_VALIDATION_REGEX = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$");
    const USERNAME_VALIDATION_REGEX = new RegExp("^[a-zA-Z0-9](_(?!(\\.|_))|\\.(?!(_|\\.))|[a-zA-Z0-9]){6,18}[a-zA-Z0-9]$");
    const divContainer = document.querySelector(".card-body");
    const form = divContainer.querySelector("form");
    const usernameInput = form.querySelector("#username");
    const emailInput = form.querySelector("#email");
    const passwordInput = form.querySelector("#password");

    // Error information div
    const errorInfoDiv = document.createElement("div");
    errorInfoDiv.className = "alert alert-warning";
    errorInfoDiv.setAttribute("role", "alert");
    const pTag = document.createElement("p");
    errorInfoDiv.appendChild(pTag);
    const strongElement = document.createElement("strong");
    strongElement.innerText = "Niepowodzenie";
    pTag.appendChild(strongElement);
    pTag.innerText = "Wpisane dane nie spełniają wymagań lub podany email jest już przypisany do innego użytkownika."
    errorInfoDiv.classList.add("d-none");
    form.prepend(errorInfoDiv);

    function createInputRequirements() {
        const usernameRequirementDiv = document.createElement("div");
        const innerParagraph = document.createElement("p");

        innerParagraph.innerText = usernameRequirement;
        usernameRequirementDiv.appendChild(innerParagraph);
        form.firstElementChild.nextElementSibling.appendChild(usernameRequirementDiv);

        const passwordRequirementDiv = document.createElement("div");
        const passwordInnerParagraph = document.createElement("p");
        passwordInnerParagraph.innerText = passwordRequirement;
        passwordRequirementDiv.appendChild(passwordInnerParagraph);
        form.lastElementChild.previousElementSibling.appendChild(passwordRequirementDiv);
    }


    function validateFormInputs() {
        form.addEventListener("submit", function (event) {
            errorInfoDiv.classList.add("d-none");
            if (!USERNAME_VALIDATION_REGEX.test(usernameInput.value)
                || !EMAIL_VALIDATION_REGEX.test(emailInput.value)
                || !PASSWORD_VALIDATION_REGEX.test(passwordInput.value)) {
                event.preventDefault();
                errorInfoDiv.classList.remove("d-none");
            }

        });
    }

    function validateInput(inputTag, regex) {
        inputTag.addEventListener("keydown", function () {
            if (regex.test(this.value)) {
                console.log("valid")
                this.style.backgroundColor = "#dcf8cc";
            } else {
                console.log("invalid")
                this.style.backgroundColor = "#f8d7df";
            }
        })
    }


    createInputRequirements();
    validateFormInputs();
    validateInput(usernameInput, USERNAME_VALIDATION_REGEX);
    validateInput(emailInput, EMAIL_VALIDATION_REGEX);
    validateInput(passwordInput, PASSWORD_VALIDATION_REGEX);



})