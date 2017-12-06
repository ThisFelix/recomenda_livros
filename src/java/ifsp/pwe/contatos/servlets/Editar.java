package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Indicacao;
import ifsp.pwe.contatos.beans.Livro;
import ifsp.pwe.contatos.beans.Usuario;
import ifsp.pwe.contatos.daos.LivroDAO;
import ifsp.pwe.contatos.daos.RecomendacaoDAO;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Editar implements Tarefa{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        Usuario user = (Usuario) session.getAttribute("usuarioLogado");

        int id_livro = Integer.parseInt(req.getParameter("id_livro"));
        int status = Integer.parseInt(req.getParameter("status"));
        int usuario = user.getId();
     
        try {
            new LivroDAO().edita(id_livro, usuario, status);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NovoLivro.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String url = new MeusLivros().executa(req, resp);
        
        return url;
    }
    
}

