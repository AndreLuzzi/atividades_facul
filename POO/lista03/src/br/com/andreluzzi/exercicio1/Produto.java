package br.com.andreluzzi.exercicio1;

public class Produto {
    String nome;
    double preco;
    int quantidade;
    
    public Produto() {
    }
    
    public Produto(String nome, double preco, int quantidade) {
        this.nome = nome;
        this.preco = preco;
        this.quantidade = quantidade;
    }

    void exibirDetalhes() {
        System.out.println("Nome: " + nome);
        System.out.println("Preço: R$ " + preco);
        System.out.println("Quantidade: " + quantidade);
    }
}
