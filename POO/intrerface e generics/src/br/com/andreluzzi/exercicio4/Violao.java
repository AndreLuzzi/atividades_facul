package br.com.andreluzzi.exercicio4;

public class Violao implements InstrumentoMusical {
    @Override
    public void tocar() {
        System.out.println("Tocando violão com acordes suaves.");
    }

    @Override
    public void afinar() {
        System.out.println("Afinando o violão com afinador eletrônico.");
    }
}
