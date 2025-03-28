import java.util.Scanner;

public class exercicio12 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);

        String nomesConcatenados = "";
        
        for (int i = 1; i <= 10; i++) {
            System.out.print("Digite o nome da " + i + "ª pessoa: ");
            String nome = scanner.nextLine();

            nomesConcatenados += nome;

            if (i < 10) {
                nomesConcatenados += " ";
            }
        }

        System.out.println("Nomes concatenados: " + nomesConcatenados);
    }
}