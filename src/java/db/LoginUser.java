package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Carlos Henrique
 */
public class LoginUser {

    String driver;
    String url;
    String user;
    String password;

    public LoginUser() {
        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost/simulador";
        user = "root";
        password = "root";
    }

    public int login(String user, String password) {

        Connection connection;
        PreparedStatement ps;
        ResultSet rs;
        int nivel = 0;
        String sql = "select nivel from usuarios where login='" + user + "' and senha='" + password + "'";

        try {
            Class.forName(this.driver);
            connection = DriverManager.getConnection(this.url, this.user, this.password);
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                nivel = rs.getInt(1);
            }
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return nivel;
    }
}
