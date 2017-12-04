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
public class RecomendacaoDAO {
    
    private static Connection connection;

    public RecomendacaoDAO() throws ClassNotFoundException, SQLException {
        this.connection = new ConnectionFactory().getConnection();
    }
    
    public Collection<Indicacao> buscaRecomendacoes(int cod_usuario) throws SQLException {
        List<Indicacao> similares = new ArrayList<>();

        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM recomendacao WHERE cod_recomendado = " + cod_usuario+" AND status_recomenda='Não Visualizado'");

        ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id_recomendacao");
                String status = rs.getString("status_recomenda");
                int codigo_recomendador = rs.getInt("codigo_recomendador");
                int codigo_recomendado = rs.getInt("cod_recomendado");
                int codigo_livro = rs.getInt("cod_livro");
                
                Indicacao corr = new Indicacao(codigo_livro, codigo_recomendado, codigo_recomendador);
                corr.setId(id);
                similares.add(corr);
            }
        
        rs.close();
        stmt.close();
        return similares;
    }
    
    public static void adiciona(int id_livro, int usuario_recomendador, int usuario_recomendado) throws SQLException {
        String sql = "insert into recomendacao (cod_livro, cod_recomendador, cod_recomendado, status_recomenda) values (?,?,?,?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
                 
        stmt.setInt(1, id_livro);
        stmt.setInt(2, usuario_recomendador);
        stmt.setInt(3, usuario_recomendado);
        stmt.setString(4, "Não Visualizado");
        stmt.execute();
        stmt.close();
    }
    
}
