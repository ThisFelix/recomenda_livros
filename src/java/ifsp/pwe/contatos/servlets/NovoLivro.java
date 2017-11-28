package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Livro;
import ifsp.pwe.contatos.beans.Usuario;
import ifsp.pwe.contatos.daos.LivroDAO;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Félix
 */
public class NovoLivro implements Tarefa {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
    HttpSession session = req.getSession();
    Livro livro = new Livro(req.getParameter("titulo"), req.getParameter("autor"), req.getParameter("genero"));
    Usuario user = (Usuario) session.getAttribute("usuarioLogado");
    
        try {
            new LivroDAO().adiciona(livro, user);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NovoLivro.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.setAttribute("atividade", livro);
        
        return "WEB-INF/adicionado.jsp";
    }    
}