/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.pwe.contatos.beans;

/**
 *
 * @author Félix
 */
public class Usuario {

    private String email;
    private String senha;
    private String nome;
    private String dataNasc;
    private String endereco;
    private Boolean corretor; 
    private int id; 

    public Usuario(String email, String senha) {
        this.email = email;
        this.senha = senha;
    }  
       
    public int getId(){
        return this.id;
    }
    
    public String getEmail() {
        return email;
    }

    public String getSenha() {
        return senha;
    }

    public Boolean getCorretor() {
        return corretor;
    }

    public String getDataNasc() {
        return dataNasc;
    }

    public String getEndereco() {
        return endereco;
    }

    public String getNome() {
        return nome;
    }

    public void setCorretor(Boolean corretor) {
        this.corretor = corretor;
    }

    public void setDataNasc(String dataNasc) {
        this.dataNasc = dataNasc;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
}
