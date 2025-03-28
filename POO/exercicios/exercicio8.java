import java.util.Scanner;

public class exercicio8 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        int totalNumeros = 0;
        int numero;
        
        do {
            System.out.print("Digite um número (ou -1 para terminar): ");
            numero = scanner.nextInt();
            
            if (numero != -1) {
                totalNumeros++;
            }
            
        } while (numero != -1);

        System.out.println("Total de números lidos: " + totalNumeros);
    }
}