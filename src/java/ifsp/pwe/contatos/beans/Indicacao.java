/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.beans;

/**
 *
 * @author joao
 */
public class Indicacao {
    int codigo_livro, codigo_recomendador, codigo_recomendado;
    int id; 
    String titulo, autor, genero, nome_recomendador, status;
   
    public Indicacao(int codigo_livro, int codigo_recomendado, int codigo_usuario) {
        this.codigo_livro = codigo_livro;
        this.codigo_recomendador = codigo_usuario;
        this.codigo_recomendado = codigo_recomendado;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
       
    
            
        
    public int getCodigo_livro() {
        return codigo_livro;
    }

   

    public int getCodigo_recomendado() {
        return codigo_recomendado;
    }
    
    public int getId() {
        return id;
    }

    public void setCodigo_recomendado(int codigo_recomendado) {
        this.codigo_recomendado = codigo_recomendado;
    }

    
    public void setCodigo_livro(int codigo_livro) {
        this.codigo_livro = codigo_livro;
    }

    public int getCodigo_recomendador() {
        return codigo_recomendador;
    }

    public void setCodigo_recomendador(int codigo_recomendador) {
        this.codigo_recomendador = codigo_recomendador;
    }

    
    
    public void setId(int id) {
        this.id = id;
    }

    public String getAutor() {
        return autor;
    }

    public String getGenero() {
        return genero;
    }

    public String getNome_recomendador() {
        return nome_recomendador;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public void setNome_recomendador(String nome_recomendador) {
        this.nome_recomendador = nome_recomendador;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
 
}
