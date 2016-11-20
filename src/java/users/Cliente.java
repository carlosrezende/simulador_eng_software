package users;

/**
 * @author Carlos Henrique
 */
public class Cliente extends Usuario {

    public Cliente() {

    }

    public Cliente(String nome, String matricula, String login, String senha, String cpf, int nivel) {
        super(nome, matricula, login, senha, cpf, nivel);
    }
}
