
package excecao;

import javax.swing.JOptionPane;

public class ExFormatoNumero {

   
    public static void main(String[] args) {
        String var = JOptionPane.showInputDialog("Digite um número inteiro");
        try{
            int i = Integer.parseInt(var);
            JOptionPane.showMessageDialog(null, "o número digitado foi: "+i);
        }catch (NumberFormatException nfe) {
            JOptionPane.showConfirmDialog(null, "não é possível atribuir um número inteiro");
            System.out.println("Erro "+nfe.getMessage());
        }
    }
    
}
