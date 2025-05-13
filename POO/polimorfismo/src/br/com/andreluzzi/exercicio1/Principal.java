package br.com.andreluzzi.exercicio1;

public class Principal {
    public static void main(String[] args) {
        Gerente g = new Gerente();

        g.setNome("Erico");
        g.setSalarioBase(5000.0); 
        g.setBonus(3000.0);      

        System.out.println("Salario total do gerente " + g.getNome() + ": R$" + g.calcularSalarioTotal());
    }
}
