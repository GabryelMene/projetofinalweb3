package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    
    public static Connection getConn() throws ClassNotFoundException, SQLException {
        Connection conn;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/leafdb" ,
                "root" ,
                "Q_1#AsP4$"
        );
        
        System.out.println("Conectado!");
        return conn;
    }
    
}
