import java.util.Scanner;

public class TesteScanner {

    public static void main(String[] args) {
        
        Scanner in = new Scanner(System.in);
        System.out.println("Digite seu nome");

        String nome = in.nextLine();
        System.out.println("ola "+nome);
    }
}