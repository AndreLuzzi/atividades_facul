package br.com.andreluzzi.exercicio2;

public class Principal {
    public static void main(String[] args) {
        Cachorro dog = new Cachorro();
        dog.setNome("Rex");
        dog.setIdade(5);
        dog.comer();
        dog.latir();
    }
}
