package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Indicacao;
import ifsp.pwe.contatos.beans.Livro;
import ifsp.pwe.contatos.beans.Usuario;
import ifsp.pwe.contatos.daos.RecomendacaoDAO;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Recomendar implements Tarefa{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        Usuario user = (Usuario) session.getAttribute("usuarioLogado");

        int id_livro = Integer.parseInt(req.getParameter("id_livro"));
        int usuario_recomendado = Integer.parseInt(req.getParameter("codigo_recomendado"));
        int usuario_recomendador = user.getId();
     
        Indicacao indica = new Indicacao(id_livro, usuario_recomendado, usuario_recomendador);
        
        try {
            new RecomendacaoDAO().adiciona(id_livro, usuario_recomendador, usuario_recomendado);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NovoLivro.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.setAttribute("usuarioLogado", user);
        req.setAttribute("adicionado", indica);
        return "WEB-INF/recomendado.jsp";
    }
    
}
