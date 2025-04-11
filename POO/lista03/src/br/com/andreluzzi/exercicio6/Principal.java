package br.com.andreluzzi.exercicio6;

public class Principal {
    public static void main(String[] args) {
        Funcionario f1 = new Funcionario("Josefa");
        Funcionario f2 = new Funcionario("Klebin");
        Funcionario f3 = new Funcionario("Isabela");

        f1.exibirInfo();
        f2.exibirInfo();
        f3.exibirInfo();

        System.out.println("Total de funcionarios: " + Funcionario.totalFuncionarios);
    
    }
}
