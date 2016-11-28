package business_rules;

import java.text.DecimalFormat;

/**
 * @author Carlos Henrique
 */
public class Investimento {

    private int id;
    private String nome;
    private double valor;
    private double valor_minimo;
    private double taxa;
    private int tempo; //meses

    public Investimento() {

    }

    public Investimento(String nome, double valor, double valor_minimo, double taxa, int tempo) {
        this.nome = nome;
        this.valor = valor;
        this.valor_minimo = valor_minimo;
        this.taxa = taxa;
        this.tempo = tempo;
    }

    public double getValorTotal() {
        return calcularMensal();
    }

    private double calcularMensal() {

        double lucroPrimeiroMes = valor * (taxa / 100.0);
        double lucro = lucroPrimeiroMes + valor;

        for (int i = 1; i < tempo; i++) {
            lucro = lucro + (lucro * (taxa / 100.0));
        }

        DecimalFormat df = new DecimalFormat("0.##");
        String dx = df.format(lucro);

        dx = dx.replaceAll(",", ".");

        Double LUCRO = Double.parseDouble(dx);

        return LUCRO;

    }

    public String getValorTotalString() {
        String temp = Double.toString(this.getValorTotal());
        temp = temp.replace(".", ",");
        return temp;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the valor
     */
    public double getValor() {
        return valor;
    }

    public String getValorString() {
        String temp = Double.toString(this.getValor());
        temp = temp.replace(".", ",");
        return temp;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(double valor) {
        this.valor = valor;
    }

    /**
     * @return the valor_minimo
     */
    public double getValor_minimo() {
        return valor_minimo;
    }

    /**
     * @param valor_minimo the valor_minimo to set
     */
    public void setValor_minimo(double valor_minimo) {
        this.valor_minimo = valor_minimo;
    }

    /**
     * @return the taxa
     */
    public double getTaxa() {
        return taxa;
    }

    /**
     * @param taxa the taxa to set
     */
    public void setTaxa(double taxa) {
        this.taxa = taxa;
    }

    /**
     * @return the tempo
     */
    public int getTempo() {
        return tempo;
    }

    /**
     * @param tempo the tempo to set
     */
    public void setTempo(int tempo) {
        this.tempo = tempo;
    }

}
