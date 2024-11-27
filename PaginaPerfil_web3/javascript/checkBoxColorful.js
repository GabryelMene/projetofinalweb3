document.getElementById("private-profile").addEventListener("change", function() {
    const divCheckbox = document.querySelector(".div-private-profile");

    if (this.checked) {
        divCheckbox.style.backgroundColor = "green";
    } else {
        divCheckbox.style.backgroundColor = "tomato"; 
    }

});