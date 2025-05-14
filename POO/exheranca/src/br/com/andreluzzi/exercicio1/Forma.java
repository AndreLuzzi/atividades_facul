package br.com.andreluzzi.exercicio1;

public abstract class Forma {
    public abstract double calcularArea();

    @Override
    public String toString() {
        return "Area da forma: " + calcularArea();
    }
}

