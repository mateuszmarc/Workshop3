document.addEventListener("DOMContentLoaded", function () {
    let usernameRequirement = "Musi składać się z co najmniej 8 symboli";
    let passwordRequirement = "Musi składać się z co najmniej 8 symboli, posiadać co najmniej jedną dużą literę, co najmniej jedną małą literę, co najmniej jedną cyfrę oraz co najmniej jednen specjalny symbol";
    const form = document.querySelector(".card-body form");

    function createInputRequirements() {
        const usernameRequirementDiv = document.createElement("div");
        const innerParagraph = document.createElement("p");

        innerParagraph.innerText = usernameRequirement;
        usernameRequirementDiv.appendChild(innerParagraph);
        form.firstElementChild.appendChild(usernameRequirementDiv);

        const passwordRequirementDiv = document.createElement("div");
        const passwordInnerParagraph = document.createElement("p");
        passwordInnerParagraph.innerText = passwordRequirement;
        passwordRequirementDiv.appendChild(passwordInnerParagraph);
        form.lastElementChild.previousElementSibling.appendChild(passwordRequirementDiv);
    }

    createInputRequirements();
})