package br.com.andreluzzi.exercicio1;

public class Principal {
    public static void main(String[] args) {
        Produto produto1 = new Produto();
        Produto produto2 = new Produto("Celular", 2650.00, 3);

        produto1.exibirDetalhes();
        produto2.exibirDetalhes();
    }
        
}
