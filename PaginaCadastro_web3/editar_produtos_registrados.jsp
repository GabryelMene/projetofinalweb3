<%@page import="model.ProdutosRegistrados"%>
<% 
    ProdutosRegistrados pr = (ProdutosRegistrados) request.getAttribute("produtoRegistrado");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Projeto Final WEB III</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    </head>
    <body style="background-color: #F0FFED">
        
        
        
        <main>
            <div class="text-center container border border-black rounded-3 col-sm-10 col-md-6" style="background-color: #FFFF; padding: 0; margin-top: 180px">
                <div class="d-flex p-2 justify-content-center mb-2 w-100" style="margin: auto; background-color: #009628">
                    <h1 class="text-light"> Atualizar Registro </h1>
                </div>

                <span  class="material-symbols-outlined">category_search</span>
                
                <form class="d-flex flex-column justify-content-center validar" action="usuario-controller" method="post" novalidate style="padding: 10px">
                    
                    <input type="hidden" name="pagina" value="atualizar-registro">
                    <input type="hidden" name="id" value="<%= pr.getId() %>">
                    
                    <div class="form-floating mt-3">
                        <input type="text" id="endereco" name="endereco" value="<%= pr.getEndereco() %>" class="form-control border border-black" placeholder="XX-XX-XX-XX-XX-AB" required>
                        <label for="endereco"> Código do Produto </label>
                    </div>

                    <div class="d-grid mt-4">
                        <input type="submit" value="Cadastrar" class="btn btn-primary border border-black">
                        <input type="reset" value="Limpar Campos" class="btn btn-light border border-black mt-4 mb-2">
                    </div>
                </form>
            </div>
        </main>
        
        <script src="js/bootstrap.min.js"></script>
        
        <script src="./js/init-validation.js"></script>
        
    </body>
</html>
