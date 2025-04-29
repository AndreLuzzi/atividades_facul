package br.com.andreluzzi.exercicio3;

public class Principal {
    public static void main(String[] args) {
        Professor prof = new Professor();
        prof.idade = 27;
        prof.nome = "Josephe";
        prof.salario = 1200;
        prof.ensinar();

        Aluno aluno = new Aluno();
        aluno.nome = "Charles";
        aluno.idade = 12;
        aluno.matricula = 1234;
        aluno.estudar();
    }
}
