<%@page import="model.Usuario"%>
<%
    Usuario u = (Usuario) request.getAttribute("user");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Projeto Final WEB III</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="icon" href="img/user.png"/>
    </head>
    <body style="background-color: #F0FFED">



        <main>
            <div class="text-center container border border-black rounded-3 col-sm-10 col-md-6 mt-5" style="background-color: #FFFF; padding: 0">
                <div class="d-flex p-2 justify-content-center mb-2 w-100" style="margin: auto; background-color: #009628">
                    <h1 class="text-light"> Editar Usuário </h1>
                </div>
                <img src="img/user.png" alt="User" width="80"/>

                <form class="d-flex flex-column justify-content-center validar" action="usuario-controller" method="post" novalidate style="padding: 10px" onsubmit="return confirm('Deseja atualizar os dados?')">

                    <input type="hidden" name="pagina" value="atualizar">
                    <input type="hidden" name="id" value="<%= u.getId()%>">

                    <div class="form-floating mt-3">
                        <input type="text" id="name" name="name" value="<%= u.getNome() %>" class="form-control border border-black" placeholder="Nome Completo" required minlength="6">
                        <label for="name"> Nome Completo </label>

                        <small class="invalid-feedback text-start">
                            O nome precisa conter no mínimo 6 caracteres.
                        </small>
                    </div>

                    <div class="form-floating mt-3">
                        <input type="email" id="email" name="email" value="<%= u.getEmail() %>" class="form-control border border-black" placeholder="exemplo@email.com" required>
                        <label for="email"> Email </label>

                        <small class="invalid-feedback text-start">
                            O email precisa ter @ e um domínio (exemplo@email.com).
                        </small>
                    </div>

                    <div class="form-check form-switch mt-3 text-start">
                        <input type="checkbox" id="news" name="news" value="yes" class="form-check-input border border-black" <%= u.isNovidades() ? "checked" : "" %>  >
                        <label for="news"> Eu aceito receber as novidades da loja. </label>
                    </div>

                    <div class="d-grid mt-4">
                        <input type="submit" value="Atualizar" class="btn btn-primary border border-black">
                        <input type="reset" value="Restaurar Dados" class="btn btn-light border border-black mt-4 mb-2">
                    </div>
                </form>
            </div>
        </main>

        <script src="js/bootstrap.min.js"></script>

        <script>
                            const pass = document.getElementById("pass");
                            const checkPass = document.getElementById("checkPass");
                            const minimum = document.getElementById("minimum");
                            const uppercase = document.getElementById("uppercase");
                            const special = document.getElementById("special");
                            const number = document.getElementById("number");

                            function validatePassword() {
                                checkPass.minLength = pass.value.length;

                                (pass.value.length >= 6) ? minimum.style.color = "green" : minimum.style.color = "red";
                                (/[A-Z]/.test(pass.value)) ? uppercase.style.color = "green" : uppercase.style.color = "red";
                                (/[^\w\s]/.test(pass.value)) ? special.style.color = "green" : special.style.color = "red";
                                (/[\d]/.test(pass.value)) ? number.style.color = "green" : number.style.color = "red";

                                if (checkPass.value === pass.value) {
                                    checkPass.classList.add("is-valid");
                                }
                            }
        </script>

        <script src="./js/init-validation.js"></script>

    </body>
</html>
