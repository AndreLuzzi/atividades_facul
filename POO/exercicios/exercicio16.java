import java.util.Scanner;

public class exercicio16 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite uma string: ");
        String input = scanner.nextLine();

        String resultado = input.replace('A', '4')
                                 .replace('a', '4')
                                 .replace('E', '3')
                                 .replace('e', '3')
                                 .replace('I', '1')
                                 .replace('i', '1')
                                 .replace('O', '0')
                                 .replace('o', '0')
                                 .replace('U', 'U')
                                 .replace('u', 'U');

        System.out.println("String com vogais substituídas: " + resultado);
    }
}