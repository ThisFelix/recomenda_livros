/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.daos;

import ifsp.pwe.contatos.beans.Livro;
import ifsp.pwe.contatos.beans.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author Felix
 */
public class LivroDAO {

    private static Connection connection;

    public LivroDAO() throws ClassNotFoundException, SQLException {
        this.connection = new ConnectionFactory().getConnection();
    }

    public Collection<Livro> buscaSimilar(String nome) throws SQLException {
        List<Livro> similares = new ArrayList<>();

        PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM livro WHERE titulo LIKE '%"+nome+"%' ");

        if (nome == null) {
            stmt = this.connection.prepareStatement("select * from livro");
        }

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
        int id = rs.getInt("id");
        Livro livro = new Livro(rs.getString("titulo"), rs.getString("autor"), rs.getString("genero"));
        livro.setId(id);
        similares.add(livro);
        }
        rs.close();
        stmt.close();
        return similares;
    }
    
    public Collection<Livro> buscaLivroPorUsuario(int id) throws SQLException {
        List<Livro> similares = new ArrayList<>();

        PreparedStatement stmt = this.connection.prepareStatement("SELECT b.*, c.*, d.descricao FROM lista_livros as b, livro as c, livro_status as d WHERE b.cod_usuario = "+id+" AND b.cod_livro in ( SELECT c.id_livro FROM livro) AND d.id_status = b.status");

        if (id == 0) {
            stmt = this.connection.prepareStatement("select * from livro ORDER BY id ASC");
        }

        ResultSet rs = stmt.executeQuery();
        int id_atv = 0;
        while (rs.next()) {
            id_atv = rs.getInt("id");
            Livro livro = new Livro(rs.getString("titulo"), rs.getString("autor"), rs.getString("genero"));
            livro.setId(id_atv);
            livro.setStatus(rs.getString("status"));
            similares.add(livro);
        }
        rs.close();
        stmt.close();
        return similares;
    }
    
    public int buscaId(String nome) throws SQLException {
        
        int id = 0;

        PreparedStatement stmt = this.connection.prepareStatement("SELECT id FROM livro WHERE titulo LIKE '%" + nome + "%'");

        if (nome == null) {
            id = 0;
        }

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            id = rs.getInt("id");
        }
        rs.close();
        stmt.close();
        return id;
    }
    
    public static void adiciona(Livro livro, Usuario user) throws SQLException {
        
        String sql = "insert into livro (titulo, autor, genero) values (?,?,?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, livro.getTitulo());
        stmt.setString(2, livro.getAutor());
        stmt.setString(3, livro.getGenero());
        stmt.execute();
        stmt.close();
        
    }
    
    public static void adiciona_lista(Livro livro, Usuario user) throws SQLException {
        int status = 0;
        if(livro.getStatus().equals("Lido")){
            status = 1;
        }else if(livro.getStatus().equals("Leitura Não Iniciada")){
            status = 2;
        }else if(livro.getStatus().equals("Em Leitura")){
            status = 3;
        }
        
        String sql = "insert into lista_livros (cod_livro, cod_usuario, status) values (?,?,?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, livro.getTitulo());
        stmt.setInt(2, user.getId());
        stmt.setInt(3, status);
        stmt.execute();
        stmt.close();  
    }
    
    public Collection<Livro> buscaTodos() throws SQLException {
        List<Livro> similares = new ArrayList<>();

        PreparedStatement stmt = this.connection.prepareStatement("SELECT b.*, a.* FROM `atividade`as b, usuario as a WHERE a.id = b.cod_user ORDER BY data DESC");

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String titulo = rs.getString("titulo");
            String corpo = rs.getString("corpo");
            String data = rs.getString("data");
            Livro atividade = new Livro(titulo, corpo, data);
            atividade.setId(id);
            similares.add(atividade);
        }
        rs.close();
        stmt.close();
        return similares;
    }
}
