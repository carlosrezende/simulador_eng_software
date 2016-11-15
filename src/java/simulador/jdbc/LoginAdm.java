package simulador.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Carlos Henrique
 */
public class LoginAdm {

    String driver;
    String url;
    String uss;
    String contra;

    public LoginAdm() {
        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost/simulador";
        uss = "root";
        contra = "root";
    }

    public int loguear(String us, String pass) {

        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        int nivel = 0;
        String sql = "select nivel from admins where login='" + us + "' and senha='" + pass + "'";
        try {
            Class.forName(this.driver);
            conn = DriverManager.getConnection(this.url, this.uss, this.contra);
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                nivel = rs.getInt(1);
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return nivel;
    }
}
