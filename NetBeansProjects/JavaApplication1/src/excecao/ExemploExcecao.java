
package excecao;

public class ExemploExcecao {

   
    public static void main(String[] args) {
        
        try {
            int x = 0;
            int y = 100/x;
            System.out.println("Resultado: "+y);
        } catch (ArithmeticException e) {
            System.out.println("Erro "+ e.getMessage());
        }
             
    }
    
}
