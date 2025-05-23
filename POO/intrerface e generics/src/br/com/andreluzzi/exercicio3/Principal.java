package br.com.andreluzzi.exercicio3;

public class Principal {
    public static void main(String[] args) {
        Funcionario engenheiro = new Engenheiro(8500.00);
        Funcionario vendedor = new Vendedor(4000.00);

        System.out.println("--- Engenheiro ---");
        engenheiro.trabalhar();
        engenheiro.descansar();
        System.out.println("Salário: R$" + engenheiro.getSalario());

        System.out.println("\n--- Vendedor ---");
        vendedor.trabalhar();
        vendedor.descansar();
        System.out.println("Salário: R$" + vendedor.getSalario());
    }
}
