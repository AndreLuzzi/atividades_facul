package br.com.andreluzzi.exemplo;

public class Pessoa {

    public String nome;

    public int idade;

    public void falar(){
        System.out.println(this.nome + "está falando.");
        System.out.println(this.nome + "tem "+ this.idade + " anos.");
    }
}
