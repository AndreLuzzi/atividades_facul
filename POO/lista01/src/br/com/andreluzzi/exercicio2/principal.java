package br.com.andreluzzi.exercicio2;

public class Principal {

    public static void main(String[] args) {
        ContaBancaria conta = new ContaBancaria();
        conta.titular = "Clovis";
        conta.saldo = 500.00;
        conta.depositar(500);
        conta.sacar(100);
        conta.exibirSaldo();
    }
}
       
