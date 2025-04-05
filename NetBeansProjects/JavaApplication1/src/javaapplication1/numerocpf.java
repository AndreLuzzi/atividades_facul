
package javaapplication1;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class numerocpf {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner leia = new Scanner (System.in);
        String cep;
        
        System.out.println("Digite o CEP no formato xxxxx-xxx");
        cep = leia.nextLine();
        
        String regex = "\\d{5}-\\d{3}";
        Pattern pattern = Pattern.compile(regex);
        
        Matcher matcher = pattern.matcher(cep);
        
         if (matcher.matches()){
            System.out.println("CEP válido");
        }else{
            System.out.println("CEP Inválido");
        }
         leia.close();
    }
    
}
