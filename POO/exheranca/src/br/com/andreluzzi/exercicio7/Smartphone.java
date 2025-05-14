package br.com.andreluzzi.exercicio7;

public class Smartphone extends Eletronico {
    String sistemaOperacional;

    public Smartphone(String marca, String modelo, String sistemaOperacional) {
        super(marca, modelo);
        this.sistemaOperacional = sistemaOperacional;
    }

    @Override
    public void ligar() {
        System.out.println("Smartphone da marca " + marca + " ligado com sistema " + sistemaOperacional);
    }
}