import java.util.Random;

public class exercicio14 {
    public static void main(String[] args) {
        
        Random random = new Random();

        int numero1 = random.nextInt(101);

        int numero2 = random.nextInt(50) + 51;

        int maior = Math.max(numero1, numero2);

        int cubo = maior * maior * maior;

        System.out.println("Primeiro número gerado: " + numero1);
        System.out.println("Segundo número gerado: " + numero2);
        System.out.println("O maior número é: " + maior);
        System.out.println("O cubo do maior número é: " + cubo);
    }
}