import java.util.Scanner;

public class exercicio2 {
    public static void main(String[] args) {
       
        Scanner scanner = new Scanner(System.in);

        int num1, num2, soma, produto, diferenca, media, razao, resto;

        System.out.print("Digite o primeiro número: ");
        num1 = scanner.nextInt();
        
        System.out.print("Digite o segundo número: ");
        num2 = scanner.nextInt();

        soma = num1 + num2;

        produto = num1 * num2;

        diferenca = num1 - num2;

        media = (num1 + num2) / 2;

        razao = num1/num2;
        
        resto = num1 % num2;

        System.out.println("A soma dos dois números é: " + soma);
        System.out.println("O produto dos dois números é: " + produto);
        System.out.println("A diferenca dos dois números é: " + diferenca);
        System.out.println("A media dos dois números é: " + media);
        System.out.println("A razao dos dois números é: " + razao);
        System.out.println("O resto dos dois números é: " + resto);

        scanner.close();
    }
}