package br.com.andreluzzi.exercicio4;

public class Piano implements InstrumentoMusical {
    @Override
    public void tocar() {
        System.out.println("Tocando piano com melodia clássica.");
    }

    @Override
    public void afinar() {
        System.out.println("Afinando o piano com ajuda de um profissional.");
    }
}
