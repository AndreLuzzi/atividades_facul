package br.com.andreluzzi.exercicio6;

public class Funcionario {
    String nome;
    static int totalFuncionarios = 0;

    Funcionario(String nome) {
        this.nome = nome;
        totalFuncionarios++;
    }

    void exibirInfo() {
        System.out.println("Nome: " + nome);
    }
}

