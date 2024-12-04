<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%
    boolean logado = (request.getSession().getAttribute("autenticado") != null) ? true : false;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% if (logado) {
        ProdutosRegistradosDAO produtoDao = new ProdutosRegistradosDAO();
                
        String enderecoProduto = "AS-2F-XA-FA-61-AB";
        ProdutoDAO produtoConsultaDao = new ProdutoDAO();
        
        Produto endereco = produtoConsultaDao.produtoEnderecoDB(enderecoProduto);
                
        //ProdutosRegistrados produtoDados = new ProdutosRegistrados(idUsuario, nomeUsuario , enderecoId.getNome(), enderecoId.getId(), enderecoProduto);
        %>   
       
        <%= endereco.getId() %>
        <% } %>
    </body>
</html>
