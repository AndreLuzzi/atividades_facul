package br.com.andreluzzi.exercicio2;

class Gato extends Animal {
    String cor;

    public Gato(String nome, String cor) {
        super(nome);
        this.cor = cor;
    }

    @Override
    public void emitirSom() {
        System.out.println("Miau!");
    }
}z
