package br.com.andreluzzi.exercicio2;

public class Passaro implements Animal{
    
    @Override
    public void emitirSom() {
        System.out.println("Piuu Piuu");
    }

    @Override
    public void mover() {
        System.out.println("A passaro vai comecar a voar");
    }
}
