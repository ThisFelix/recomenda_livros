/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.servlets;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Giovani
 */
public class Controller extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tarefa = req.getParameter("tarefa");

        if (tarefa == null) {
            throw new IllegalArgumentException("Você não informou a tarefa");
        }

        tarefa = "ifsp.pwe.contatos.servlets." + tarefa;

        try {
            Class<?> classe = Class.forName(tarefa);
            String metodo = req.getParameter("metodo");
            String pagina = null;

            if (metodo == null) {
                Tarefa instancia = (Tarefa) classe.newInstance();
                pagina = instancia.executa(req, resp);
            } else {
                Method method = classe.getDeclaredMethod(metodo, HttpServletRequest.class, HttpServletResponse.class);
                pagina = (String) method.invoke(classe.newInstance(), req, resp);
            }

            if (pagina != null) {
                RequestDispatcher requestDispatcher = req.getRequestDispatcher(pagina);
                requestDispatcher.forward(req, resp);
            }
            
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new ServletException(e);
        } catch (NoSuchMethodException | SecurityException | IllegalArgumentException | InvocationTargetException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
