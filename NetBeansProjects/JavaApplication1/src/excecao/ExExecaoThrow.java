
package excecao;

import java.util.Scanner;

public class ExExecaoThrow {

    public static void main(String[] args) {
        
        Scanner leia = new Scanner(System.in);
        System.out.println("Informe sua idade");
        int idade = leia.nextInt();
        
        if(idade < 18){
            throw new IllegalArgumentException("Idade minima e 18 anos");
            //System.out.println("Idade menor que 18");
        }
            System.out.println("Idade Permitida");
    
    }
    
}
