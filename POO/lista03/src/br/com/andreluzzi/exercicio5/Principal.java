package br.com.andreluzzi.exercicio5;

public class Principal {
    public static void main(String[] args) {
        double celsius = 30;
        double fahrenheit = ConversorTemperatura.celsiusParaFahrenheit(celsius);
        System.out.println(celsius + " oC e igual a " + fahrenheit + " oF");
    }
}
