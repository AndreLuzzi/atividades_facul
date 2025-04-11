package br.com.andreluzzi.exercicio2;

public class LojaVeiculos {
    private String nomeLoja;
    private double faturamento;

    LojaVeiculos(String nomeLoja) {
        this.nomeLoja = nomeLoja;
        this.faturamento = 0.0;
    }

    void venderVeiculo(double valor) {
        if (valor > 0) {
        faturamento += valor;
        }
    }

    void darDesconto(double valor) {
        if (valor > 0 && faturamento >= valor) {
        faturamento -= valor;
        }
    }

    double getFaturamento() {
    return faturamento;
    }
}

