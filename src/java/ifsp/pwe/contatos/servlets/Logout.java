package ifsp.pwe.contatos.servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logout implements Tarefa {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        req.getSession().removeAttribute("usuarioLogado");
        req.getSession().invalidate();

        resp.setHeader(
        "Cache-Control",
        "no-cache, max-age=0, must-revalidate, no-store");
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        resp.setDateHeader("Expires", 0); // Proxies.
        
        return "index.jsp";
    }

}
