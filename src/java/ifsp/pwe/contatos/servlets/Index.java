package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Livro;
import ifsp.pwe.contatos.daos.LivroDAO;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Index implements Tarefa {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        /*Collection<Livro> similares = null;
        try {
            similares = new LivroDAO().buscaTodos();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BuscaAtividade.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.setAttribute("index_atividade", similares);*/
        return "index.jsp";
    }
}
