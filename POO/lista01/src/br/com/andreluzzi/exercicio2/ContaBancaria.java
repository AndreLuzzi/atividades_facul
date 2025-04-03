package br.com.andreluzzi.exercicio2;

public class ContaBancaria {
    String titular;
    float saldo;

    void depositar(double valor){
        saldo += valor;
    }

    void sacar(double valor){
        if (saldo >= valor) {
            saldo -= valor;
        } else {
            System.out.println("Saldo insuficiente!");
        }
    }

    void exibirSaldo(){
        System.out.println("Bem vindo: " + titular);
        System.out.println("Seu daldo atual: R$ " + saldo);
    }
}
