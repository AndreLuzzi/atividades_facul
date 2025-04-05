
package br.com.andreluzzi.heranca;

public class ContaBancario {
    private double saldo;

    public ContaBancario(double saldo) {
        this.saldo = saldo;
    }
    
    public void sacar(double valor) throws SaldoInsuficiente{
        if(valor > saldo){
            throw new SaldoInsuficiente("Erro: Saldo Insuficiente!");
        }
        saldo = saldo - valor;
        System.out.println("");
                
    }
    
    
}
