package model;
import java.sql.Connection;
import java.sql.ResultSet; 
import java.sql.PreparedStatement; 
import java.sql.SQLException;
import java.util.ArrayList; 
import model.Produto; 
import model.Conexao; 

public class ProdutoDAO {
    private static Connection conn;
    
    public ProdutoDAO() throws ClassNotFoundException, SQLException {
        conn = Conexao.getConn(); 
    }
    
    public ArrayList<Produto> produtosDB() throws ClassNotFoundException, SQLException {
        ArrayList<Produto> arrayProdutos = new ArrayList<>();
        
        String query = "SELECT * FROM tb_produtos";
        
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            ResultSet res = prep.executeQuery(query);
            
            while (res.next()) {
                Produto produto = new Produto(); 
                produto.setId(res.getInt("id")); 
                produto.setNome(res.getString("nome")); 
                produto.setMarca(res.getString("marca")); 
                produto.setModelo(res.getString("modelo")); 
                produto.setDescricao(res.getString("descricao")); 
                produto.setImagem(res.getString("imagem")); 
                produto.setPreco(res.getDouble("preco"));
                
                arrayProdutos.add(produto); 
            }
            
            
        } catch (ClassCastException | SQLException erro) {
            System.out.println(erro); 
        }
        return arrayProdutos;
    }
    
    public Produto produtoIdDB(int id) throws ClassNotFoundException, SQLException {
        
        String query = "SELECT * FROM tb_produtos WHERE id = " + id;
        
        PreparedStatement prep = conn.prepareStatement(query); 
        ResultSet res = prep.executeQuery();
        
        Produto produto = new Produto();
        if (res.next()) {
            produto.setId(id);
            produto.setNome(res.getString("nome")); 
            produto.setMarca(res.getString("marca"));
            produto.setModelo(res.getString("modelo"));
            produto.setDescricao(res.getString("descricao")); 
            produto.setImagem(res.getString("imagem"));
            produto.setPreco(res.getDouble("preco")); 
        }
        
        
        prep.close(); 
        return produto; 
    }
    
    
    public Produto produtoEnderecoDB(String endereco) throws ClassNotFoundException, SQLException {
        String query = "SELECT * FROM tb_produtos WHERE enderecoProduto = " + "'" + endereco + "'";

        PreparedStatement prep = conn.prepareStatement(query);

        ResultSet res = prep.executeQuery();

        Produto produto = new Produto();

        if (res.next()) {
            produto.setId(res.getInt("id"));
            produto.setNome(res.getString("nome")); 
            produto.setMarca(res.getString("marca"));
            produto.setModelo(res.getString("modelo"));
            produto.setDescricao(res.getString("descricao")); 
            produto.setImagem(res.getString("imagem"));
            produto.setEndereco(res.getString("enderecoProduto"));
            produto.setPreco(res.getDouble("preco")); 
        }
        
        prep.close();
        return produto;
    }
    
    public Produto produtoNomeDB(String nome) throws ClassNotFoundException, SQLException {
        String query = "SELECT * FROM tb_produtos WHERE nome = " + "'" +  nome + "'"; 
        
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet res = prep.executeQuery();
        
        Produto produto = new Produto();
        if (res.next()) {
            produto.setId(res.getInt("id"));
            produto.setNome(res.getString("nome"));
            produto.setMarca(res.getString("marca")); 
            produto.setModelo(res.getString("modelo"));
            produto.setDescricao(res.getString("descricao")); 
            produto.setImagem(res.getString("imagem"));
            produto.setPreco(res.getDouble("preco")); 
        }
        
        prep.close(); 
        return produto; 
    }
}
