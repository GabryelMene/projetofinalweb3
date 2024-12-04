package model;

import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;
import java.sql.Connection;
import java.sql.ResultSet; 
import java.sql.PreparedStatement; 
import java.sql.SQLException;
import java.util.ArrayList; 
import model.Produto; 
import model.Usuario;
import model.Conexao; 

public class VendaDAO {
    public static Connection conn;
    
    public VendaDAO() throws ClassNotFoundException, SQLException {
        conn = Conexao.getConn(); 
    }
    
    public ArrayList<Venda> vendasDB() throws ClassNotFoundException, SQLException {
        ArrayList<Venda> arrayVendas = new ArrayList<>();
        
        String query = "SELECT * FROM tb_vendas";
        
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            ResultSet res = prep.executeQuery(query);
            
            while (res.next()) {
                Venda venda = new Venda(); 
                venda.setId(res.getInt("id")); 
                venda.setIdProduto(res.getInt("idProduto"));
                venda.setNomeUsuario(res.getString("nomeUsuario")); 
                venda.setNomeProduto(res.getString("nomeProduto"));
                
                arrayVendas.add(venda); 
            }
            
        } catch (ClassCastException | SQLException erro) {
            System.out.println(erro); 
        }
        return arrayVendas;
    }
    
    public void compraProduto(int idUsuario, int idProduto, String nomeProduto, String nomeUsuario) throws ClassNotFoundException, SQLException {
        String query = "INSERT INTO tb_vendas(idUsuario, idProduto, nomeProduto, nomeUsuario)"
                + "VALUES (?, ?, ?, ?); ";
        
        PreparedStatement prep = conn.prepareStatement(query);
        
        prep.setInt(1, idUsuario);
        prep.setInt(2, idProduto);
        prep.setString(3, nomeProduto);
        prep.setString(4, nomeUsuario);
        
        prep.execute();
        prep.close(); 
    }
    
    public void adicionarPontosCompra(int idUsuario) throws ClassNotFoundException, SQLException {
        String query = "UPDATE tb_usuarios SET pontos = pontos + 10 WHERE id = " + idUsuario;
        
        PreparedStatement prep = conn.prepareStatement(query);
        prep.execute(); 
        prep.close(); 
    }
}
