package model;

import model.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Usuario;

public class UsuarioDAO {

    private static Connection conn;

    public UsuarioDAO() throws ClassNotFoundException, SQLException {
        conn = Conexao.getConn();
    }

    public ArrayList<Usuario> getAllUsers() throws SQLException {

        ArrayList<Usuario> list = new ArrayList();

        String query = "SELECT * FROM tb_usuarios;";

        PreparedStatement prep = conn.prepareStatement(query);

        ResultSet res = prep.executeQuery();

        while (res.next()) {
            Usuario user = new Usuario();

            user.setId(res.getInt("id"));
            user.setNome(res.getString("nome"));
            user.setEmail(res.getString("email"));
            user.setSenha(res.getString("senha"));
            user.setNovidades(res.getInt("novidades") == 1);
            user.setPontos(res.getInt("pontos"));

            list.add(user);
            System.out.println(user);
        }

        prep.close();
        return list;
    }
    
    public ArrayList<Usuario> getUsersPointsLeaderboard() throws SQLException {
        String query = "SELECT id, nome, pontos FROM tb_usuarios ORDER BY pontos DESC";
        
        ArrayList<Usuario> listaUsuarios = new ArrayList();
        
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet res = prep.executeQuery();
        
        while (res.next()) {
             Usuario userLeaderboard = new Usuario(); 
             
             userLeaderboard.setId(res.getInt("id"));
             userLeaderboard.setNome(res.getString("nome"));
             userLeaderboard.setPontos(res.getInt("pontos"));
             
             listaUsuarios.add(userLeaderboard);
             System.out.println(userLeaderboard); 
        }
        
        prep.close();
        return listaUsuarios;
    }

    public void setNewUser(Usuario user) throws SQLException {
        String query = "INSERT INTO tb_usuarios(nome, email, senha, novidades, pontos) "
                + "VALUES(?, ?, sha1(?), ?, ?);";

        PreparedStatement prep = conn.prepareStatement(query);

        prep.setString(1, user.getNome());
        prep.setString(2, user.getEmail());
        prep.setString(3, user.getSenha());
        prep.setInt(4, user.isNovidades() ? 1 : 0);
        prep.setInt(5, 0);

        prep.execute();
        prep.close();
    }

    public void deleteUser(int id) throws SQLException {
        String query = "DELETE FROM tb_usuarios "
                + "WHERE id=" + id;

        PreparedStatement prep = conn.prepareStatement(query);

        prep.execute();
        prep.close();
    }

    public Usuario getOneUser(int id) throws SQLException {
        String query = "select * from tb_usuarios where id = " + id;

        PreparedStatement prep = conn.prepareStatement(query);

        ResultSet res = prep.executeQuery();

        Usuario u = new Usuario();

        if (res.next()) {
            u.setId(id);
            u.setNome(res.getString("nome"));
            u.setEmail(res.getString("email"));
            u.setEmailRecuperacao(res.getString("emailRecuperacao"));
            u.setSenha(res.getString("senha"));
            u.setNovidades(res.getInt("novidades") == 1);
            u.setPerfilPrivado(res.getInt("perfilPrivado") == 1);
            u.setDescricao(res.getString("descricao"));
            u.setPontos(res.getInt("pontos"));
        }
        prep.close();
        return u;
    }
    
    public Usuario getOneUserByEmail(String nome) throws SQLException {
        String query = "select * from tb_usuarios where email = ?";

        PreparedStatement prep = conn.prepareStatement(query);

        prep.setString(1, nome);

        ResultSet res = prep.executeQuery();

        Usuario u = new Usuario();

        if (res.next()) {
            u.setId(res.getInt("id"));
            u.setNome(res.getString("nome"));
            u.setEmail(res.getString("email"));
            u.setSenha(res.getString("senha"));
            u.setNovidades(res.getInt("novidades") == 1);
        }

        prep.close();
        return u;
    }

     public void updateUser(Usuario user) throws SQLException {
        String query = "update tb_usuarios set nome = ?, "
                     + "email = ?, novidades = ? "
                     + "where id = ?";
        
        PreparedStatement prep = conn.prepareStatement(query);
        
        prep.setString(1, user.getNome() );
        prep.setString(2, user.getEmail() );
        prep.setInt(3, user.isNovidades() ? 1 : 0 );
        prep.setInt(4, user.getId() );
        
        prep.execute();
        prep.close();
    }
     
    public void updateUserSocial(Usuario user) throws SQLException {
        String query = "UPDATE tb_usuarios SET nome = ?, "
                + "email = ?, emailRecuperacao = ?,"
                + "senha = sha1(?), descricao = ?, "
                + "perfilPrivado = ?, novidades = ? "
                + "WHERE id = ?"; 
        
        PreparedStatement prep = conn.prepareStatement(query); 
        
        prep.setString(1, user.getNome());
        prep.setString(2, user.getEmail());
        prep.setString(3, user.getEmailRecuperacao());
        prep.setString(4, user.getSenha());
        prep.setString(5, user.getDescricao());
        prep.setInt(6, user.isPerfilPrivado() ? 1 : 0);
        prep.setInt(7, user.isNovidades() ? 1 : 0 );
        prep.setInt(8, user.getId());
        
        prep.execute();
        prep.close(); 
    }
}