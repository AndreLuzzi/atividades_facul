package br.com.andreluzzi.exercicio4;

public class Principal {

    public static void executarInstrumento(InstrumentoMusical instrumento) {
        instrumento.afinar();
        instrumento.tocar();
    }

    public static void main(String[] args) {
        InstrumentoMusical violao = new Violao();
        InstrumentoMusical piano = new Piano();
        InstrumentoMusical flauta = new Flauta();

        System.out.println("--- Violao ---");
        executarInstrumento(violao);

        System.out.println("\n--- Piano ---");
        executarInstrumento(piano);

        System.out.println("\n--- Flauta ---");
        executarInstrumento(flauta);
    }
}
