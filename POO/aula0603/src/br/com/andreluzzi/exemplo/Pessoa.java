package br.com.andreluzzi.exemplo;

public class Pessoa {

    public String nome;

    public int idade;

    public Pessoa(){
        System.out.println("Estou criando uma pessoa");
    }

    public Pessoa(String nomeVindoPorParametro){
        this.nome = nomeVindoPorParametro;
    }

    public void falar(){
        System.out.println(this.nome + " esta falando.");
        System.out.println(this.nome + " tem "+ this.idade + " anos.");
    }
}
