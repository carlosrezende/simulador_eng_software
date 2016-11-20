package db;

/**
 * @author Carlos Henrique
 */
public class IsValidInv {

    private String message;

    public boolean isValid(String nome, String valorMin, String taxa) {

        /*o nome não pode ser vazio*/
        if (nome.length() < 1) {
            message = "O nome não pode ficar vazio.";
            return false;
        }

        /*trocar as vírgulas por pontos*/
        valorMin = valorMin.replaceFirst(",", ".");
        taxa = taxa.replaceFirst(",", ".");

        /*verificar se o usuário digitou números*/
        Double VALORMIN, TAXA;
        try {
            VALORMIN = Double.parseDouble(valorMin);
        } catch (NumberFormatException e) {
            message = "O valor mínimo não é válido.";
            return false;
        }
        try {
            TAXA = Double.parseDouble(taxa);
        } catch (NumberFormatException e) {
            message = "A taxa digitada não é válida.";
            return false;
        }

        if (VALORMIN.compareTo(0.0) <= 0) {
            message = "O valor mínimo deve ser maior que zero.";
            return false;
        }

        if (TAXA.compareTo(0.0) <= 0) {
            message = "A taxa deve ser maior que zero.";
            return false;
        }

        return true;
    }

    public String getMessage() {
        return message;
    }

}
