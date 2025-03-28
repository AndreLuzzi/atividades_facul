import java.util.Scanner;

public class exercicio13 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite o primeiro número: ");
        double base = scanner.nextDouble();

        System.out.print("Digite o segundo número (expoente): ");
        double expoente = scanner.nextDouble();

        double resultadoPotencia = Math.pow(base, expoente);

        double raizQuadrada = Math.sqrt(resultadoPotencia);

        double raizQuadradaArredondada = Math.ceil(raizQuadrada);

        System.out.println("Resultado da potência: " + resultadoPotencia);
        System.out.println("Raiz quadrada arredondada para cima: " + raizQuadradaArredondada);
    }
}