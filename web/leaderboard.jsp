<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<% 
    UsuarioDAO pegarUsuario = new UsuarioDAO();
    boolean logado = (request.getSession().getAttribute("autenticado") != null ) ? true : false; 
    
    UsuarioDAO pegarUsuarios = new UsuarioDAO();  
    ArrayList<Usuario> listaUsuarios = pegarUsuarios.getUsersPointsLeaderboard();
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="X-UA-Compatible" content="IE=7">
    <meta name="description" content="Melhor E-commerce que você já viu!">
    <meta name="keywords" content="loja,comércio,ambiente,pontos,gratis,resgatar,ranking,shop,e-commerce,ecommerce,tecnologia,roupas">
    <link rel="stylesheet" href="./css/leaderboard/body.css">
    <link rel="stylesheet" href="./css/leaderboard/main.css">
    <link rel="stylesheet" href="./css/leaderboard/header.css">
    <link rel="stylesheet" href="./css/leaderboard/footer.css">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link rel="shortcut icon" href="./favicon_io_pagina_leaderboard/android-chrome-192x192.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_leaderboard/android-chrome-512x512.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_leaderboard/apple-touch-icon.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_leaderboard/apple-touch-icon.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_leaderboard/favicon-16x16.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_leaderboard/favicon-32x32.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_leaderboard/favicon.ico" type="image/x-icon">
    <link rel="manifest" href="./favicon_io_pagina_leaderboard/site.webmanifest">
    <script src="./javascript/menuburguer.js"></script>
    <title>Leaf - Ganhe junto com o meio ambiente</title>
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
        <div class="profile-leaderboard-ranking" style="margin-bottom: 10px;">
            <p class="profile-ranking-info">Leaderboard</p>
        </div>
        <% 
            if (logado) { 
            int userId = (int) session.getAttribute("userId");
            Usuario usuarioLogado = pegarUsuario.getOneUser(userId);
            int pontos = (int) usuarioLogado.getPontos();
        %>
        <div class="div-profile-points">
            <p>Seus pontos: <%= pontos %></p>
        </div>
        <% } %>
        <% 
            int index = 1;
            for (Usuario usuario : listaUsuarios) 
        {%>
        <div class="leaderboard">
            <div class="div-user">
                <h2 class="heading-user-ranking">
                    <%= index++ %> 
                </h2>
                <h2 class="heading-username">
                    <%= usuario.getNome() %>
                </h2>
                <h2 class="heading-user-points">
                    <%= usuario.getPontos() %>
                </h2>
            </div>
        </div>
        <% } %>
           
    </main>
    <footer style="position: fixed; bottom: 0; width: 100%; z-index: -9999;">
        <p class="p-footer-1 p-footer">Leaf Company</p>
        <p class="p-footer-2 p-footer">Salvando o mundo com você!</p>
    </footer>
</body>
</html>