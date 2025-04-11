package br.com.andreluzzi.exercicio3;

public class Principal {
    public static void main(String[] args) {
    Produto produto = new Produto();
    produto.nome = "Notebook";
    produto.preco = 4000.00;
    produto.estoque = 15;
    
    produto.vender(3);
    produto.reporEstoque(5);
    produto.exibirDetalhes();
    }
    }
