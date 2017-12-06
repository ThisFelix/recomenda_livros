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

        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM recomendacao INNER JOIN livro ON cod_livro = livro.id_livro INNER JOIN usuario ON cod_recomendador = usuario.id_usuario WHERE cod_recomendado ="+cod_usuario+" AND status_recomenda= 'Não Visualizado' AND cod_recomendado != cod_recomendador");
        ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id_recomendacao");
                String status = rs.getString("status_recomenda");
                int codigo_recomendador = rs.getInt("cod_recomendador");
                int codigo_recomendado = rs.getInt("cod_recomendado");
                int codigo_livro = rs.getInt("cod_livro");
                
System.out.println(rs.getString("titulo"));
Indicacao corr = new Indicacao(codigo_livro, codigo_recomendado, codigo_recomendador);
                corr.setId(id);
                corr.setAutor(rs.getString("autor"));
                corr.setGenero(rs.getString("genero"));
                corr.setTitulo(rs.getString("titulo"));
                corr.setNome_recomendador(rs.getString("nome"));
                corr.setStatus(status);
                
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
    
    public static void edita_recomendacao(int id_livro, int usuario_recomendador, int usuario_recomendado, String status_recomenda) throws SQLException {
        System.out.println(status_recomenda);
        String sql = "UPDATE recomendacao SET status_recomenda = '"+status_recomenda+"' WHERE cod_livro = "+id_livro+" AND cod_recomendador = "+usuario_recomendador+" AND cod_recomendado = "+usuario_recomendado;
        PreparedStatement stmt = connection.prepareStatement(sql);
        System.out.println(sql);   
        stmt.execute(sql);
        stmt.close();
    }
}
