
package br.com.andreluzzi.arquivos;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;

public class EditarArquivo {

    public static void main(String[] args) {
        File arquivo = new File("exemplo.txt");
        boolean existe = arquivo.exists() && arquivo.length()>0;
        
        try{
            FileWriter escritor = new FileWriter("exemplo.txt",true);
            BufferedWriter buffer = new BufferedWriter(escritor);
            buffer.newLine();
            buffer.write("isso e uma nova linha");
        }catch (IOException ex){
            Logger.getLogger(EditarArquivo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
