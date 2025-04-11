package br.com.andreluzzi.exercicio4;

public class Livro {
    String titulo;
    String autor;
    int anoPublicacao;

    void informacoes(){
        System.out.println("Titulo: " + titulo);
        System.out.println("Autor: " + autor);
        System.out.println("Publicado em: " + anoPublicacao);
    }
}
