package agenda;

import java.io.*;
import java.util.*;

public class Persistencia {
    private String arquivo;

    public Persistencia(String nomeArquivo) {
        this.arquivo = nomeArquivo;
        criarArquivo();
    }

    public void setArquivo(String nomeArquivo) {
        this.arquivo = nomeArquivo;
        criarArquivo();
    }

    public String getArquivo() {
        return this.arquivo;
    }

    public void criarArquivo() {
        try {
            File file = new File(arquivo);
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException ex) {
            System.out.println("Erro ao criar arquivo: " + ex.getMessage());
        }
    }

    public List<Contato> carregarContatos() {
        List<Contato> lista = new ArrayList<>();
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha;
            while ((linha = buffer.readLine()) != null) {
                String[] valores = linha.split(";");
                if (valores.length >= 3) {
                    lista.add(new Contato(valores[0], valores[1], valores[2]));
                }
            }
        } catch (IOException e) {
            System.out.println("Erro ao ler contatos: " + e.getMessage());
        }
        return lista;
    }

    public void salvarContatos(List<Contato> lista) {
        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(arquivo))) {
            for (Contato c : lista) {
                buffer.write(c.getNome() + ";" + c.getTelefone() + ";" + c.getEmail());
                buffer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Erro ao gravar contatos: " + e.getMessage());
        }
    }

    public void inserir(Contato contato) {
        List<Contato> lista = carregarContatos();
        for (Contato c : lista) {
            if (c.getNome().equalsIgnoreCase(contato.getNome()) || c.getTelefone().equals(contato.getTelefone())) {
                System.out.println("Contato ja existe!");
                return;
            }
        }
        lista.add(contato);
        salvarContatos(lista);
    }

    public void listarContatos() {
        List<Contato> lista = carregarContatos();
        lista.sort(Comparator.comparing(Contato::getNome));
        System.out.println("------- Lista de Contatos -------");
        for (Contato c : lista) {
            System.out.println("Nome: " + c.getNome());
            System.out.println("Telefone: " + c.getTelefone());
            System.out.println("Email: " + c.getEmail());
            System.out.println("------------------------");
        }
    }

    public void buscarPorNomeParcial(String trecho) {
        List<Contato> lista = carregarContatos();
        boolean encontrado = false;
        for (Contato c : lista) {
            if (c.getNome().toLowerCase().contains(trecho.toLowerCase())) {
                System.out.println("Nome: " + c.getNome());
                System.out.println("Telefone: " + c.getTelefone());
                System.out.println("Email: " + c.getEmail());
                System.out.println("------------------------");
                encontrado = true;
            }
        }
        if (!encontrado) {
            System.out.println("Nenhum contato encontrado.");
        }
    }

    public void editarPorTelefone(String telefone, String novoNome, String novoTelefone, String novoEmail) {
        List<Contato> lista = carregarContatos();
        boolean encontrado = false;

        for (Contato c : lista) {
            if (c.getTelefone().equals(telefone)) {
                if (!novoNome.isEmpty()) c.setNome(novoNome);
                if (!novoTelefone.isEmpty()) c.setTelefone(novoTelefone);
                if (!novoEmail.isEmpty()) c.setEmail(novoEmail);
                encontrado = true;
                break;
            }
        }
        if (encontrado) {
            salvarContatos(lista);
            System.out.println("Contato atualizado.");
        } else {
            System.out.println("Contato nao encontrado.");
        }
    }

    public void excluirPorTelefone(String telefone) {
        Scanner leia = new Scanner(System.in);
        List<Contato> lista = carregarContatos();
        boolean removido = false;

        Iterator<Contato> it = lista.iterator();
        while (it.hasNext()) {
            Contato c = it.next();
            if (c.getTelefone().equals(telefone)) {
                System.out.print("Tem certeza que deseja excluir o contato " + c.getNome() + "? (S/N): ");
                String confirmacao = leia.nextLine();
                if (confirmacao.equalsIgnoreCase("S")) {
                    it.remove();
                    removido = true;
                    System.out.println("Contato removido.");
                } else {
                    System.out.println("Operacao cancelada.");
                }
                break;
            }
        }
        if (removido) {
            salvarContatos(lista);
        } else {
            System.out.println("Contato nao encontrado.");
        }
    }

    public void exportarBackup(String nomeBackup) {
        List<Contato> lista = carregarContatos();
        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(nomeBackup))) {
            for (Contato c : lista) {
                buffer.write(c.getNome() + ";" + c.getTelefone() + ";" + c.getEmail());
                buffer.newLine();
            }
            System.out.println("Backup exportado para: " + nomeBackup);
        } catch (IOException e) {
            System.out.println("Erro ao exportar backup: " + e.getMessage());
        }
    }

    public static void listarArquivosDeAgenda() {
        File dir = new File(".");
        File[] arquivos = dir.listFiles((d, name) -> name.endsWith(".txt"));

        System.out.println("---- Arquivos de Agenda Disponiveis ----");
        if (arquivos != null && arquivos.length > 0) {
            for (File f : arquivos) {
                System.out.println(f.getName());
            }
        } else {
            System.out.println("Nenhum arquivo de agenda encontrado.");
        }
    }
}
