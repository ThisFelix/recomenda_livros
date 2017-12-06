/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.servlets;

import ifsp.pwe.contatos.beans.Livro;
import ifsp.pwe.contatos.beans.Usuario;
import ifsp.pwe.contatos.daos.LivroDAO;
import ifsp.pwe.contatos.daos.RecomendacaoDAO;
import ifsp.pwe.contatos.daos.UsuarioDAO;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author joao
 */
public class AceitarRecomenda implements Tarefa{
    
    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) {
        
        HttpSession session = req.getSession();
        Usuario user = (Usuario) session.getAttribute("usuarioLogado");
       
       
        
        int cod_livro = Integer.parseInt(req.getParameter("cod_livro"));
        int cod_recomendado = Integer.parseInt(req.getParameter("cod_recomendado"));
        int cod_recomendador = Integer.parseInt(req.getParameter("cod_recomendador"));
        String status_recomenda = req.getParameter("status");
        
        Livro livro = new Livro(req.getParameter("titulo"), req.getParameter("autor"), req.getParameter("genero"));
        livro.setId(Integer.parseInt(req.getParameter("cod_livro")));
        livro.setStatus("Leitura Não Iniciada");
        
        if(status_recomenda.equals("Aceito")){
            try {
                new RecomendacaoDAO().edita_recomendacao(cod_livro, cod_recomendador, cod_recomendado, status_recomenda);
                
                new LivroDAO().adiciona_lista(livro, user);
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(AceitarRecomenda.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(AceitarRecomenda.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        }else if(status_recomenda.equals("Recusado")){
           
             try {
                new LivroDAO().adiciona_lista(livro, user);
                new RecomendacaoDAO().edita_recomendacao(cod_livro, cod_recomendador, cod_recomendado, status_recomenda);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(AceitarRecomenda.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(AceitarRecomenda.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
        }
        session.setAttribute("usuarioLogado", user);
        
        String url = new Login().executa(req, resp);
        
        return url;
    }
       
}
