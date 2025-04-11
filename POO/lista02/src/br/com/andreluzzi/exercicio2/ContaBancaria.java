package br.com.andreluzzi.exercicio2;

public class ContaBancaria {
    private String numerodaConta;
    private String titular;
    private double saldo; 

    public String getNumerodaConta() {
        return numerodaConta;
    }

    public void setNumerodaConta(String numerodaConta) {
        this.numerodaConta = numerodaConta;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    
}
