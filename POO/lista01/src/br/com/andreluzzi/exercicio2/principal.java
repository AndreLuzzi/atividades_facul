package br.com.andreluzzi.exercicio2;

public class principal {

    public static void main(String[] args) {
        ContaBancaria conta = new ContaBancaria();
        conta.titular = "João Silva";
        conta.saldo = 1000.00;
        conta.depositar(500);
        conta.sacar(300);
        conta.exibirSaldo();
    }
}
       
