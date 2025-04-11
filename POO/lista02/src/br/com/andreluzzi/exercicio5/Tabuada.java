package br.com.andreluzzi.exercicio5;

public class Tabuada {
    int numero;

    void calcularTabuada() {
        System.out.println("Tabuada do " + numero + ":");
        for (int i = 1; i <= 10; i++) {
        
            System.out.println(numero + " x " + i + " = " + (numero * i));
        }
    }
}
