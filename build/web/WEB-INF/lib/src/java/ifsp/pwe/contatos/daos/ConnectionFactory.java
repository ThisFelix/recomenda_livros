/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Giovani
 */
public class ConnectionFactory {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        try {
            Connection connection = null;

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/recomenda_livros";
            String username = "root";
            String password = "";
            connection = DriverManager.getConnection(url, username, password);

            return connection;
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
            throw new SQLException("Problema ao se conectar.");
        }
    }

}
