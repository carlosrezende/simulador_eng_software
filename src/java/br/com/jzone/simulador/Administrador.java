package br.com.jzone.simulador;
/**
 *
 * @author Alenxadre Andrade
 */
public class Administrador extends Usuario {
    
    public Administrador(String nome, String sobrenome, String cpf, String login, String senha) {
        super(nome, sobrenome, cpf, login, senha);
    }
    
    public boolean cadastrarUsuario(String nome, String matricula, String user, String pass, String cpf){
    
        Usuario newUser = new Usuario(nome, matricula, user, pass, cpf);
        
        

        return false;
    }
    
    public boolean cadastrarInvt(){
        return false;
    }
    
}
