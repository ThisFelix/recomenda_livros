/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.servlets;

import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.mail.internet.ParseException;

/**
 *
 * @author joao
 */
public class ConversorDeData {
       
   public Date converter(String data) throws java.text.ParseException {
        java.sql.Date sql = null;
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date parsed = format.parse(data);
        sql = new java.sql.Date(parsed.getTime());
        System.out.println("sql: " + sql);
        return sql;
    }
    
}
