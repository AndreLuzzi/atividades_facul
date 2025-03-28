import java.util.Scanner;

public class exercicio15 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite um número para calcular sua raiz cúbica: ");
        double numero = scanner.nextDouble();

        double raizCubica = Math.cbrt(numero);

        System.out.println("A raiz cúbica de " + numero + " é: " + raizCubica);

        scanner.close();
    }
}