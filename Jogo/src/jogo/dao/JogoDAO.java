package jogo.dao;

import jogo.model.Jogo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JogoDAO {
    private Connection conexao;

    public JogoDAO(Connection conexao) {
        this.conexao = conexao;
    }

    public boolean adicionarJogo(Jogo jogo) {
        String sql = "INSERT INTO jogos (nome, genero, preco, quantidade) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, jogo.getNome());
            stmt.setString(2, jogo.getGenero());
            stmt.setDouble(3, jogo.getPreco());
            stmt.setInt(4, jogo.getQuantidade());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println("Erro ao adicionar jogo: " + e.getMessage());
            return false;
        }
    }

    public List<Jogo> listarJogos() {
        List<Jogo> lista = new ArrayList<>();
        String sql = "SELECT * FROM jogos";
        try (Statement stmt = conexao.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Jogo jogo = new Jogo();
                jogo.setId(rs.getInt("id_jogo"));
                jogo.setNome(rs.getString("nome"));
                jogo.setGenero(rs.getString("genero"));
                jogo.setPreco(rs.getDouble("preco"));
                jogo.setQuantidade(rs.getInt("quantidade"));
                lista.add(jogo);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar jogos: " + e.getMessage());
        }
        return lista;
    }

    public boolean atualizarJogo(Jogo jogo) {
        String sql = "UPDATE jogos SET nome = ?, genero = ?, preco = ?, quantidade = ? WHERE id = ?";
        try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, jogo.getNome());
            stmt.setString(2, jogo.getGenero());
            stmt.setDouble(3, jogo.getPreco());
            stmt.setInt(4, jogo.getQuantidade());
            stmt.setInt(5, jogo.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar jogo: " + e.getMessage());
            return false;
        }
    }

    public boolean removerJogo(int id) {
        String sql = "DELETE FROM jogos WHERE id = ?";
        try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println("Erro ao remover jogo: " + e.getMessage());
            return false;
        }
    }
}
