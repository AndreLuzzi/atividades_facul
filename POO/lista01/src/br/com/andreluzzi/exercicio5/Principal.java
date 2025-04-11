package br.com.andreluzzi.exercicio5;

import java.util.Scanner;

public class Principal {
    public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    
    Aluno aluno = new Aluno();
        System.out.print("Digite o nome do aluno: ");
        aluno.nome = scanner.nextLine();
        System.out.print("Digite a idade do aluno: ");
        aluno.idade = scanner.nextInt();
        scanner.nextLine();
        System.out.print("Digite o número de matrícula do aluno: ");
        aluno.matricula = scanner.nextLine();
    
    Curso curso = new Curso();
        System.out.print("Digite o nome do curso: ");
        curso.nomeCurso = scanner.nextLine();
        System.out.print("Digite o codigo do curso: ");
        curso.codigoCurso = scanner.nextLine();
    
        System.out.println("\nInformacoes do Aluno:");
        aluno.exibirInformacoes();
        System.out.println("\nInformacoes do Curso:");
        curso.exibirCurso();
        scanner.close();
    }
}
