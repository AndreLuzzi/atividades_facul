package br.com.andreluzzi.exercicio5;

import java.util.Scanner;

public class Principal {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numero;
        do {
            System.out.print("Digite um número natural (>=1) para calcular a tabuada: ");
            numero = scanner.nextInt();
        } while (numero < 1);

        Tabuada tabuada = new Tabuada();
        tabuada.numero = numero;
        tabuada.calcularTabuada();
        
        scanner.close();
    }
}
