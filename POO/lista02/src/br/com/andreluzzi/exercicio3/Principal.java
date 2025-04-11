package br.com.andreluzzi.exercicio3;

public class Principal {
    public static void main(String[] args) {
        Retangulo retangulo = new Retangulo();
        retangulo.altura = 7;
        retangulo.largura = 10;

        System.out.println("Sua Area: " + retangulo.calcularArea());
        System.out.println("E seu Perimetro: " + retangulo.calcularPerimetro());
    }
}
