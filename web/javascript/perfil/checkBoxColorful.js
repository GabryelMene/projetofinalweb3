document.getElementById("private-profile").addEventListener("change", function() {
    const divCheckbox = document.querySelector(".div-private-profile");

    if (this.checked) {
        divCheckbox.style.backgroundColor = "green";
    } else {
        divCheckbox.style.backgroundColor = "black"; 
    }

});

document.getElementById("news-profile").addEventListener("change", function() {
    const divCheckbox = document.querySelector(".div-news-profile");

    if (this.checked) {
        divCheckbox.style.backgroundColor = "green";
    } else {
        divCheckbox.style.backgroundColor = "tomato"; 
    }

});

