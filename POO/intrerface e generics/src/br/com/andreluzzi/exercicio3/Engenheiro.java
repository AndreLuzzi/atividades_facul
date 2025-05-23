package br.com.andreluzzi.exercicio3;

public class Engenheiro extends Funcionario {
    public Engenheiro(double salario) {
        super(salario);
    }

    @Override
    public void trabalhar() {
        System.out.println("O engenheiro está desenvolvendo projetos.");
    }

    @Override
    public void descansar() {
        System.out.println("O engenheiro está descansando após o expediente.");
    }
}
