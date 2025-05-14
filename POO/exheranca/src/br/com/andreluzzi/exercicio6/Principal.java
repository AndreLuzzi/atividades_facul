package br.com.andreluzzi.exercicio6;

public class Principal {
    public static void main(String[] args) {
        Professor p = new Professor("Joao", 45, "Matematica");
        Aluno a = new Aluno("Maria", 20, "Engenharia");

        p.apresentar();
        a.apresentar();
    }
}
