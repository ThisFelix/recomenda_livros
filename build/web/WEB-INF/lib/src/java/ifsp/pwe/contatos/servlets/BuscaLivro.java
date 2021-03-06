package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Livro;
import ifsp.pwe.contatos.beans.Indicacao;
import ifsp.pwe.contatos.daos.LivroDAO;
import ifsp.pwe.contatos.daos.CorrecaoDAO;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Giovani
 */
public class BuscaLivro implements Tarefa {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        Collection<Livro> similares = null;
        
        try {
            similares = new LivroDAO().buscaSimilar(req.getParameter("filtro"));
            int id = new LivroDAO().buscaId(req.getParameter("filtro"));
            
            System.out.println(id);
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BuscaLivro.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.setAttribute("livro", similares);
        
        return "WEB-INF/busca.jsp";
    }
    
    public String metodoTeste(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("Entrei no método de teste!");
        return "WEB-INF/paginas/Main.jsp";
    }
}
