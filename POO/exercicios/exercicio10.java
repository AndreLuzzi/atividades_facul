import java.util.Scanner;

public class exercicio10 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        int soma = 0;
        int maior = Integer.MIN_VALUE;

        for (int i = 1; i <= 10; i++) {
            System.out.print("Digite o " + i + "º número: ");
            int numero = scanner.nextInt();
            
            soma += numero;
            
            if (numero > maior) {
                maior = numero;
            }
        }

        double media = soma / 10.0;

        System.out.println("A média dos números é: " + media);
        System.out.println("O maior número é: " + maior);
    }
}