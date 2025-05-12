#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 100

// Estrutura do aluno
typedef struct {
    int matricula;
    char nome[30];
    float n1, n2, n3;
} Aluno;

// Estrutura da fila
typedef struct {
    int inicio, fim, qtd;
    Aluno dados[MAX];
} Fila;

// Protótipos das funções
Fila* cria_Fila();
void libera_Fila(Fila* fi);
int consulta_Fila(Fila* fi, Aluno *al);
int insere_Fila(Fila* fi, Aluno al);
int remove_Fila(Fila* fi);
int tamanho_Fila(Fila* fi);
int Fila_vazia(Fila* fi);
int Fila_cheia(Fila* fi);