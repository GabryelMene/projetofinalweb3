function MenuOpenAndClose_m() {
    const menu = document.getElementById("div-options-menu_m");
    if (menu.style.display == "block") {
        menu.style.display = "none"; 
    } else {
        menu.style.display = "block"
    }
}

function MenuOpenAndClose_pc() {
    const menu = document.getElementById("div-options-menu_pc");
    if (menu.style.display == "block") {
        menu.style.display = "none"; 
    } else {
        menu.style.display = "block"
    }
}

addEventListener("resize", () => {
    const widthOutput = window.innerWidth;
    const menu_mobile = document.getElementById("div-options-menu_m");
    const menu_pc = document.getElementById("div-options-menu_pc");

    if (widthOutput > 1600) {
        menu_mobile.style.display = "none";
    }

    if (widthOutput < 1600) {
        menu_pc.style.display = "none"; 
    }
});


 

