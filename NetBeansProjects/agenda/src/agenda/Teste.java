package agenda;

import java.util.Scanner;

public class Teste {
    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        Persistencia persistencia;

        System.out.print("Digite o nome da agenda (.txt): ");
        String nomeArquivo = leia.nextLine();
        persistencia = new Persistencia(nomeArquivo);

        int opcao;

        do {
            System.out.println("\n---- MENU AGENDA ----");
            System.out.println("1. Adicionar Contato");
            System.out.println("2. Listar Contatos");
            System.out.println("3. Buscar Contato por Nome");
            System.out.println("4. Editar por Telefone");
            System.out.println("5. Excluir por Telefone");
            System.out.println("6. Exportar Backup");
            System.out.println("7. Listar arquivos de agenda");
            System.out.println("8. Trocar de arquivo");
            System.out.println("0. Sair");
            System.out.print("Escolha uma opcao: ");
            
            while (!leia.hasNextInt()) {
                System.out.println("Digite um numero valido.");
                leia.next();
            }
            opcao = leia.nextInt();
            leia.nextLine();

            switch (opcao) {
                case 1: {
                    Contato contato = new Contato();
                    System.out.print("Nome: ");
                    contato.setNome(leia.nextLine());
                    System.out.print("Telefone: ");
                    contato.setTelefone(leia.nextLine());
                    System.out.print("Email: ");
                    contato.setEmail(leia.nextLine());
                    persistencia.inserir(contato);
                    break;
                }
                case 2:
                    persistencia.listarContatos();
                    break;
                case 3:
                    System.out.print("Digite parte do nome: ");
                    String parte = leia.nextLine();
                    persistencia.buscarPorNomeParcial(parte);
                    break;
                case 4:
                    System.out.print("Digite o telefone do contato: ");
                    String telEdit = leia.nextLine();
                    System.out.print("Novo nome (ou enter p/ manter): ");
                    String novoNome = leia.nextLine();
                    System.out.print("Novo telefone (ou enter p/ manter): ");
                    String novoTelefone = leia.nextLine();
                    System.out.print("Novo email (ou enter p/ manter): ");
                    String novoEmail = leia.nextLine();
                    persistencia.editarPorTelefone(telEdit, novoNome, novoTelefone, novoEmail);
                    break;
                case 5:
                    System.out.print("Digite o telefone do contato a excluir: ");
                    String telExcluir = leia.nextLine();
                    persistencia.excluirPorTelefone(telExcluir);
                    break;
                case 6:
                    System.out.print("Nome do arquivo de backup (.txt): ");
                    String backup = leia.nextLine();
                    persistencia.exportarBackup(backup);
                    break;
                case 7:
                    Persistencia.listarArquivosDeAgenda();
                    break;
                case 8:
                    System.out.print("Digite o novo arquivo de agenda (.txt): ");
                    String novoArquivo = leia.nextLine();
                    persistencia.setArquivo(novoArquivo);
                    break;
                case 0:
                    System.out.println("Saindo...");
                    break;
                default:
                    System.out.println("Opcao invalida.");
            }
        } while (opcao != 0);

        leia.close();
    }
}
