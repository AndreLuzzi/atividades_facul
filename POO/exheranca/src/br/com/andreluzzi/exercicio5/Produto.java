package br.com.andreluzzi.exercicio5;

public abstract class Produto {
    String nome;
    // abstract Produto(); // Erro: construtor não pode ser abstrato

    // Solução correta:
    public Produto() {
        // Construtor normal
    }
}