import java.util.Scanner;

public class exercicio3 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        double num1, num2, num3, media;

        System.out.println("Digite três numeros");
        num1 = scanner.nextDouble();
        num2 = scanner.nextDouble();
        num3 = scanner.nextDouble();

        media = (num1 + num2 + num3) / 3;

        System.out.println("Sua média é " + media);
        
    }
    
}
