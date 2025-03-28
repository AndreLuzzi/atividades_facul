import java.util.Scanner;

public class exercicio7 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite um número para calcular o fatorial: ");
        int numero = scanner.nextInt();
     
        if (numero < 0) {
            System.out.println("Fatorial não existe para números negativos.");
        } else {
            
            int fatorial = 1;
           
            int i = 1;
            while (i <= numero) {
                fatorial *= i; 
                i++; 
            }

            System.out.println("O fatorial de " + numero + " é " + fatorial);
        }
    }
}