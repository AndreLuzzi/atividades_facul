package jogo.dao;

import jogo.model.Usuario;
import java.sql.*;

public class UsuarioDAO {
    private Connection conexao;

    public UsuarioDAO(Connection conexao) {
        this.conexao = conexao;
    }

    public boolean inserirUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios (email, senha) VALUES (?, ?)";
        try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println("Erro ao inserir usuario: " + e.getMessage());
            return false;
        }
    }

    public Usuario buscarPorEmail(String email) {
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id_jogo"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                return usuario;
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar usuario: " + e.getMessage());
        }
        return null;
    }
}
