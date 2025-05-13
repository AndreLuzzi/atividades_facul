package br.com.andreluzzi.exercicio1;

abstract class Forma {
    public abstract double calcularArea();

    @Override
    public String toString() {
        return "Área da forma: " + calcularArea();
    }
}

