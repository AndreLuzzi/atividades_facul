import java.util.Scanner;

public class exercicio4 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        double num1, num2, num3, media;

        System.out.println("Digite as três notas");
        num1 = scanner.nextDouble();
        num2 = scanner.nextDouble();
        num3 = scanner.nextDouble();

        media = (num1 + num2 + num3) / 3;


        if (media >= 7) {
            System.out.println("Sua média é maior ou igual a 7");
        } else {
            System.out.println("Sua média é menor que 7"); 
        }
        
        scanner.close();
    }
    
}
