package br.com.andreluzzi.exerciciop2;

public class PrincipalAluno {

    public static void main(String[] args) {

        Aluno a1 = new Aluno();

        a1.nome = "Leonardo";
        a1.idade = 24;
        a1.matricula = 12345;
        
        System.out.println("Nome " + a1.nome);
        System.out.println("idade " + a1.idade);
        System.out.println("matricula " + a1.matricula);
    }
}
