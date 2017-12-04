package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Indicacao;
import ifsp.pwe.contatos.daos.CorrecaoDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Corrigir implements Tarefa{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        int nota = Integer.parseInt(req.getParameter("nota"));
        String observa = req.getParameter("observacao");
        int id_atv = Integer.parseInt(req.getParameter("id_atv"));
     
        
        Indicacao user = new Indicacao(nota, observa, id_atv);
        
        try {
            new CorrecaoDAO().adiciona(observa, nota, id_atv);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NovoLivro.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        req.setAttribute("adicionado", user);
        return "WEB-INF/corrigido.jsp";
    }
    
}
