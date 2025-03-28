import java.util.Scanner;

public class exercicio18 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite uma string: ");
        String input = scanner.nextLine();
        
        StringBuilder resultado = new StringBuilder();

        
        for (int i = 0; i < input.length(); i++) {
            char c = input.charAt(i);

            
            if ("aeiouAEIOU".indexOf(c) != -1) {
                
                resultado.append(Character.toUpperCase(c));
            } else {

                resultado.append(Character.toLowerCase(c));
            }
        }

        System.out.println("Resultado: " + resultado.toString());
    }
}