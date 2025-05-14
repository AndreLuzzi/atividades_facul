package br.com.andreluzzi.exercicio1;

public class Principal {
    public static void main(String[] args) {
        Forma c = new Circulo(5);
        System.out.println(c);

        Forma t = new Triangulo(4, 3);
        System.out.println(t);

        Forma r = new Retangulo(4, 4); // quadrado
        System.out.println(r);
    }
}