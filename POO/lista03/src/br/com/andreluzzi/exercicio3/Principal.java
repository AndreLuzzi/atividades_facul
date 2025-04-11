package br.com.andreluzzi.exercicio3;

public class Principal {
    public static void main(String[] args) {
        Calculadora calc = new Calculadora();
        System.out.println("Soma (int, int): " + calc.somar(124, 36));
        System.out.println("Soma (double, double): " + calc.somar(8.9, 7.6));
        System.out.println("Soma (int, int, int): " + calc.somar(102, 34, 68));
    }
}
