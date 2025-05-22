package br.com.andreluzzi.exercicio1;

public class Principal {
    public static void main(String[] args) {
        Veiculo carro = new Carro();
        Veiculo bicicleta = new Bicicleta();

        System.out.println("--- Carro ---");
        carro.acelerar();
        carro.virar("direita");
        carro.frear();

        System.out.println("\n--- Bicicleta ---");
        bicicleta.acelerar();
        bicicleta.virar("esquerda");
        bicicleta.frear();
    }
}
