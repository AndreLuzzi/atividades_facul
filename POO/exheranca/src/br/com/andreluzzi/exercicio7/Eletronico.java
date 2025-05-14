package br.com.andreluzzi.exercicio7;

public abstract class Eletronico {
    String marca;
    String modelo;

    public Eletronico(String marca, String modelo) {
        this.marca = marca;
        this.modelo = modelo;
    }

    public abstract void ligar();
}
