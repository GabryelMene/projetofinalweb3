package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexao {
    public static Connection getConn() throws ClassNotFoundException, SQLException {
        Connection conn;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        String database = "jdbc:mysql://localhost:3307/leafdb";
        String usuario = "root";
        String senha = "500512";
        
        conn = DriverManager.getConnection(database, usuario, senha);
        
        System.out.println("Conectado!");
        
        return conn;
    }
}