package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*; 


@WebServlet(name = "vendaController", urlPatterns = {"/venda-controller"})
public class VendaController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String pagina = request.getParameter("pagina");
        
        if (pagina.equals("comprar")) {
            
            HttpSession session = request.getSession(); 
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            String nomeUsuario = request.getParameter("nomeUsuario");
            
            int idProduto = Integer.parseInt(request.getParameter("idProduto")); 
            String nomeProduto = request.getParameter("nomeProduto");
            
            try {
                VendaDAO vDao = new VendaDAO(); 
                vDao.compraProduto(idUsuario, idProduto, nomeProduto, nomeUsuario); 
                vDao.adicionarPontosCompra(idUsuario);
                response.sendRedirect("index.jsp");
                
            } catch (SQLException | ClassNotFoundException erro) {
                System.out.println("ERRO");
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
