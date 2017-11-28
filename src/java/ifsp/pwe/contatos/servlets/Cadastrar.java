/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Usuario;
import ifsp.pwe.contatos.daos.UsuarioDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author felix
 */
public class Cadastrar implements Tarefa {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        
        Usuario user = new Usuario(email, senha);
        
        try {
            new UsuarioDAO().adiciona(nome, email, senha);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NovoLivro.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.setAttribute("usuario", user);
        return "WEB-INF/cadastrado.jsp";
    }        
    
}
