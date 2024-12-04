<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<% 
    ProdutoDAO pegarProdutos = new ProdutoDAO();
    boolean logado = (request.getSession().getAttribute("autenticado") != null ) ? true : false;
    UsuarioDAO pegarUsuario = new UsuarioDAO();
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
    <link rel="stylesheet" href="./css/paginaInicial/body.css">
    <link rel="stylesheet" href="./css/paginaInicial/header.css">
    <link rel="stylesheet" href="./css/paginaInicial/footer.css">
    <link rel="stylesheet" href="./css/paginaInicial/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link rel="shortcut icon" href="./favicon_io_pagina_inicial/android-chrome-192x192.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_inicial/android-chrome-512x512.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_inicial/apple-touch-icon.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_paginal_inicial/apple-touch-icon.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_inicial/favicon-16x16.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_inicial/favicon-32x32.png" type="image/x-icon">
    <link rel="shortcut icon" href="./favicon_io_pagina_inicial/favicon.ico" type="image/x-icon">
    <link rel="manifest" href="../favicon_io/site.webmanifest">
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
                        <a href="./registrar_produto.jsp">Vincular produto</a>
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
                        <a href="./registrar_produto.jsp">Vincular produto</a>
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
    <main style="margin-top: 100px;">
        <div class="div-image">
            <img src="./images/ecologic_edited.jpg" alt="Uma mão segurando um galho pequeno(papel de parede do website)" class="image-ecologic-responsive">
        </div>
        <% if (logado) { %>
        <div class="div-points-reward">
            <div class="div-leaf-rewards-father">
                <div class="div-leaf-rewards">
                    <div class="div-leaf-rewards-title">
                        <h2>Leaf Rewards</h2>
                    </div>
                    <div class="div-leaf-content">
                            <div class="div-rewards-title">
                                <h2 class="l-content-h2">Seus pontos</h2>
                                <span class="material-symbols-outlined rewards-icon">toll</span>
                            </div>
                            <% 
                                if (logado) {
                                int userId = (int) session.getAttribute("userId");
                                Usuario usuarioLogado = pegarUsuario.getOneUser(userId);
                                int pontos = (int) usuarioLogado.getPontos();
                            %>
                            <div class="div-rewards-points">
                                <h2 class="l-points-h2">
                                    <%= pontos %>
                                </h2>
                            </div>
                            <%
                                } 
                            %>
                            <div class="div-rewards-reedem">
                                <a href="/resgatar">
                                    Como Resgatar <span class="material-symbols-outlined">chevron_right</span>
                                </a>
                            </div>
                    </div>
                </div>
            </div>
            <div class="div-pc-challenges">
                <h2 class="title-pc-challenges">Cojunto diário</h2>
                <div class="flex-pc-challenges">
                    <div class="pc-challenge" style="background-color: #008b25; color: white;">Desafio 1 (simulado)</div>
                    <div class="pc-challenge" style="background-color: #008b25; color: white;">Desafio 2 (simulado)</div>
                    <div class="pc-challenge" style="background-color: #008b25; color: white;">Desafio 3 (simulado)</div>
                </div>
            </div>
            <div class="div-leaf-profile">
                <div class="profile" style="width: 230px">
                    <img src="./images/Default_pfp.svg.png" alt="foto de perfil">
                    <% 
                     if (logado) {
                       int userId = (int) session.getAttribute("userId");
                       Usuario usuarioLogado = pegarUsuario.getOneUser(userId);
                       String nome = usuarioLogado.getNome();
                    %>
                    <h2 class="hello-profile">Olá, <%= nome %></h2>
                    <% } %>
                </div>
                <div class="profile-options">
                    <a href="/Projeto_finalWebIII/registrar_produto.jsp" class="sync-product">Vincular produto</a>
                    <a href="/Projeto_finalWebIII/deslogar.jsp" class="log-out">Deslogar</a>
                </div>
            </div>
        </div>   
        <div class="leaf-rewards">
            <div class="div-points-mission">
                <div class="div-missions-points-title">
                    <h2>Conjunto diário</h2>
                </div>
                <div class="div-missions">
                    <div class="div-mission">
                        <div class="div-mission-title">
                            <h2>Missão: Salve o mundo</h2>
                            <p>Recompensa: 10 pontos</p>
                        </div>
                    </div>
                    <div class="div-mission">
                        <div class="div-mission-title">
                            <h2>Missão: +natureza -celular</h2>
                            <p>Recompensa: 10 pontos</p>
                        </div>
                    </div>
                    <div class="div-mission">
                        <div class="div-mission-title">
                            <h2>Missão </h2>
                            <p>Recompensa: 10 pontos</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
        <div class="div-iframe-father">
            <div class="div-iframe">
                <h3 class="h3-iframe-title">Ajude a natureza</h3>
                <div class="iframe">
                    <iframe width="100%" height="300" src="https://www.youtube.com/embed/BHACKCNDMW8?si=tzlUSisPQLOyA5q3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>
        </div>
        <div class="div-leaf-products">
            <div class="leaf-products p-gaming">
                <div class="div-product-title p-gaming-title">
                    <h2>Gaming</h2>
                </div>
                <div class="div-products div-gaming-products">
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=macbook">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(0).getImagem() %>" alt="alt"/>
                            <span> <%= pegarProdutos.produtosDB().get(0).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=teclado+mecanico">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(1).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(1).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=pc+gamer">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(2).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(2).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=mouse+gamer">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(3).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(3).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=console+xbox">
                             <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(4).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(4).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=console+playstation+5">
                             <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(5).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(5).getNome() %> </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="leaf-products p-special-event">
                <div class="div-product-title p-special-event-title">
                    <h2>Produtos Natal</h2>
                </div>
                <div class="div-products div-special-event-products">
                     <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=macbook">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(0).getImagem() %>" alt="alt"/>
                            <span> <%= pegarProdutos.produtosDB().get(0).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=teclado+mecanico">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(1).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(1).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=pc+gamer">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(2).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(2).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=mouse+gamer">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(3).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(3).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=console+xbox">
                             <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(4).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(4).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=console+playstation+5">
                             <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(5).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(5).getNome() %> </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="leaf-products p-fashion">
                <div class="div-product-title p-fashion-title">
                    <h2>Moda de compra</h2>
                </div>
                <div class="div-products div-fashion-products">
                     <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=macbook">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(0).getImagem() %>" alt="alt"/>
                            <span> <%= pegarProdutos.produtosDB().get(0).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=teclado+mecanico">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(1).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(1).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=pc+gamer">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(2).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(2).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=mouse+gamer">
                            <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(3).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(3).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=console+xbox">
                             <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(4).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(4).getNome() %> </span>
                        </a>
                    </div>
                    <div class="product">
                        <a href="/Projeto_finalWebIII/produto-controller?pesquisa_item=pesquisaItem&select-items=todos&pesquisa=console+playstation+5">
                             <img style="width: 90%; height: 70%;" class="imagem-produto" src="<%= pegarProdutos.produtosDB().get(5).getImagem() %>" alt="alt"/>
                            <span class=""> <%= pegarProdutos.produtosDB().get(5).getNome() %> </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p class="p-footer-1 p-footer">Leaf Company</p>
        <p class="p-footer-2 p-footer">Salvando o mundo com você!</p>
    </footer
</body>

</html>