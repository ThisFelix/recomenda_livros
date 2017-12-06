/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Livro;
import ifsp.pwe.contatos.beans.Usuario;
import ifsp.pwe.contatos.daos.LivroDAO;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aluno
 */
public class MeusLivros implements Tarefa{
       
    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
         HttpSession session = req.getSession();
        Collection<Livro> similares = null;
        Usuario user = (Usuario) session.getAttribute("usuarioLogado");
        
        int id = user.getId();
        
        try {
            similares = new LivroDAO().buscaLivroPorUsuario(id);
            int id_livro = new LivroDAO().buscaId(req.getParameter("filtro"));
            
            System.out.println(id_livro);
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BuscaLivro.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.setAttribute("meusLivros", similares);
        session.setAttribute("usuarioLogado", user);
        
        return "WEB-INF/meusLivros.jsp";
    }
        

}
