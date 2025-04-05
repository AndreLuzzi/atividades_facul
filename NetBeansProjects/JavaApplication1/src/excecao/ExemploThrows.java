
package excecao;

import java.util.Scanner;

public class ExemploThrows {
    
    /*
    public void metodo() throws NomeDaExcecao{
    }
    */
    
    public static void validarIdade(int idade) throws IllegalArgumentException{
        if (idade < 18){
            throw new IllegalArgumentException("Idade Invalida");
        }
    }

    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        System.out.println("Informe sua idade");
        int id = leia.nextInt();
        try {
            validarIdade(id);
        }catch (IllegalArgumentException erro) {
            System.out.println("Erro capturado: "+erro.getMessage());
        }
   
    }
    
}
