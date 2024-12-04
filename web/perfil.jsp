<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%
    UsuarioDAO pegarUsuario = new UsuarioDAO();
    boolean logado = (request.getSession().getAttribute("autenticado") != null) ? true : false;
    
    if (!logado) {
        response.sendRedirect("./index.jsp");
    } 
%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="X-UA-Compatible" content="IE=7">
        <link rel="stylesheet" href="./css/perfil/body.css">
        <link rel="stylesheet" href="./css/perfil/main.css">
        <link rel="stylesheet" href="./css/perfil/header.css">
        <link rel="stylesheet" href="./css/perfil/footer.css">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
        <link rel="shortcut icon" href="./favicon_io_pagina_perfil/android-chrome-192x192.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_perfil/android-chrome-512x512.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_perfil/apple-touch-icon.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_perfil/apple-touch-icon.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_perfil/favicon-16x16.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_perfil/favicon-32x32.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_perfil/favicon.ico" type="image/x-icon">
        <link rel="manifest" href="./favicon_io_pagina_perfil/site.webmanifest">
        <script src="./javascript/menuburguer.js"></script>
        <script src="./javascript/perfil/init-validation.js"></script>
        <script src="./javascript/perfil/testPassword.js"></script>
        <title>Personalizar perfil</title>
    </head>
    <body>
        <header class="header">
        <nav class="div-options-menu_m" id="div-options-menu_m" style="right: -9000px;">
            <span class="material-symbols-outlined span-close" onclick="MenuOpenAndClose_m()">close</span>
            <div class="div-options-select">
                <ul class="list-options">
                    <% if (logado) { %>
                    <li class="mobile-wallet-cart">
                        <% 
                                if (logado) {
                                int userId = (int) session.getAttribute("userId");
                                Usuario usuarioLogado = pegarUsuario.getOneUser(userId);
                                int pontos = (int) usuarioLogado.getPontos();
                        %>
                        <div class="div-wallet-option-m">
                            <div class="wallet-m">
                                <span class="material-symbols-outlined">account_balance_wallet</span>
                            </div>
                            <div class="wallet-numbers-m">
                                <span class="wallet-number-m"><%= pontos %></span>
                            </div>
                        </div>
                        <% } %>
                        <div class="div-cart-option-m">
                            <div class="cart-m">
                                <span class="material-symbols-outlined">shopping_cart</span>
                            </div>
                            <div class="cart-numbers-m">
                                <span class="cart-number">0</span>
                            </div>
                        </div>
                    </li>
                    <% } %>
                    <li class="option">
                        <span class="material-symbols-outlined span-option">home</span>
                        <a href="./index.jsp">Início</a>
                    </li>
                    <% if (!logado) { %>
                    <li class="option option-profile">
                        <span class="material-symbols-outlined span-option">person</span>
                        <a href="./login.html">Iniciar sessão</a>
                    </li>
                    <% } %>
                    <li class="option">
                        <span class="material-symbols-outlined span-option">leaderboard</span>
                        <a href="./leaderboard.jsp">Leaderboard</a>
                    </li>
                    <% if (logado) { %>
                    <li class="option option-profile-logged">
                        <span class="material-symbols-outlined span-option">person</span>
                        <a href="./perfil.jsp">Meu perfil</a>
                    </li>
                     <li class="option">
                        <span class="material-symbols-outlined">category_search</span>
                        <a href="./vincular">Vincular produto</a>
                    </li>
                     <li class="option">
                        <span class="material-symbols-outlined">door_open</span>
                        <a href="./deslogar.jsp">Sair</a>
                    </li>
                    <% } %>
                </ul>
            </div>
        </nav>
        <div class="div-logo">
            <a class="leaf-logo" href="/Projeto_finalWebIII/index.jsp">Leaf</a>
        </div>
        <div class="div-search">
            <form action="produto-controller" method="get">
                <input type="hidden" value="pesquisaItem" name="pesquisa_item"/>
                <select name="select-items" id="select_items">
                    <option value="todos" selected>Todos</option>
                    <option value="eletronicos">Eletrônicos</option>
                    <option value="fashion">Fashion</option>
                </select>
                <input type="search" placeholder="Pesquisar no Leaf" name="pesquisa"/>
                <button type="submit">
                    <span class="material-symbols-outlined">search</span>
                </button>
            </form>
        </div>
        <% if (logado) { %>
        <div class="div-wallet-option">
            <% 
                if (logado) {
                      int userId = (int) session.getAttribute("userId");
                      Usuario usuarioLogado = pegarUsuario.getOneUser(userId);
                      int pontos = (int) usuarioLogado.getPontos();
            %>
            <div class="wallet">
                <span class="material-symbols-outlined">account_balance_wallet</span>
            </div>
            <div class="wallet-numbers">
                <span class="wallet-number"><%= pontos %></span>
            </div>
            <% } %>
        </div>
        <div class="div-cart-option">
            <div class="cart">
                <span class="material-symbols-outlined">shopping_cart</span>
            </div>
            <div class="cart-numbers">
                <span class="cart-number">0</span>
            </div>
        </div>
        <% } %>
        <nav class="div-options">
            <span class="material-symbols-outlined span-menu" onclick="MenuOpenAndClose_m()">menu</span>
            <span class="material-symbols-outlined span-settings" onclick="MenuOpenAndClose_pc()">settings</span>
            <div class="div-options-menu_pc" id="div-options-menu_pc">
                <ul class="list-options">
                    <li class="option">
                        <span class="material-symbols-outlined">home</span>
                        <a href="./index.jsp">início</a>
                    </li>
                    <% if (!logado) { %>
                    <li class="option option-profile">
                        <span class="material-symbols-outlined span-option">person</span>
                        <a href="./login.html">Log-in</a>
                    </li>
                    <% } %>
                    <li class="option">
                        <span class="material-symbols-outlined">leaderboard</span>
                        <a href="./leaderboard.jsp">Leaderboard</a>
                    </li>
                    <% if (logado) { %>
                    <li class="option option-profile-logged">
                        <span class="material-symbols-outlined span-option">person</span>
                        <a href="./perfil.jsp">Meu perfil </a>
                    </li>
                    <li class="option">
                        <span class="material-symbols-outlined">category_search</span>
                        <a href="./vincular">Vincular produto</a>
                    </li>
                    <li class="option">
                        <span class="material-symbols-outlined">door_open</span>
                        <a href="./deslogar.jsp">Sair</a>
                    </li>
                    <% } %>
                </ul>
            </div>
        </nav>
    </header>
        <main>
            <div class="div-profile">
                <div class="div-profile-pfp">
                    <img src="./images/Default_pfp.svg.png" alt="User's profile picture" class="user-profile-pfp">
                </div>
                <div class="div-form-profile">
                    <% if (logado) {
                            int usuarioId = (int) session.getAttribute("userId");
                            Usuario usuarioLogado = pegarUsuario.getOneUser(usuarioId);
                            boolean perfilPrivadoChecked = usuarioLogado.isPerfilPrivado();
                            boolean novidadesChecked = usuarioLogado.isPerfilPrivado();
                            String emailRecuperacao = usuarioLogado.getEmailRecuperacao() != null ? usuarioLogado.getEmailRecuperacao() : "";
                            String descricao = usuarioLogado.getDescricao() != null ? usuarioLogado.getDescricao() : "";
                    %>  
                    <form action="usuario-controller" method="post" class="form validar" novalidate>
                        <input type="hidden" name="pagina" value="atualizarPerfil">
                        <input type="hidden" name="id" value="<%= usuarioLogado.getId()%>">
                        <label for="input-profile-pfp" class="style-profile-pfp">Nova foto</label>
                        <input type="file" name="profile-picture-user" id="input-profile-pfp">

                        <label for="input-name" class="label-input">Nome</label>
                        <input type="text" name="name" class="input-name input-profile" placeholder="Seu novo nome" value="<%= usuarioLogado.getNome()%>" required>

                        <label for="input-email" class="label-input">Email</label>
                        <input type="email" name="email" class="input-email input-profile" placeholder="Seu melhor email" value="<%= usuarioLogado.getEmail()%>" required>

                        <label for="input-email-save" class="label-input">Email de recuperação</label>
                        <input type="email" name="emailSave" class="input-email-save input-profile" placeholder="Seu novo email de recuperação" value="<%= emailRecuperacao%>" required>

                        <label for="input-password" class="label-input">Senha</label>
                        <input type="password" name="password" class="input-password input-profile"  minlength="6" placeholder="Sua nova senha"  pattern="^(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{6,}$" onkeyup="testPasswordStrong()" required>
                        <div class="div-password-list-necessary">
                            <ul class="list-password-necessary">
                                <li class="item item-digits">6 dígitos</li>
                                <li class="item item-upperCase">Uma letra maiúscula</li>
                                <li class="item item-number">Um número</li>
                                <li class="item item-character">Um caractere especial</li>
                            </ul>
                        </div>   

                        <label for="input-description" class="label-input">Descrição</label>
                        <textarea name="description" id="input-description" placeholder="Sua descrição"><%= descricao%></textarea>

                        <div class="div-private-profile" style="background-color: black;">
                            <label for="private-profile" title="Com perfil privado, os usuários não conseguirão ver seus produtos, pontos, ranking e classificação.">Perfil privado</label>
                            <input type="checkbox" name="privateProfile" id="private-profile" value="true" <% if (perfilPrivadoChecked) {out.print("checked");}; %>> 
                        </div>

                        <div class="div-news-profile" id="div-news-profile" style="margin-top: 10px; font-size: 15pt; display: flex; justify-content: left; gap: 5px; padding: 5px; height: 35px; color: white; border-radius: 5px;  background-color: black; transition: background-color 600ms linear;">
                            <label for="news-profile" title="Você pode receber e não receber as nossas novidades quando quiser!">Novidades da loja</label>
                            <input type="checkbox" name="newsProfile" id="news-profile" value="true" style="cursor: pointer;" <% if (novidadesChecked) {out.print("checked"); }%>/>
                        </div>

                        <div class="div-submit-buttons">
                            <input type="reset" value="Limpar" class="input-reset">
                            <input type="submit" value="Salvar" class="input-submit">
                        </div>
                    </form>
                    <div class="div-alert">
                        <h2 class="h2-alert">⚠️ CUIDADO ⚠️ </h2>
                        <p>
                            RISCO DE EXCLUSÃO DE CONTA.
                            O BOTÃO DELETARÁ SUA CONTA PARA SEMPRE. 
                            PENSE BEM NA SUA DECISÃO.  
                        </p>
                    </div> 
                    <div class="div-delete-account" style="text-align: center;">
                        <a onclick="excluir(<%= usuarioLogado.getId()%>, '<%=  usuarioLogado.getNome()%>')" title="excluir">Quero deletar minha conta</a>
                    </div>
                    <% }%>
                </div>
            </div>
        </main>
        <footer>
            <p class="p-footer-1 p-footer">Leaf Company</p>
            <p class="p-footer-2 p-footer">Salvando o mundo com você!</p>
        </footer>
        <script src="./javascript/perfil/checkBoxColorful.js"></script>
        <script>
            function excluir(id, nome) {
                     if (confirm("Deseja realmente excluir o usuário " + nome + "?")) {
                            window.location.href = "usuario-controller?pagina=excluir&id=" + id;
                     } else {
                            alert("A exclusão foi cancelada!");
                     }
            }
        </script>   
    </body>
</html>