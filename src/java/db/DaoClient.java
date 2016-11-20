package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import users.Cliente;

/**
 * @author Carlos Henrique
 */
public class DaoClient {

    // a conexão com o banco de dados
    private Connection connection;

    public DaoClient() throws ClassNotFoundException {
        this.connection = new ConnectionFactory().getConnection();
    }

    // adiciona um objeto ao banco
    public void insert(Cliente cliente) {

        String sql = "insert into clientes "
                + "(nome,matricula,login,senha,cpf,nivel)"
                + " values (?,?,?,?,?,?)";

        try {
            // prepared statement para inserção
            PreparedStatement stmt = connection.prepareStatement(sql);

            // setar os valores
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getMatricula());
            stmt.setString(3, cliente.getLogin());
            stmt.setString(4, cliente.getSenha());
            stmt.setString(5, cliente.getCpf());
            stmt.setInt(6, 1); //o nível de cliente é 1

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
