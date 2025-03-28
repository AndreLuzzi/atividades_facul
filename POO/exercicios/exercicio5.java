import java.util.Scanner;

public class exercicio5 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite o número correspondente ao dia da semana (domingo=0, segunda=1, ...): ");
        int dia = scanner.nextInt();

        switch (dia) {
            case 0:
                System.out.println("Bom Domingo!");
                break;
            case 1:
                System.out.println("Bom Segunda-feira!");
                break;
            case 2:
                System.out.println("Bom Terça-feira!");
                break;
            case 3:
                System.out.println("Bom Quarta-feira!");
                break;
            case 4:
                System.out.println("Bom Quinta-feira!");
                break;
            case 5:
                System.out.println("Bom Sexta-feira!");
                break;
            case 6:
                System.out.println("Bom Sábado!");
                break;
            default:
                System.out.println("Número inválido. Por favor, digite um número entre 0 e 6.");
        }
    }
}