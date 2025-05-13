package br.com.andreluzzi.exercicio2;

public class Principal {
    public static void main(String[] args) {
        Animal a1 = new Cachorro("Rex", "Labrador");
        a1.emitirSom();

        Animal a2 = new Gato("Mimi", "Branca");
        a2.emitirSom();
    }
}
