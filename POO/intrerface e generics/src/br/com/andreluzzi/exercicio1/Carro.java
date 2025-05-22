package br.com.andreluzzi.exercicio1;

public class Carro implements Veiculo {
    @Override
    public void acelerar() {
        System.out.println("O carro esta acelerando.");
    }

    @Override
    public void frear() {
        System.out.println("O carro esta freando.");
    }

    @Override
    public void virar(String direcao) {
        System.out.println("O carro esta virando para a " + direcao + ".");
    }
}
