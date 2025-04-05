
package br.com.andreluzzi.logging;
import java.util.logging.Logger;

public class ExemploLogger {
    //atributos
    private static final Logger logger = Logger.getLogger(ExemploLogger.class.getName());
    //construtores
    
    //métodos
    public static void main(String[] args) {
        logger.info("Iniciando nosso programa...");
        try {
            int resultado = 10/0; //forcei um erro pra usar de exemplo
        } catch (ArithmeticException e) {
            logger.severe("Erro: Divisao por zero");
        }
        
        logger.info("final do programa.");
    }
    
}