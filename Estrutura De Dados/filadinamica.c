#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TAM_NOME 100

// Estrutura de um nó da fila (cada arquivo)
typedef struct No {
    char nomeArquivo[TAM_NOME]; // Nome do arquivo
    struct No* prox;            // Ponteiro para o próximo nó
} No;

// Estrutura da fila com ponteiros para início e fim
typedef struct {
    No* inicio; // Primeiro nó da fila
    No* fim;    // Último nó da fila
} Fila;

// Inicializa a fila dinâmica
void inicializarFila(Fila* fila) {
    fila->inicio = NULL;
    fila->fim = NULL;
}

// Verifica se a fila está vazia
int filaVazia(Fila* fila) {
    return fila->inicio == NULL;
}

// Insere novo nó (arquivo) no final da fila
void inserirArquivo(Fila* fila, char nome[]) {
    No* novo = (No*) malloc(sizeof(No)); // Aloca memória para novo nó
    if (novo == NULL) {
        printf("Erro ao alocar memória.\n");
        exit(1); // Ou outra forma de tratamento apropriada
    }

    strcpy(novo->nomeArquivo, nome); // Copia o nome do arquivo para o novo nó
    novo->prox = NULL;

    if (filaVazia(fila)) {
        fila->inicio = novo;
        fila->fim = novo;
    } else {
        fila->fim->prox = novo;
        fila->fim = novo;
    }
}
