package jogo.controller;

import jogo.dao.*;
import jogo.model.*;
import jogo.controller.Criptografia;

import java.sql.Connection;
import java.time.LocalDate;
import java.util.List;

public class TesteSistema {
    public static void main(String[] args) {
        Connection conn = Conexao.conectar();

        if (conn == null) {
            System.out.println("Erro: nao foi possivel conectar ao banco de dados.");
            return;
        }

        UsuarioDAO usuarioDAO = new UsuarioDAO(conn);
        String email = "teste@email.com";
        String senha = "123456";

        String senhaCriptografada = Criptografia.criptografar(senha);
        Usuario novoUsuario = new Usuario(email, senhaCriptografada);
        boolean usuarioInserido = usuarioDAO.inserirUsuario(novoUsuario);
        System.out.println("Usuario inserido: " + usuarioInserido);

        JogoDAO jogoDAO = new JogoDAO(conn);
        Jogo jogo = new Jogo("God of War", "Ação", 199.99, 10);
        boolean jogoInserido = jogoDAO.adicionarJogo(jogo);
        System.out.println("Jogo inserido: " + jogoInserido);

        List<Jogo> listaJogos = jogoDAO.listarJogos();
        System.out.println("Jogos cadastrados:");
        for (Jogo j : listaJogos) {
            System.out.println(j.getId() + " - " + j.getNome() + " - Estoque: " + j.getQuantidade());
        }

        if (!listaJogos.isEmpty()) {
            Jogo jogoParaVenda = listaJogos.get(0);
            int quantidadeVendida = 2;
            double total = quantidadeVendida * jogoParaVenda.getPreco();

            Venda venda = new Venda(jogoParaVenda.getId(), LocalDate.now(), quantidadeVendida, total);
            VendaDAO vendaDAO = new VendaDAO(conn);
            boolean vendaRegistrada = vendaDAO.registrarVenda(venda);
            System.out.println("Venda registrada: " + vendaRegistrada);
        }

        try {
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
