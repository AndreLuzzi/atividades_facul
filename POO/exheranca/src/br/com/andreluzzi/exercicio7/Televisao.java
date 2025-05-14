package br.com.andreluzzi.exercicio7;

public class Televisao extends Eletronico {
    int tamanhoTela;

    public Televisao(String marca, String modelo, int tamanhoTela) {
        super(marca, modelo);
        this.tamanhoTela = tamanhoTela;
    }

    @Override
    public void ligar() {
        System.out.println("TV de " + tamanhoTela + " polegadas da marca " + marca + " ligada");
    }
}
