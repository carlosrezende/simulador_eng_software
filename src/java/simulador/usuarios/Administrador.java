package simulador.usuarios;

/**
 * @author Carlos Henrique
 */
public class Administrador extends Usuario {

    public Administrador() {

    }

    public Administrador(String nome, String matricula, String login, String senha, String cpf, int nivel) {
        super(nome, matricula, login, senha, cpf, nivel);
    }

}
