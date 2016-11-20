package db;

/**
 * @author Carlos Henrique
 */
public class IsValidChange {

    private String message;
    private Integer ID;
    private Double TAXA;

    public boolean isValid(String id, String taxa) {

        try {
            ID = Integer.parseInt(id);
        } catch (Exception e) {
            message = "Ocorreu um erro. Atualize a página e tente novamente.";
            return false;
        }

        try {
            taxa = taxa.replace(",", ".");
            TAXA = Double.parseDouble(taxa);
        } catch (Exception e) {
            message = "A nova taxa é inválida.";
            return false;
        }

        if (getTAXA().compareTo(0.0) <= 0) {
            message = "A taxa deve ser um número positivo.";
            return false;
        }

        return true;
    }

    public String getMessage() {
        return message;
    }

    public Integer getID() {
        return ID;
    }

    public Double getTAXA() {
        return TAXA;
    }

}
