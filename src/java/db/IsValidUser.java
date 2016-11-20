package db;

import users.Usuario;

/**
 * @author Carlos Henrique Rezende Santos
 */
public class IsValidUser {

    private String message;

    public boolean isValid(Usuario user) {

        String nome, matricula, login, senha, cpf;

        nome = user.getNome();
        matricula = user.getMatricula();
        login = user.getLogin();
        senha = user.getSenha();
        cpf = user.getCpf();

        if (nome.equals("")) {
            message = "O nome não pode ser vazio!";
            return false;
        }
        if (matricula.equals("")) {
            message = "A matrícula não pode ser vazia!";
            return false;
        }
        if (login.equals("")) {
            message = "O login não pode ser vazio!";
            return false;
        }
        if (senha.equals("")) {
            message = "A senha não pode ser vazia!";
            return false;
        }
        if (cpf.equals("")) {
            message = "O cpf não pode ser vazio!";
            return false;
        }
        if (nome.length() > 100) {
            message = "O nome não pode ter mais de 100 caracteres.";
            return false;
        }
        if (matricula.length() > 50) {
            message = "A matrícula não pode ter mais de 100 caracteres.";
            return false;
        }
        if (login.length() > 50) {
            message = "O login não pode ter mais de 50 caracteres.";
            return false;
        }
        if (senha.length() > 50) {
            message = "A senha não pode ter mais de 50 caracteres.";
            return false;
        }
        if (cpf.length() > 11) {
            message = "O cpf não pode ter mais de 11 caracteres.\nInsira apenas os 9 números do cpf.";
            return false;
        }
        if (!IsValidCpf.isValidCPF(cpf)) {
            message = "O cpf digitado não é válido.";
            return false;
        }

        /*verificar se já existe cpf, login ou matrícula igual no banco.*/
        DaoUser dao = new DaoUser();
        try {

            if (dao.alreadyExistsCpf(cpf)) {
                message = "O cpf digitado pertence a outro usuário do nosso sistema.";
                dao.closeConnection();
                return false;

            }
            if (dao.alreadyExistsMat(matricula)) {
                message = "A matrícula digitada pertence a outro usuário do nosso sistema.";
                dao.closeConnection();
                return false;

            }
            if (dao.alreadyExistsLogin(login)) {
                message = "O login digitado pertence a outro usuário do nosso sistema.";
                dao.closeConnection();
                return false;

            }
            dao.insert(user);
            dao.closeConnection();

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            dao.closeConnection();
        }

        message = "O Usuário foi cadastrado com sucesso.";

        return true;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

}
