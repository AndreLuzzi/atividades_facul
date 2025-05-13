package br.com.andreluzzi.exercicio5;

public class Carro extends Veiculo {
    // Erro: não implementou o método abstrato acelerar()
    // Solução: implementar o método
    @Override
    void acelerar() {
        System.out.println("Carro acelerando!");
    }
}
