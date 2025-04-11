package br.com.andreluzzi.exercicio3;

public class Retangulo {
    double largura;
    double altura;

    double calcularArea(){
        return largura*altura;
    }

    double calcularPerimetro(){
        return 2*(largura+altura);
    }
}
