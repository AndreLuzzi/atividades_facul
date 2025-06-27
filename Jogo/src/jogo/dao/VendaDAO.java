package jogo.dao;

import jogo.model.Venda;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VendaDAO {
    private Connection conexao;

    public VendaDAO(Connection conexao) {
        this.conexao = conexao;
    }

    public boolean registrarVenda(Venda venda) {
        String sql = "INSERT INTO vendas (id_jogo, data_venda, quantidade, total) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setInt(1, venda.getIdJogo());
            stmt.setDate(2, Date.valueOf(venda.getDataVenda()));
            stmt.setInt(3, venda.getQuantidade());
            stmt.setDouble(4, venda.getTotal());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println("Erro ao registrar venda: " + e.getMessage());
            return false;
        }
    }

    public List<Venda> listarVendas() {
        List<Venda> lista = new ArrayList<>();
        String sql = "SELECT * FROM vendas";
        try (Statement stmt = conexao.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Venda venda = new Venda();
                venda.setId(rs.getInt("id_vendas"));
                venda.setIdJogo(rs.getInt("id_jogo"));
                venda.setDataVenda(rs.getDate("data_venda").toLocalDate());
                venda.setQuantidade(rs.getInt("quantidade"));
                venda.setTotal(rs.getDouble("total"));
                lista.add(venda);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar vendas: " + e.getMessage());
        }
        return lista;
    }
}
