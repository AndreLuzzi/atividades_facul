package br.com.andreluzzi.exercicio1;

class Circulo extends Forma {
    double raio;

    public Circulo(double raio) {
        this.raio = raio;
    }

    @Override
    public double calcularArea() {
        return raio * 3.14 * 2;
    }
}