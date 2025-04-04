package br.com.andreluzzi.exercicio3;

public class Produto {
    String nome;
    double preco;
    int quantidadeEmEstoque;

    void vender(int quantidade){
        if (quantidadeEmEstoque >= quantidade) {
            quantidadeEmEstoque -= quantidade;
        } else {
            System.out.println("Estoque Insuficiente");
        }
    }

    void reporEstoque(int quantidade){
        quantidadeEmEstoque += quantidade;
    }

    void exibirDetalhes(){
        
    }

}
