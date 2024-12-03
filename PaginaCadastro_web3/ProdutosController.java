package controller;

import database.ProdutosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produtos;

@WebServlet(name = "ProdutosController", urlPatterns = {"/produtos-controller"})
public class ProdutosController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String pagina = request.getParameter("pagina");

        if (pagina.equals("adicionarProduto")) {
            String nome = request.getParameter("nome");
            String imagem = request.getParameter("imagem");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String descricao = request.getParameter("descricao");
            String endereco = request.getParameter("endereco");
            String preco = request.getParameter("preco");

            Produtos po = new Produtos(nome, imagem, marca, modelo, descricao, endereco, preco);

            try {
                ProdutosDAO pDao = new ProdutosDAO();
                pDao.setNewProduto(po);

                response.sendRedirect("admin.jsp");

            } catch (SQLException | ClassNotFoundException erro) {
                System.err.println(erro);
            }
        }

        if (pagina.equals("excluir-produto")) {
            int id = Integer.parseInt(request.getParameter("id"));

            try {
                ProdutosDAO dao = new ProdutosDAO();
                dao.deleteProduto(id);

                response.sendRedirect("admin.jsp");
            } catch (ClassNotFoundException | SQLException erro) {
                System.err.println(erro);
            }
        }

        if (pagina.equals("editar-produto")) {
            int id = Integer.parseInt(request.getParameter("id"));

            try {
                ProdutosDAO dao = new ProdutosDAO();
                Produtos po = dao.getOneProduto(id);

                request.setAttribute("produtos", po);
                request.getRequestDispatcher("editar_produto.jsp").forward(request, response);
            } catch (ClassNotFoundException | SQLException erro) {
                System.err.println(erro);
            }
        }

        if (pagina.equals("atualizar-produto")) {
            int id = Integer.parseInt( request.getParameter("id") );
            String nome = request.getParameter("nome");
            String imagem = request.getParameter("imagem");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String descricao = request.getParameter("descricao");
            String endereco = request.getParameter("endereco");
            String preco = request.getParameter("preco");

            Produtos po = new Produtos(id, nome, imagem, marca, modelo, descricao, endereco, preco);

            try {
                ProdutosDAO pDao = new ProdutosDAO();
                pDao.updateProduto(po);

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
