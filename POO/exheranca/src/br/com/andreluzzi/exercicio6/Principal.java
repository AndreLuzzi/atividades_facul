package br.com.andreluzzi.exercicio6;

public public class Principal {
    public static void main(String[] args) {
        Professor p = new Professor("João", 45, "Matemática");
        Aluno a = new Aluno("Maria", 20, "Engenharia");

        p.apresentar();
        a.apresentar();
    }
}
