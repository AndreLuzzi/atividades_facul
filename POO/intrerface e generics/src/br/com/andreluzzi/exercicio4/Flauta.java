package br.com.andreluzzi.exercicio4;

public class Flauta implements InstrumentoMusical {
    @Override
    public void tocar() {
        System.out.println("Tocando flauta com notas suaves.");
    }

    @Override
    public void afinar() {
        System.out.println("Afinando a flauta ajustando o tubo.");
    }
}
