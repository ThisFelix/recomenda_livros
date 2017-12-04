/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.daos;

import ifsp.pwe.contatos.beans.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Giovani
 */
public class UsuarioDAO {
    
    private static Connection connection;
    
    public UsuarioDAO() throws ClassNotFoundException, SQLException{
        UsuarioDAO.connection = ConnectionFactory.getConnection();
    }
    
    public Usuario buscaPorEmailESenha(String email, String senha) throws SQLException {
        if (email == null || senha == null){
            return null;
        }
        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM usuario WHERE email = '" + email + "'");
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Usuario usuario = new Usuario(rs.getString("email"), rs.getString("senha"));
            
            usuario.setId(Integer.parseInt(rs.getString("id_usuario")));
           
            if (usuario.getSenha().equals(senha)){
                return usuario;
            }
        }  
        rs.close();
        stmt.close();
        return null;
    }
    
    public int buscaId(String email, String senha) throws SQLException {
        if (email == null || senha == null){
            return 0;
        }
        int id = 0;
        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM usuario WHERE email = '" + email + "'");
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Usuario usuario = new Usuario(rs.getString("email"), rs.getString("senha"));
            usuario.setId(Integer.parseInt(rs.getString("id_usuario")));
            
            if (usuario.getSenha().equals(senha)){
                id = usuario.getId();
            }
        }  
        rs.close();
        stmt.close();
        return id;
    }
    
    public static void adiciona(String nome, String email, String  senha) throws SQLException {
        String sql = "insert into usuario (nome, email, senha) values (?,?,?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
       
                 
        stmt.setString(1, nome);
        stmt.setString(2, email);
        stmt.setString(3, senha);
        stmt.execute();
        stmt.close();
    }
}

