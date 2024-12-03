<%@page import="model.Usuario"%>
<%@page import="model.Produtos"%>
<%@page import="model.ProdutosRegistrados"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.UsuarioDAO"%>
<%@page import="database.ProdutosDAO"%>
<%@include file="session/validar.jsp" %>


<%
    UsuarioDAO dao = new UsuarioDAO();
    ArrayList<Usuario> list = dao.getAllUsers();

    ProdutosDAO pDao = new ProdutosDAO();
    ArrayList<Produtos> lista = pDao.getAllProdutos();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./css/style.css"/>
        <title>JSP Page</title>
    </head>
    <body style="background-color: #F0FFED">
        <div class="container mt-4">
            <h1 style="margin-top: 30px">Página Inicial</h1>

            <a href="./session/finalizar.jsp" class="btn btn-danger" style="margin-left: 1300px" id="btn-menu">Sair</a>

            <table class="table table-striped justify-content-center" style="margin-top: 50px; background-color: white">
                <thead>
                    <tr>
                        <th>Cod</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Novidades</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Usuario user : list) {%>
                    <tr>
                        <td> <%= user.getId()%> </td>
                        <td> <%= user.getNome()%> </td>
                        <td> <%= user.getEmail()%> </td>
                        <td> <%= (user.isNovidades()) ? "Sim" : "Não"%> </td>
                        <td>
                            <a onclick="excluir(<%= user.getId()%>, '<%= user.getNome()%>')" title="Excluir <%= user.getNome()%>"> 🗑️ </a>
                        </td>
                        <td>
                            <a href="usuario-controller?pagina=editar&id=<%= user.getId()%>" title="Atualizar <%= user.getNome()%>"> ✏️️ </a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>

            <h1 style="margin-top: 30px">Produtos</h1>
            <a href="add_produto.html" class="add-product btn" style="background-color: #009628; color: white; margin-left: 1300px" >+ Adicionar Produto </a>
            <table class="table table-striped" style="margin-top: 50px; background-color: white">
                <thead>
                    <tr>
                        <th>Cod</th>
                        <th>Nome</th>
                        <th>Imagem</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Descrição</th>
                        <th>Endereço</th>
                        <th>Preço</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Produtos po : lista) {%>
                    <tr>
                        <td> <%= po.getId()%> </td>
                        <td> <%= po.getNome()%> </td>
                        <td> <img style="width: 80px " src="<%= po.getImagem()%>" alt="imagem produto"/> </td>
                        <td> <%= po.getMarca()%> </td>
                        <td> <%= po.getModelo()%> </td>
                        <td> <%= po.getDescricao()%> </td>
                        <td> <%= po.getEndereco()%> </td>
                        <td> <%= po.getPreco()%> </td>
                        <td>
                            <a onclick="excluirProduto(<%= po.getId()%>, '<%= po.getNome()%>')" title="Excluir <%= po.getNome()%>"> 🗑️ </a>
                        </td>
                        <td>
                            <a href="produtos-controller?pagina=editar-produto&id=<%= po.getId()%>" title="Atualizar <%= po.getNome()%>"> ✏️️ </a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>

        <script>
            function excluir(id, nome) {
                if (confirm("Deseja excluir o usuário " + nome + "?")) {
                    window.location.href = "usuario-controller?pagina=excluir&id=" + id;
                } else {
                    alert("Exclusão cancelada!");
                }
            }

            function excluirProduto(id, nome) {
                if (confirm("Deseja excluir o produto " + nome + "?")) {
                    window.location.href = "produtos-controller?pagina=excluir-produto&id=" + id;
                } else {
                    alert("Exclusão cancelada!");
                }
            }

        </script>

    </body>
</html>
