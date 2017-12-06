/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Indicacao;
import ifsp.pwe.contatos.beans.Usuario;
import ifsp.pwe.contatos.daos.RecomendacaoDAO;
import ifsp.pwe.contatos.daos.UsuarioDAO;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Felix
 */
public class Login implements Tarefa {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        Usuario usuario = null;
        Collection<Indicacao> similares = null;
        
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        
        try {
            usuario = new UsuarioDAO().buscaPorEmailESenha(email, senha);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        String url;
     
        if(usuario == null) {
            url = "naoEncontrado.jsp";
        }else{
            HttpSession session = req.getSession();
            
      
                int cod_user = 0;
                try {
                    cod_user = new UsuarioDAO().buscaId(email, senha);
                    System.out.print(cod_user);
                    similares = new RecomendacaoDAO().buscaRecomendacoes(cod_user);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                }
                url =  "/WEB-INF/paginas/Main.jsp";
                session.setAttribute("indicacao", similares);
              
            
            session.setAttribute("usuarioLogado", usuario);
        }
        return url;
    }
}
