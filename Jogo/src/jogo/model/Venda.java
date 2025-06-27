package jogo.model;

import java.time.LocalDate;

public class Venda {
    private int id;
    private int idJogo;
    private LocalDate dataVenda;
    private int quantidade;
    private double total;

    public Venda() {
    }

    public Venda(int idJogo, LocalDate dataVenda, int quantidade, double total) {
        this.idJogo = idJogo;
        this.dataVenda = dataVenda;
        this.quantidade = quantidade;
        this.total = total;
    }

    public Venda(int id, int idJogo, LocalDate dataVenda, int quantidade, double total) {
        this.id = id;
        this.idJogo = idJogo;
        this.dataVenda = dataVenda;
        this.quantidade = quantidade;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdJogo() {
        return idJogo;
    }

    public void setIdJogo(int idJogo) {
        this.idJogo = idJogo;
    }

    public LocalDate getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(LocalDate dataVenda) {
        this.dataVenda = dataVenda;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
