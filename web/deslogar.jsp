<% 
    if( request.getSession().getAttribute("autenticado") != null ) {
        request.getSession().invalidate();
    }
    
response.sendRedirect("/Projeto_finalWebIII/index.jsp");
%>