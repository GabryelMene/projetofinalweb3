<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%
    UsuarioDAO pegarUsuario = new UsuarioDAO();
    ProdutoDAO pegarProdutos = new ProdutoDAO();
    boolean logado = (request.getSession().getAttribute("autenticado") != null) ? true : false;
    
    if (!logado) {
        response.sendRedirect("./index.jsp");
    } 
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>WEB III</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/registrarProduto/style.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="./images/user.png">
    </head>
    <body>
        <main>
            <div style="display: flex; flex-wrap: wrap; justify-content: center; align-content: center; height: 100%; margin-top: 250px;">
                <div class="div-father2" style="display: flex; border: 1px solid #009628; border-radius: 7px 0px 0px 7px;  gap: 50px; background-color: white; justify-content: center;">
                    <div class="div-register" style=" padding: 20px; ">

                        <h1> Vincular Produto </h1>

                        <div class="div-register-warning" style="margin-top: 20px; margin-bottom: 20px;">
                            <p style="margin-bottom: 5px;">   O registro de produto serve para </p>
                            <p style="margin-bottom: 5px;"> vincular seu dispositivo de alguma </p>
                            <p style="margin-bottom: 5px;"> marca parceira da <span style="color: #009628;">Leaf Company</span>. </p>
                        </div>

                        <div class="div-register-message" style="margin-bottom: 20px; font-style: italic; color: #515151;">
                            <p style="margin-bottom: 5px;"> Vinculando o seu dispositivo, você </p>
                            <p style="margin-bottom: 5px;"> terá acesso a pontos que você pode </p>
                            <p style="margin-bottom: 5px;"> utilizar para obter desconto em </p>
                            <p style="margin-bottom: 5px;"> produtos ou resgatar produtos digitais! </p>
                        </div>
                    </div>
                </div>
                <% 
                    if (logado) {
                        int userId = (int) session.getAttribute("userId");
                        Usuario usuarioLogado = pegarUsuario.getOneUser(userId);
                        String usuarioLogadoNome = usuarioLogado.getNome();
                %>
                <div class="div-form-register" style="border-left: 1px solid #009628; padding: 20px; display: flex; border: 1px solid #009628; border-left: none; border-radius: 0px 7px 7px 0px; gap: 50px; background-color: white; justify-content: center;">
                        <form class="form-register validar" method="post" action="registrar-controller">

                            <input type="hidden" name="pagina" value="registro">
                            <input type="hidden" name="idUsuario" value="<%= userId %>"/> 
                            <input type="hidden" name="nomeUsuario" value="<%= usuarioLogadoNome %>"/> 

                            <div class="div-code-input" style=" gap: 10px;">    
                                <h3 style="margin-left: 30px;"> <span class="material-symbols-outlined">computer</span> Código do Produto </h3>
                                <input type="text" class="endereco" name="enderecoProduto" id="endereco" style="margin-left: 30px; width: 300px;  padding: 14px; border: 2px solid #009628; border-radius: 7px;" placeholder="XX-XX-XX-XX-XX-AB" required>
                                <p style="margin-left: 30px; margin-top: 20px; margin-bottom: 5px;">   O código do produto pode ser encontrado </p>
                                <p style="margin-left: 30px; margin-bottom: 5px;"> atrás ou embaixo, ele é um código estilo </p>
                                <p style="margin-left: 30px; margin-bottom: 25px;"> endereço MAC. </p>
                            </div>

                            <div class="div-input-register">
                                <input id="proceed" class="register-input" style="width: 280px; margin-left: 40px; background-color: #009628; border: none; border-radius: 7px; padding: 14px; color: white; font-weight: bolder;" type="submit" value="REGISTRAR"> 
                            </div>
                        </form>
                </div>
                <% } %>
            </div>
        </main>

        <script src="./javascript/bootstrap.min.js"></script>
        <script src="./javascript/init-validation.js"></script>
    </body>
</html>