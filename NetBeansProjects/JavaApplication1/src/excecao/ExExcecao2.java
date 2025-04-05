
package excecao;

import java.util.Scanner;

public class ExExcecao2 {

   
    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        try{
        System.out.println("Informe um valor para x: ");
        int x = leia.nextInt();
        int y = 100/x;
        System.out.println("Resultado "+y);
        } catch (ArithmeticException e) {
            System.out.println("Operação Inválida");
            System.out.println("Erro: "+e.getMessage());
        } catch (Exception e){
            System.out.println("Formato errado");
            //System.out.println("Erro "+e.getMessage());
            System.out.println(new Exception("Número esperado"));
        }
                
                
            
    }
}   
  
