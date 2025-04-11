package br.com.andreluzzi.exercicio4;

public class Principal {
    public static void main(String[] args) {
        Retangulo retangulo = new Retangulo();
        retangulo.largura = 7;
        retangulo.altura = 5;
    
        System.out.println("Sua Area: " + retangulo.calcularArea());
        System.out.println("Seu Perimetro: " + retangulo.calcularPerimetro());
    }
}
