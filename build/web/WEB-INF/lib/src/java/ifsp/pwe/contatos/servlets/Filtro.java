/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Usuario;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Giovani
 */
public class Filtro implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String usuario = getUsuario(req);
        System.out.println("usuario " + usuario + " esta na uri: " + req.getRequestURI());

        if (req.getParameter("tarefa") != null && req.getParameter("tarefa").equals("Logout")) {
            this.invalidateCache(resp);
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }

    private String getUsuario(HttpServletRequest req) {
        Usuario usuario = (Usuario) req.getSession().getAttribute("usuarioLogado");

        if (usuario == null) {
            return "<deslogado>";
        }

        return usuario.getEmail();
    }

    private void invalidateCache(HttpServletResponse response) {
        response.setHeader(
                "Cache-Control",
                "no-cache, max-age=0, must-revalidate, no-store");
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
        System.out.println("estou no metodo auxiliar");
    }

}
