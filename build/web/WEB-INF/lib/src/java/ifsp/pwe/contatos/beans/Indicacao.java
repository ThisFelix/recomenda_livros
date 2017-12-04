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
    String observacao;
    int codigo_livro, codigo_usuario;
    int id; 
   
    public Indicacao(int codigo_livro, String observa, int codigo_usuario) {
        this.observacao = observa;
        this.codigo_livro = codigo_livro;
        this.codigo_usuario = codigo_usuario;
    }

    public int getCodigo_livro() {
        return codigo_livro;
    }

    public int getCodigo_usuario() {
        return codigo_usuario;
    }

    public int getId() {
        return id;
    }

    public String getObservacao() {
        return observacao;
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

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

}
