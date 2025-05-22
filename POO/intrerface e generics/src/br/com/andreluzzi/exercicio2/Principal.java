package br.com.andreluzzi.exercicio2;

public class Principal {
    public static void main(String[] args) {
        Animal cachorro = new cachorro();
        Animal gato = new gato();
        Animal passaro = new passaro();

        System.out.println("----Cachorro----");
        cachorro.emitirSom();
        cachorro.mover();
        
        System.out.println("----Gato----");
        gato.emitirSom();
        gato.mover();
        
        System.out.println("----Pasaro----");
        passaro.emitirSom();
        passaro.mover();
    }

}
