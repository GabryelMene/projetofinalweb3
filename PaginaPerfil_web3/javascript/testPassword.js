function testPasswordStrong() {
    const div_passwordMessage = document.querySelector(".div-password-list-necessary");
    div_passwordMessage.style.display = "block";
    const input_submit = document.querySelector(".input-submit");

    const digits = document.querySelector(".item-digits");
    const upperCase = document.querySelector(".item-upperCase");
    const number = document.querySelector(".item-number");
    const character = document.querySelector(".item-character");

    const password = document.querySelector(".input-password");

    (password.value.length >= 6) ? digits.style.backgroundColor = "green" : digits.style.backgroundColor = "red";;
    (/[A-Z]/.test(password.value)) ? upperCase.style.backgroundColor = "green" : upperCase.style.backgroundColor = "red";
    (/[^\w\s]/.test(password.value)) ? character.style.backgroundColor = "green" : character.style.backgroundColor = "red";
    (/[\d]/.test(password.value)) ? number.style.backgroundColor = "green" : number.style.backgroundColor = "red"; 
}