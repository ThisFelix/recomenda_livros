/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.daos;

import ifsp.pwe.contatos.beans.Indicacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author felix
 */
public class CorrecaoDAO {
    
    private static Connection connection;

    public CorrecaoDAO() throws ClassNotFoundException, SQLException {
        this.connection = new ConnectionFactory().getConnection();
    }
    
    public Collection<Indicacao> buscaCorrecao(int id_atividade) throws SQLException {
        List<Indicacao> similares = new ArrayList<>();

        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM correcao WHERE id_atividade = " + id_atividade);

        ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String observacao = rs.getString("observacao");
                int nota = rs.getInt("nota");
                int atividade = rs.getInt("id_atividade");
                Indicacao corr = new Indicacao(nota, observacao, atividade);
                corr.setId(atividade);
                similares.add(corr);
            }
        
        rs.close();
        stmt.close();
        return similares;
    }
    
    public static void adiciona(String observa, int nota, int id_atv) throws SQLException {
        String sql = "insert into correcao (nota, observacao, id_atividade) values (?,?,?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
                 
        stmt.setInt(1, nota);
        stmt.setString(2, observa);
        stmt.setInt(3, id_atv);
        stmt.execute();
        stmt.close();
    }
    
}
