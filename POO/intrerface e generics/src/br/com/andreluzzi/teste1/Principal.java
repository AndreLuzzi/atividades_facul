package br.com.andreluzzi.teste1;

public class Principal {
    public static void main(String[] args) {
        Gato gato = new Gato();
        gato.setIdade(22);
        gato.setNome("Andre");

        System.out.println("Nome: " + gato.getNome());
        System.out.println("Idade: " + gato.getIdade());
    }
}
