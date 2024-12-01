package model;

import database.UsuarioDAO;
import java.sql.SQLException;
import java.util.ArrayList;

public class Usuario {
    private int id;
    private String nome;
    private String email;
    private String senha;
    private boolean novidades;
    private int pontos;

    public Usuario() {}
    
    public Usuario(String email, String senha) {
        this.email = email;
        this.senha = senha;
    }

    public Usuario(String nome, String email, String senha, boolean novidades) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.novidades = novidades;
    }
    
    
    public Usuario(int id, String nome, String email, boolean novidades) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.novidades = novidades;
    }
    
    public Usuario(int pontos){
        this.pontos = pontos;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public boolean isNovidades() {
        return novidades;
    }

    public void setNovidades(boolean novidades) {
        this.novidades = novidades;
    }
    
    public boolean login() throws ClassNotFoundException, SQLException {
        boolean key = false;
        UsuarioDAO dao = new UsuarioDAO();
        ArrayList<Usuario> list = dao.getAllUsers();
        
        for(Usuario u : list) {
            if( u.getEmail().equals(this.email) ) {
                if( u.getSenha().equals(this.senha) ) {
                    key = true;
                }
            }
        }
                
        return key;
    }
    
    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", nome=" + nome + ", email=" + email + ", senha=" + senha + ", novidades=" + novidades + '}';
    }
}

