import java.util.Scanner;

public class exercicio6 {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite o nome de um dia da semana: ");
        String dia = scanner.nextLine().toLowerCase();

        if (dia.equals("segunda") || dia.equals("terca") || dia.equals("quarta") || dia.equals("quinta") || dia.equals("sexta")) {
            System.out.println("Bom dia!");
        } else if (dia.equals("sabado") || dia.equals("domingo")) {
            System.out.println("Mal dia!");
        } else {
            System.out.println("Dia inválido! Por favor, digite um dia válido da semana.");
        }
    }
}
