package agenda;

import java.util.Scanner;
public class Teste {
    public static void main(String[] args) {
        // TODO code application logic here
        int opcao;
        Scanner leia = new Scanner(System.in);
        Persistencia persistencia = new Persistencia();
        do {
            System.out.println("----MENU AGENDA DE CONTATOS----");
            System.out.println("1. Adicionar Contato");
            System.out.println("2. Listar Contatos");
            System.out.println("3. Editar Contatos");
            System.out.println("0. Sair");
            opcao = leia.nextInt();
            switch (opcao) {
                case 1:
                    Contato contato = new Contato();
                    System.out.println("Nome: ");
                    contato.setNome(leia.nextLine());//erro do Scanner
                    contato.setNome(leia.nextLine());
                    System.out.println("Telefone: ");
                    contato.setTelefone(leia.nextLine());
                    System.out.println("Email: ");
                    contato.setEmail(leia.nextLine());
                    persistencia.inserir(contato);
                    break;
                case 2:
                    persistencia.listarContatos();
                    break;
                case 3:
                    persistencia.listarContatos();
                    contato = new Contato();
                    System.out.println("Nome do contato a ser alterado");
                    String nome = leia.nextLine();
                    nome= leia.nextLine();
                    System.out.println("Novo nome: ");
                    contato.setNome(leia.nextLine());//erro do scaner
                    System.out.println("Novo Telefone: ");
                    contato.setTelefone(leia.nextLine());
                    System.out.println("Novo Email: ");
                    contato.setEmail(leia.nextLine());
                    persistencia.editar(nome, contato);
                case 0:
                    System.out.println("Saindo do programa ...");
                    break;
                default:
                    throw new AssertionError();
            }
        } while (opcao != 0);
        leia.close();
    }

}