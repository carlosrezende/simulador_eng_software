package br.com.jzone.simulador;

/**
 *
 * @author Alenxadre Andrade
 */
public class Investimento {
    
    private String nome;
    private double valor;
    private double[] taxa;
    private int tempo;

    public Investimento(String nome, double valor, double[] taxa, int tempo) {
        this.nome = nome;
        this.valor = valor;
        this.taxa = taxa;
        this.tempo = tempo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public double[] getTaxa() {
        return taxa;
    }

    public void setTaxa(double[] taxa) {
        this.taxa = taxa;
    }

    public int getTempo() {
        return tempo;
    }

    public void setTempo(int tempo) {
        this.tempo = tempo;
    }  
    
    public boolean cadastrarTipoInvest(){
        return false;
    }
    
    public boolean cadastrarTaxa(){
        return false;
    }
    
    // By: Carlos
    // Novas funções para testar lucro do investimento
    public double lucroInvestimento(Investimento inv){       
        return 0;
    }

    public boolean excluirInvestimento() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean alterarInvestimento() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean cadastrarInvestimento() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
