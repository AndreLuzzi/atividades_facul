package br.com.andreluzzi.exercicio5;

import java.util.ArrayList;
import java.util.List;

public class Principal {
    public static void main(String[] args) {
        List<Arquivo> arquivos = new ArrayList<>();

        arquivos.add(new ArquivoTexto());
        arquivos.add(new ArquivoImagem());
        arquivos.add(new ArquivoAudio());

        for (Arquivo arquivo : arquivos) {
            System.out.println("---- Novo Arquivo ----");
            arquivo.abrir();
            arquivo.ler();
            arquivo.fechar();
            System.out.println();
        }
    }
}
