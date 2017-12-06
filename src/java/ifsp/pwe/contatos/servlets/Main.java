/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author joao
 */
public class Main implements Tarefa{
    
    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        Usuario user = (Usuario) session.getAttribute("usuarioLogado");
        String url; 
        
        String email = user.getEmail();
        String senha = user.getSenha();
        
  
        if(user != null) {
            url =  "/WEB-INF/paginas/Main.jsp";
            session.setAttribute("usuarioLogado", user);
        }else{
            url = "naoEncontrado.jsp";
        }
        return url;
    }
}
