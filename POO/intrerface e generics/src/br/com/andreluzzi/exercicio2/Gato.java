package br.com.andreluzzi.exercicio2;

public class Gato implements Animal {

    @Override
    public void emitirSom() {
        System.out.println("Miauu Miauu");
    }

    @Override
    public void mover() {
        System.out.println("O gato vai comecar a pular");
    }

}
