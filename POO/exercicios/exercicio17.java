import java.util.Scanner;

public class exercicio17 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite uma string: ");
        String input = scanner.nextLine();

        String stringInvertida = new StringBuilder(input).reverse().toString();

        System.out.println("String invertida: " + stringInvertida);

        scanner.close();
    }
}