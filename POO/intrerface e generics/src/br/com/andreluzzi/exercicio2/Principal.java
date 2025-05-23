package br.com.andreluzzi.exercicio2;

public class Principal {
    public static void main(String[] args) {
        Animal cachorro = new Cachorro();
        Animal gato = new Gato();
        Animal passaro = new Passaro();

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
