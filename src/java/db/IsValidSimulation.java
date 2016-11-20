package db;

import business_rules.Investimento;
import java.util.List;

/**
 * @author Carlos Henrique
 */
public class IsValidSimulation {

    private String message;
    private Investimento investment;

    public IsValidSimulation() {
        message = "";
        investment = null;
    }

    public boolean isValid(String id, String value, String time) throws ClassNotFoundException {

        /*substituir vírgulas por pontos*/
        value = value.replaceFirst(",", ".");

        /*talvez o usuário digitou F12 e alterou os campos value do combo box*/
        int ID;
        try {
            ID = Integer.parseInt(id);
        } catch (Exception e) {
            message = "Ocorreu um erro. Atualize a página e tente novamente.";
            return false;
        }

        Double VALUE;
        Integer TIME;
        try {
            VALUE = Double.parseDouble(value);
        } catch (Exception e) {
            message = "O valor digitado é inválido.";
            return false;
        }
        try {
            TIME = Integer.parseInt(time);
        } catch (Exception e) {
            message = "O tempo digitado é inválido.\nExemplo de digitação correta: 12 = 12 meses.";
            return false;
        }

        if (TIME.compareTo(0) <= 0) {
            message = "O tempo deve ser maior que zero.";
            return false;
        }

        DaoInv dao = new DaoInv();
        investment = dao.getInvById(ID);
        dao.closeConnection();

        /*talvez o usuário digitou F12 e alterou os values do combo box*/
        if (investment == null) {
            message = "Ocorreu um erro. Atualize a página e tente novamente.";
            return false;
        }

        if (VALUE.compareTo(investment.getValor_minimo()) < 0) {
            message = "O valor deve ser maior ou igual ao valor mínimo.";
            return false;
        }

        investment.setValor(VALUE);
        investment.setTempo(TIME);
        return true;
    }

    public String getMessage() {
        return message;
    }

    public Investimento getInvestment() {
        return investment;
    }

}
