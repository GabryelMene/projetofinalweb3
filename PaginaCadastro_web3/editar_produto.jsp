<%@page import="model.Produtos"%>
<% 
    Produtos p = (Produtos) request.getAttribute("produtos");
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
            <div class="text-center container border border-black rounded-3 col-sm-10 col-md-6 mt-3" style="background-color: #FFFF; padding: 0">
                <div class="d-flex p-2 justify-content-center mb-2 w-100" style="margin: auto; background-color: #009628">
                    <h1 class="text-light"> ATUALIZAR PRODUTO </h1>
                </div>

                <form class="d-flex flex-column justify-content-center validar" action="produtos-controller" method="post" novalidate style="padding: 10px">

                    <input type="hidden" name="pagina" value="atualizar-produto">
                    <input type="hidden" name="id" value="<%= p.getId() %>">

                    <div class="form-floating mt-2">
                        <input type="text" id="product" name="nome" value="<%= p.getNome() %>" class="form-control border border-black" placeholder="Nome do Produto" required>
                        <label for="product"> Nome do Produto </label>
                    </div>

                    <div class="form-floating mt-2">
                        <input type="text" id="image" name="imagem" value="<%= p.getImagem() %>" class="form-control border border-black" placeholder="Link da Imagem" required>
                        <label for="image"> Link da Imagem </label>
                    </div>

                    <div class="form-floating mt-2">
                        <input type="text" id="brand" name="marca" value="<%= p.getMarca() %>" class="form-control border border-black" placeholder="Marca do Produto" required>
                        <label for="brand"> Marca do Produto </label>

                    </div>

                    <div class="form-floating  mt-2">
                        <input type="text" id="model" name="modelo" value="<%= p.getModelo() %>" class="form-control border border-black" placeholder="Modelo do Produto" required>
                        <label for="model"> Modelo do Produto </label>
                    </div>

                    <div class="form-floating  mt-2">
                        <input type="text" id="description" name="descricao" value="<%= p.getDescricao() %>" class="form-control border border-black" placeholder="Descrição do Produto" required>
                        <label for="description"> Descrição do Produto </label>
                    </div>
                    
                    <div class="form-floating  mt-2">
                        <input type="text" id="endereco" name="endereco" value="<%= p.getEndereco() %>" class="form-control border border-black" placeholder="XX-XX-XX-XX-XX" required>
                        <label for="endereco"> XX-XX-XX-XX-XX </label>
                    </div>
                    
                    <div class="form-floating  mt-2">
                        <input type="text" id="price" name="preco" value="<%= p.getPreco() %>" class="form-control border border-black" placeholder="Preçoo do Produto" required>
                        <label for="price"> Preço do Produto </label>
                    </div>

                    <div class="d-grid mt-4">
                        <input type="submit" value="Atualizar" class="btn btn-primary border border-black">
                        <input type="reset" value="Limpar Campos" class="btn btn-light border border-black mt-4 mb-2">
                    </div>
                </form>
            </div>
        </main>

        <script src="js/bootstrap.min.js"></script>

        <script src="./js/init-validation.js"></script>

    </body>
</html>
