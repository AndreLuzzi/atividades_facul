package br.com.andreluzzi.exercicio1;

public class Bicicleta implements Veiculo {
    @Override
    public void acelerar() {
        System.out.println("A bicicleta esta ganhando velocidade.");
    }

    @Override
    public void frear() {
        System.out.println("A bicicleta esta freando.");
    }

    @Override
    public void virar(String direcao) {
        System.out.println("A bicicleta esta virando para a " + direcao + ".");
    }
}
