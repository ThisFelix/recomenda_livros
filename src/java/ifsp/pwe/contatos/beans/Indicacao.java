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
    int codigo_livro, codigo_usuario, codigo_recomendado;
    int id; 
   
    public Indicacao(int codigo_livro, int codigo_recomendado, int codigo_usuario) {
        this.codigo_livro = codigo_livro;
        this.codigo_usuario = codigo_usuario;
        this.codigo_recomendado = codigo_recomendado;
    }

    public int getCodigo_livro() {
        return codigo_livro;
    }

    public int getCodigo_usuario() {
        return codigo_usuario;
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

    public void setCodigo_usuario(int codigo_usuario) {
        this.codigo_usuario = codigo_usuario;
    }

    public void setId(int id) {
        this.id = id;
    }

}
