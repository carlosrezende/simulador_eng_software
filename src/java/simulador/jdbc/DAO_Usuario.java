package simulador.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import simulador.usuarios.Usuario;

/**
 * @author Carlos Henrique
 */
public class DAO_Usuario {

    // a conexão com o banco de dados
    private Connection connection;

    public DAO_Usuario() throws ClassNotFoundException {
        this.connection = new ConnectionFactory().getConnection();
    }

    // adiciona um objeto ao banco
    public void insert(Usuario usuario) {

        String sql = "insert into usuarios "
                + "(nome,matricula,login,senha,cpf,nivel)"
                + " values (?,?,?,?,?,?)";

        try {
            // prepared statement para inserção
            PreparedStatement stmt = connection.prepareStatement(sql);

            // setar os valores
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getMatricula());
            stmt.setString(3, usuario.getLogin());
            stmt.setString(4, usuario.getSenha());
            stmt.setString(5, usuario.getCpf());
            stmt.setInt(6, 2); //o nível de usuário sempre é 2

            //executar o statement
            stmt.execute();

            //fechar o statement
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void closeConnection() {
        try {
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
