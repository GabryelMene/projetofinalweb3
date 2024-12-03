package controller;

import database.ProdutosRegistradosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProdutosRegistrados;

@WebServlet(name = "RegistrarController", urlPatterns = {"/registrar-controller"})
public class RegistrarController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String pagina = request.getParameter("pagina");
        
        if (pagina.equals("registro")) {
            String endereco = request.getParameter("endereco");
            
            ProdutosRegistrados pr = new ProdutosRegistrados( endereco );

            try {
                ProdutosRegistradosDAO prDao = new ProdutosRegistradosDAO();
                prDao.setNewProdutoRegistrado(pr);

                response.sendRedirect("index.html");

            } catch (SQLException | ClassNotFoundException erro) {
                System.err.println(erro);
            }
        }
        
        
        if(pagina.equals("excluir-registro")) {
            int id = Integer.parseInt( request.getParameter("id") );
            
            try {
                ProdutosRegistradosDAO prdao = new ProdutosRegistradosDAO();
                prdao.deleteProdutoRegistrado(id);
                
                response.sendRedirect("admin.jsp");
            } catch(ClassNotFoundException | SQLException erro) {
                System.err.println( erro );
            }
        }
        
        
        if(pagina.equals("editar-registro")) {
            int id = Integer.parseInt( request.getParameter("id") );
            
            try {
                ProdutosRegistradosDAO prdao = new ProdutosRegistradosDAO();
                ProdutosRegistrados pr = prdao.getOneProdutoRegistrado(id);
                
                request.setAttribute("registro", pr);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
            } catch(ClassNotFoundException | SQLException erro) {
                System.err.println( erro );
            }
        }        
        
    
        if (pagina.equals("atualizar-registro")) {
            int id = Integer.parseInt( request.getParameter("id") );
            String endereco = request.getParameter("endereco");

            ProdutosRegistrados pr = new ProdutosRegistrados(id, endereco);

            try {
                ProdutosRegistradosDAO prDao = new ProdutosRegistradosDAO();
                prDao.updateProdutoRegistrado(pr);

                response.sendRedirect("admin.jsp");

            } catch (SQLException | ClassNotFoundException erro) {
                System.err.println(erro);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
