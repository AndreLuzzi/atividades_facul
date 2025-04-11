package br.com.andreluzzi.exercicio4;

public class Aluno {
    String nome;
    double nota;

    Aluno(String nome, double nota) {
        this.nome = nome;
        this.nota = nota;
    }

    void exibirInfo() {
        System.out.println("Nome do Aluno: " + this.nome);
        System.out.println("Sua Nota: " + this.nota);
    }
}
