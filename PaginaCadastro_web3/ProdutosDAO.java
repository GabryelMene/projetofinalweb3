package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Produtos;

public class ProdutosDAO {

    private static Connection conn;

    public ProdutosDAO() throws ClassNotFoundException, SQLException {
        conn = Conexao.getConn();
    }

    public ArrayList<Produtos> getAllProdutos() throws SQLException {

        ArrayList<Produtos> lista = new ArrayList();

        String query = "SELECT * FROM tb_produtos;";

        PreparedStatement prep = conn.prepareStatement(query);

        ResultSet res = prep.executeQuery();

        while (res.next()) {
            Produtos produto = new Produtos();

            produto.setId(res.getInt("id"));
            produto.setNome(res.getString("nome"));
            produto.setImagem(res.getString("imagem"));
            produto.setMarca(res.getString("marca"));
            produto.setModelo(res.getString("modelo"));
            produto.setDescricao(res.getString("descricao"));
            produto.setEndereco(res.getString("enderecoProduto"));
            produto.setPreco(res.getString("preco"));

            lista.add(produto);
            System.out.println(produto);
        }

        prep.close();
        return lista;
    }

    public void setNewProduto(Produtos p) throws SQLException {
        String query = "INSERT INTO tb_produtos(nome, imagem, marca, modelo, descricao, enderecoProduto, preco) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?);";

        PreparedStatement prep = conn.prepareStatement(query);

        prep.setString(1, p.getNome());
        prep.setString(2, p.getImagem());
        prep.setString(3, p.getMarca());
        prep.setString(4, p.getModelo());
        prep.setString(5, p.getDescricao());
        prep.setString(6, p.getEndereco());
        prep.setString(7, p.getPreco());

        prep.execute();
        prep.close();
    }

    public void deleteProduto(int id) throws SQLException {
        String query = "DELETE FROM tb_produtos "
                + "WHERE id=" + id;

        PreparedStatement prep = conn.prepareStatement(query);

        prep.execute();
        prep.close();
    }

    public Produtos getOneProduto(int id) throws SQLException {
        String query = "select * from tb_produtos where id = " + id;

        PreparedStatement prep = conn.prepareStatement(query);

        ResultSet res = prep.executeQuery();

        Produtos po = new Produtos();

        if (res.next()) {
            po.setId(id);
            po.setNome(res.getString("nome"));
            po.setImagem(res.getString("imagem"));
            po.setMarca(res.getString("marca"));
            po.setModelo(res.getString("modelo"));
            po.setDescricao(res.getString("descricao"));
            po.setEndereco(res.getString("enderecoProduto"));
            po.setPreco(res.getString("preco"));
        }
        prep.close();
        return po;
    }

    public void updateProduto(Produtos po) throws SQLException {
        String query = "update tb_produtos set nome = ?, imagem = ?, marca = ?, "
                + "modelo = ?, descricao = ?, enderecoProduto = ?, "
                + "preco = ? "
                + "where id = ?";

        PreparedStatement prep = conn.prepareStatement(query);

        prep.setString(1, po.getNome());
        prep.setString(2, po.getImagem() );
        prep.setString(3, po.getMarca() );
        prep.setString(4, po.getModelo() );
        prep.setString(5, po.getDescricao() );
        prep.setString(6, po.getEndereco() );
        prep.setString(7, po.getPreco() );
        prep.setInt(8, po.getId() );

        prep.execute();
        prep.close();
    }

}
