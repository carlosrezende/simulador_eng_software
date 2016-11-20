package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import users.Usuario;

/**
 * @author Carlos Henrique
 */
public class DaoUser {

    // conexão com o banco de dados
    private Connection connection;

    public DaoUser() {
        try {
            this.connection = new ConnectionFactory().getConnection();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    // adiciona um objeto ao banco
    public void insert(Usuario usuario) {

        String sql = "insert into usuarios "
                + "(nome,matricula,login,senha,cpf,nivel)"
                + " values (?,?,?,?,?,?)";

        try {
            // prepared statement para inserção
            PreparedStatement ps = connection.prepareStatement(sql);

            // setar os valores
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getMatricula());
            ps.setString(3, usuario.getLogin());
            ps.setString(4, usuario.getSenha());
            ps.setString(5, usuario.getCpf());
            ps.setInt(6, 2); //o nível de usuário sempre é 2

            //executar o statement
            ps.execute();

            //fechar o statement
            ps.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean alreadyExistsLogin(String login) {

        String sql = "select nivel from usuarios where login='" + login + "'";
        int level = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                level = rs.getInt(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        /*se level for igual a 2, será retornado true*/
        return level == 2;
    }

    public boolean alreadyExistsCpf(String cpf) {

        String sql = "select nivel from usuarios where cpf='" + cpf + "'";
        int level = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                level = rs.getInt(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        /*se level for igual a 2, será retornado true*/
        return level == 2;
    }

    public boolean alreadyExistsMat(String mat) {

        String sql = "select nivel from usuarios where matricula='" + mat + "'";
        int level = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                level = rs.getInt(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        /*se level for igual a 2, será retornado true*/
        return level == 2;
    }

    public void closeConnection() {
        try {
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
