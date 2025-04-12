package agenda;

import java.util.Scanner;
public class Principal {

    //Cria uma instância de Persistencia e chama o método listarContatos() para exibir os contatos armazenados no arquivo contatos.txt. A parte comentada, que inclui a criação e adição de novos contatos, foi desativada.
    public static void main(String[] args) {
    /*    String nome = "Luke Skywalker";
        String telefone = "(45)99999-9999";
        String email = "luke@gmail.com";
        Contato contato = 
                new Contato(nome, telefone, email);
        
       
        Contato contato1 = new Contato("Anakin Skywalker","(45)77777-7777" ,"anak@gmail.com" );
        
       Persistencia persistencia = new Persistencia();
       persistencia.criarArquivo();
       persistencia.inserir(contato);
       persistencia.inserir(contato1);
       
       
       Contato c = new Contato();
            
       Scanner leia = new Scanner(System.in);
       System.out.println("Nome: ");
       c.setNome(leia.nextLine());
       System.out.println("Telefone: ");
       c.setTelefone(leia.nextLine());
       System.out.println("Email: ");
       c.setEmail(leia.nextLine());
        
       persistencia.inserir(c); */
    
    
    //EXEMPLO LISTAR
    Persistencia persistencia = new Persistencia();
    persistencia.listarContatos();
        
    }
    
}

