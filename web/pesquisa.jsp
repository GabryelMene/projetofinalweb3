<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<% 
    UsuarioDAO pegarUsuario = new UsuarioDAO();
    boolean logado = (request.getSession().getAttribute("autenticado") != null ) ? true : false;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="X-UA-Compatible" content="IE=7">
        <link rel="stylesheet" href="./css/paginaInicial/body.css">
        <link rel="stylesheet" href="./css/paginaInicial/header.css">
        <link rel="stylesheet" href="./css/pesquisa/pesquisa.css">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
        <link rel="shortcut icon" href="./favicon_io_pagina_inicial/android-chrome-192x192.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_inicial/android-chrome-512x512.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_inicial/apple-touch-icon.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_inicial/apple-touch-icon.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_inicial/favicon-16x16.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_inicial/favicon-32x32.png" type="image/x-icon">
        <link rel="shortcut icon" href="./favicon_io_pagina_inicial/favicon.ico" type="image/x-icon">
        <link rel="manifest" href="./favicon_io_pagina_inicial/site.webmanifest">
        <script src="./javascript/menuburguer.js"></script>
        <title>JSP Page</title>
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
            <%
                ProdutoDAO conexaoProduto = new ProdutoDAO();
                String idNome = request.getParameter("pesquisa");
                String nomeProduto; 
                String imagemProduto;
                String marcaProduto; 
                String modeloProduto; 
                String descricaoProduto; 
                double precoProduto; 

                if (conexaoProduto.produtoNomeDB(idNome).getNome() != null) {
                    Produto pegarProduto = conexaoProduto.produtoNomeDB(idNome);
                    nomeProduto = pegarProduto.getNome(); 
                    imagemProduto = pegarProduto.getImagem();
                    marcaProduto = pegarProduto.getMarca();
                    modeloProduto = pegarProduto.getModelo(); 
                    descricaoProduto = pegarProduto.getDescricao(); 
                    imagemProduto = pegarProduto.getImagem();
                    precoProduto = pegarProduto.getPreco(); 
             %>  
            <div class="div-product">
                <div class="div-product-title-image">
                    <h2 class="h2-product"><%= nomeProduto %></h2>
                    <img class="img-product" src="<%= imagemProduto %>" alt="Imagem do produto <%= nomeProduto %>" style="width: 40% !important;">
                </div>
                <p class="p-product p-description-product">Descrição: <%= descricaoProduto %></p>
                <p class="p-product p-brand-product">Marca: <%= marcaProduto %></p>
                <p class="p-product p-price-product">Preço: R$ <%= precoProduto %></p>
                <%
                    if (logado) {
                        ProdutoDAO pegarInfoProduto = new ProdutoDAO();
                        int userId = (int) session.getAttribute("userId");
                        Usuario usuarioLogado = pegarUsuario.getOneUser(userId);
                        String idProduto = request.getParameter("pesquisa");
                        Produto produto = pegarInfoProduto.produtoNomeDB(idProduto);
                %>
                <form action="venda-controller">
                    <input type="hidden" name="pagina" value="comprar">
                    <input type="hidden" name="idUsuario" value="<%= usuarioLogado.getId() %>">
                    <input type="hidden" name="nomeUsuario" value="<%= usuarioLogado.getNome() %>">
                    <input type="hidden" name="idProduto" value="<%= produto.getId() %>">
                    <input type="hidden" name="nomeProduto" value="<%= produto.getNome() %>">
                    
                    <input type="submit" class="button-buy-product" style="border: none; cursor: pointer" value="COMPRAR 🛒"/>
                </form>
                <% } %>
                <% 
                    if (!logado) {
                %>
                <a class="button-buy-product" href="./login.html" style="border: none; cursor: pointer">FAÇA LOGIN PARA COMPRAR</a>
                <% } %>
            </div>
            <% } else { %>
            <div class="div-product div-not-found">  
                <h2 class="h2-product h2-error-404">404</h2>
                <h2 class="h2-product">Oops!</h2>
                <h2 class="h2-product">O produto pesquisado não foi encontrado!</h2> 
            </div>
            <% } %>
        </main>
    </body>
</html>
