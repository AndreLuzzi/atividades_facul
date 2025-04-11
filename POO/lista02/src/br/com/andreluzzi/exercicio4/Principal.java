package br.com.andreluzzi.exercicio4;

public class Principal {
    public static void main(String[] args) {
        Livro l1 = new Livro();
        l1.titulo = "As aventura de Klebinho";
        l1.autor = "Klebinho";
        l1.anoPublicacao = 2025;

        Livro l2 = new Livro();
        l2.titulo = "A ida dos que nao foram";
        l2.autor = "Jack Chan";
        l2.anoPublicacao = 1999;

        Livro l3 = new Livro();
        l3.titulo = "O surdo que ouvia";
        l3.autor "Orlando";
        l3.anoPublicacao = 2003;

        l1.informacoes();
        l2.informacoes();
        l3.informacoes();
    }
}
