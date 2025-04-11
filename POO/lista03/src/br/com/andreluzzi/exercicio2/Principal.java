package br.com.andreluzzi.exercicio2;

public class Principal {
    public static void main(String[] args) {
        LojaVeiculos loja = new LojaVeiculos("Super Motors");
        loja.venderVeiculo(10000);
        loja.venderVeiculo(500000);
        loja.venderVeiculo(19000);
        loja.darDesconto(25500);
    
        loja.darDesconto(150000);
        System.out.println("Faturamento final: R$ " + loja.getFaturamento());
    }
}
