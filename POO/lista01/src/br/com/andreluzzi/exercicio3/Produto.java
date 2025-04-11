package br.com.andreluzzi.exercicio3;

public class Produto {
    String nome;
    double preco;
    int estoque;

    void vender(int quantidade){
        if (estoque >= quantidade) {
            estoque -= quantidade;
        } else {
            System.out.println("O estoque é insuficiente");
        }
    }

    void reporEstoque(int quantidade){
        estoque += quantidade;
    }

    void exibirDetalhes(){
        System.out.println("Nome do Produto: " + nome);
        System.out.println("Seu Preco: R$ " + preco);
        System.out.println("Quantidade em Estoque: " + estoque);
    }
}
