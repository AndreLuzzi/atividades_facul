package br.com.andreluzzi.exerciciop2;

public class ContaBancaria {

    private String numeroDaConta;
    private String titular;
    private double saldo;

    // Método getter para o número da conta
    public String getNumeroDaConta() {
        return numeroDaConta;
    }

    // Método setter para o número da conta
    public void setNumeroDaConta(String numeroDaConta) {
        this.numeroDaConta = numeroDaConta;
    }

    // Método getter para o titular
    public String getTitular() {
        return titular;
    }

    // Método setter para o titular
    public void setTitular(String titular) {
        this.titular = titular;
    }

    // Método getter para o saldo
    public double getSaldo() {
        return saldo;
    }

    // Método setter para o saldo
    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
}
