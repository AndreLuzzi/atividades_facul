#include <stdio.h>
#include <string.h>

#define TAM 10

typedef struct {
    char nome[50];
} Pessoa;

typedef struct {
    Pessoa fila[TAM];
    int inicio;
    int fim;
    int quantidade;
} Fila;

void inicializarFila(Fila *f) {
    f->inicio = 0;
    f->fim = 0;
    f->quantidade = 0;
}

int filaCheia(Fila *f) {
    return f->quantidade == TAM;
}

int filaVazia(Fila *f) {
    return f->quantidade == 0;
}

void inserir(Fila *f, char nome[]) {
    if (filaCheia(f)) {
        printf("Fila cheia! %s nao pode entrar.\n", nome);
        return;
    }
    strcpy(f->fila[f->fim].nome, nome);
    f->fim = (f->fim + 1) % TAM;
    f->quantidade++;
    printf("%s entrou na fila.\n", nome);
}

void remover(Fila *f) {
    if (filaVazia(f)) {
        printf("Fila vazia! Ninguem para entrar.\n");
        return;
    }
    printf("%s entrou no estadio e ocupou o assento %d.\n", f->fila[f->inicio].nome, f->inicio + 1);
    f->inicio = (f->inicio + 1) % TAM;
    f->quantidade--;
}

void listarFila(Fila *f, char nomeFila[]) {
    printf("\nFila %s:\n", nomeFila);
    if (filaVazia(f)) {
        printf("Fila vazia.\n");
        return;
    }
    int i = f->inicio;
    for (int count = 0; count < f->quantidade; count++) {
        printf("Assento %d: %s\n", (i + 1), f->fila[i].nome);
        i = (i + 1) % TAM;
    }
}

int main() {
    Fila timeA, timeB;
    inicializarFila(&timeA);
    inicializarFila(&timeB);

    int opcao;
    char nome[50];
    do {
        printf("\n   Estadio   \n");
        printf("1 - Entrar na fila Time A\n");
        printf("2 - Entrar na fila Time B\n");
        printf("3 - Permitir entrada Time A\n");
        printf("4 - Permitir entrada Time B\n");
        printf("5 - Listar filas\n");
        printf("0 - Sair\n");
        printf("Escolha: ");
        scanf("%d", &opcao);
        getchar();

        switch (opcao) {
            case 1:
                printf("Nome: ");
                fgets(nome, 50, stdin);
                nome[strcspn(nome, "\n")] = 0;
                inserir(&timeA, nome);
                break;
            case 2:
                printf("Nome: ");
                fgets(nome, 50, stdin);
                nome[strcspn(nome, "\n")] = 0;
                inserir(&timeB, nome);
                break;
            case 3:
                remover(&timeA);
                break;
            case 4:
                remover(&timeB);
                break;
            case 5:
                listarFila(&timeA, "Time A");
                listarFila(&timeB, "Time B");
                break;
            case 0:
                printf("Encerrando...\n");
                break;
            default:
                printf("Opcao invalida!\n");
        }

    } while (opcao != 0);

    return 0;
}
