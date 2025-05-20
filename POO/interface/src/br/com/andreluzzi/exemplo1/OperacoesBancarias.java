package br.com.andreluzzi.exemplo1;

public interface OperacoesBancarias {

    void depositar(double quantia);
    void sacar(double quantia);
    double consultarSaldo();
    
}
