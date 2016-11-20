package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import business_rules.Investimento;

/**
 * @author Carlos Henrique
 */
public class DaoInv {

    // a conexão com o banco de dados
    private Connection connection;

    public DaoInv() throws ClassNotFoundException {
        this.connection = new ConnectionFactory().getConnection();
    }

    // adiciona um objeto ao banco
    public void insert(Investimento inv) {

        String sql = "insert into investimentos "
                + "(nome,valor,valor_minimo,taxa,tempo)"
                + " values (?,?,?,?,?)";
        try {
            // prepared statement para inserção
            PreparedStatement stmt = connection.prepareStatement(sql);

            // setar os valores
            stmt.setString(1, inv.getNome());
            stmt.setDouble(2, inv.getValor());
            stmt.setDouble(3, inv.getValor_minimo());
            stmt.setDouble(4, inv.getTaxa());
            stmt.setInt(5, inv.getTempo());

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

    public List<Investimento> getList() {
        try {
            List<Investimento> investimentos = new ArrayList<Investimento>();
            PreparedStatement stmt = this.connection.
                    prepareStatement("select * from investimentos");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // criando o objeto Investimento

                Investimento inv = new Investimento();

                inv.setId(rs.getInt("id"));
                inv.setNome(rs.getString("nome"));
                inv.setValor(rs.getDouble("valor"));
                inv.setValor_minimo(rs.getDouble("valor_minimo"));
                inv.setTaxa(rs.getDouble("taxa"));
                inv.setTempo(rs.getInt("tempo"));

                // adicionando o objeto à lista
                investimentos.add(inv);
            }
            rs.close();
            stmt.close();
            return investimentos;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Investimento getInvById(int id) {

        List<Investimento> list = this.getList();
        try {
            for (Investimento investimento : list) {
                if (investimento.getId() == id) {
                    return investimento;
                }
            }
        } catch (Exception e) {

        }

        return null;
    }

    public boolean updateTaxa(Integer id, Double taxa) {
        String sql = "update investimentos set taxa=? where id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setDouble(1, taxa);
            stmt.setInt(2, id);

            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            // throw new RuntimeException(e);
            return false;
        }
        return true;
    }
}
