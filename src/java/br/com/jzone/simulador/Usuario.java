package br.com.jzone.simulador;

/**
 *
 * @author Alenxadre Andrade
 */
public class Usuario {

    private String nome;
    private String matricula;
    private String user;
    private String pass;
    private String cpf;

    public Usuario(String nome, String matricula, String user, String pass, String cpf) {
        this.nome = nome;
        this.matricula = matricula;
        this.user = user;
        this.pass = pass;
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

}
