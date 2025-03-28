import java.util.Scanner;

public class exercicio11 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);

        String nome;
        double nota;

        for (int i = 1; i <= 10; i++) {

            System.out.print("Digite o nome do " + i + "º aluno: ");
            nome = scanner.nextLine();

            System.out.print("Digite a nota de " + nome + ": ");
            nota = scanner.nextDouble();
            scanner.nextLine();

            if (nota >= 6.0) {
                System.out.println(nome + " foi APROVADO");
            } else {
                System.out.println(nome + " foi REPROVADO");
            }
        }
    }
}
