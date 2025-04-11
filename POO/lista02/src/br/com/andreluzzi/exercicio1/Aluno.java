package br.com.andreluzzi.exercicio1;

public class Aluno {
    String nome;
    int idade;
    String matricula;

    public Aluno(String nome, int idade, String matricula) {
        this.nome = nome;
        this.idade = idade;
        this.matricula = matricula;
    }

    void informacoes() {
        System.out.println("Nome: " + nome);
        System.out.println("Idade: " + idade);
        System.out.println("Matricula: " + matricula);
    }
    
}
