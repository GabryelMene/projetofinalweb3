package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.ProdutosRegistrados;
import model.Usuario;
import model.Conexao;
import model.Produto;

public class ProdutosRegistradosDAO {

    private static Connection conn;

    public ProdutosRegistradosDAO() throws ClassNotFoundException, SQLException {
        conn = Conexao.getConn();
    }

    public ArrayList<ProdutosRegistrados> getAllProdutosRegistrados() throws SQLException {

        ArrayList<ProdutosRegistrados> list = new ArrayList();

        String query = "SELECT * FROM tb_produtosRegistrados;";

        PreparedStatement prep = conn.prepareStatement(query);

        ResultSet res = prep.executeQuery();

        while (res.next()) {
            ProdutosRegistrados pr = new ProdutosRegistrados();

            pr.setId(res.getInt("id"));
            pr.setData(res.getString("data"));
            pr.setEndereco(res.getString("endereco"));
            
            list.add(pr);
            System.out.println(pr);
        }

        prep.close();
        return list;
    }

    public void setNewProdutoRegistrado(ProdutosRegistrados produtoARegistrar) throws SQLException {
        String query = "INSERT INTO tb_produtosVinculados (idUsuario, nomeUsuario ,idProduto, nomeProduto , enderecoProduto) "
                + "VALUES(?, ?, ?, ?, ?);";

        PreparedStatement prep = conn.prepareStatement(query);

        prep.setInt(1, produtoARegistrar.getIdUsuario());
        prep.setString(2, produtoARegistrar.getNomeUsuario());
        prep.setInt(3, produtoARegistrar.getIdProduto()); 
        prep.setString(4, produtoARegistrar.getNomeProduto());
        prep.setString(5, produtoARegistrar.getEndereco()); 
        
        prep.execute();
        prep.close();
    }

    public void deleteProdutoRegistrado(int id) throws SQLException {
        String query = "DELETE FROM tb_produtosRegistrados "
                + "WHERE id=" + id;

        PreparedStatement prep = conn.prepareStatement(query);

        prep.execute();
        prep.close();
    }

    public ProdutosRegistrados getOneProdutoRegistrado(int id) throws SQLException {
        String query = "select * from tb_produtosRegistrados where id = " + id;

        PreparedStatement prep = conn.prepareStatement(query);

        ResultSet res = prep.executeQuery();

        ProdutosRegistrados pr = new ProdutosRegistrados();

        if (res.next()) {
            pr.setId(id);
            pr.setEndereco(res.getString("endereco"));;
        }
        prep.close();
        return pr;
    }

    public void updateProdutoRegistrado(ProdutosRegistrados produto) throws SQLException {
        String query = "update tb_produtosRegistrados set enderecoProduto = ?, "
                + "where id = ?";

        PreparedStatement prep = conn.prepareStatement(query);

        prep.setString(1, produto.getEndereco());
        prep.setInt(2, produto.getId());

        prep.execute();
        prep.close();
    }

}