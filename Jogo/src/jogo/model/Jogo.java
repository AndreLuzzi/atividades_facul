package jogo.model;

public class Jogo {
    private int id;
    private String nome;
    private String genero;
    private double preco;
    private int quantidade;

    public Jogo() {
    }

    public Jogo(String nome, String genero, double preco, int quantidade) {
        this.nome = nome;
        this.genero = genero;
        this.preco = preco;
        this.quantidade = quantidade;
    }

    public Jogo(int id, String nome, String genero, double preco, int quantidade) {
        this.id = id;
        this.nome = nome;
        this.genero = genero;
        this.preco = preco;
        this.quantidade = quantidade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}
