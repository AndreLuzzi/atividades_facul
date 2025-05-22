package br.com.andreluzzi.exercicio2;

public class Cachorro implements Animal {

    @Override
    public void emitirSom() {
        System.out.println("Au Au");
    }

    @Override
    publci void mover() {
        System.out.println("O cachorro vai comecar a correr");
    }
}
