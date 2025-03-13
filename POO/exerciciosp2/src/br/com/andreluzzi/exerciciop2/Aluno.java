package br.com.andreluzzi.exerciciop2;

public class Aluno {

    public String nome;

    public int idade;

    public int matricula;

    public Aluno(){
        System.out.println("Essas sao as informacoes do aluno: ");
    }

    public void informacoes(){
        System.out.println("O aluno e: " + this.nome );
        System.out.println(this.nome + "tem " + this.idade);
        System.out.println("O numero da matricula e: " + this.matricula);
    }

}
