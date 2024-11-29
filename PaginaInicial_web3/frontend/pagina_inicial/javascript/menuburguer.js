function MenuOpenAndClose_m() {
    const menu = document.getElementById("div-options-menu_m");
    const header = document.getElementsByClassName("header"); 

    if (menu.classList.contains("div-options-menu_m_open")) {
        menu.classList.remove("div-options-menu_m_open") 
        menu.classList.add("div-options-menu_m_close"); 
        document.body.style.overflow = ''; 
    } else {
        menu.classList.remove("div-options-menu_m_close") 
        menu.classList.add("div-options-menu_m_open"); 
        document.body.style.overflow = "hidden";
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
        menu_mobile.style.display = "block";
        menu_mobile.style.right = "-1920px";
    }
});


 

