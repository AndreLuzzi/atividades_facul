package br.com.andreluzzi.exercicio1;

public class principal {
    public static void main(String[] args) {
        Carro meuCarro = new Carro();
        meuCarro.marca = "Toyota";
        meuCarro.modelo = "Corolla";
        meuCarro.ano = 2022;
        meuCarro.mostrarcarro();
    }
}
