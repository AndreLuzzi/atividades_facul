#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 100
#define TAM_NOME 100

//Estrutura da fila estática com array fixo
typedef struct {
    char arquivo[MAX][TAM_NOME]; //cada linha é um nome de arquivo
    int inicio; //indice do primeiro elemneto da fila
    int fim; //indice da proxima posição livre
} Fila;

//inicializa a fila
void inicializarFila(Fila *fila) {
    fila-> inicio = 0;
    fila ->fim = 0;
}

//verifica se a fila está cheia
int filacheia(Fila *fila) {
    return fila->fim == MAX;
}

//verifica se a fila está vazia
int filaVazia(Fila *fila) {
    return fila->inicio == fila->fim;
}

//insere um novo arquivo na fila
void inserirArquivo(Fila *fila, char nome[]) {
    if (filaCheia(fila)) {
        printf("Fila cheia!\n");
        return;
    }
    strcpy(fila->arquivos[fila->fim], nome);
    fila->fim++;
    printf("Arquivo '%s' adicionado a fila.\n", nome);
}

//Remove o primeiro arquivo da fila
void executarImpressao(Fila *fila) {
    if (filaVazia(fila)) {
        printf("A fila de impressão está vazia!\n");
        return;
    }
    printf("Imprimindo arquivo: \"%s\"\n", fila->arquivos[fila->inicio]);
    fila->inicio++;
}
// Exibe os arquivos na fila
void exibirFila(FilaImpressao *fila) {
    if (filaVazia(fila)) {
        printf("A fila de impressão está vazia!\n");
        return;
    }

    printf("Fila de Impressão:\n");
    for (int i = fila->inicio; i < fila->fim; i++) {
        printf("%d. %s\n", i - fila->inicio + 1, fila->arquivos[i]);
    }
}

int main() {
    Fila fila;
    inicializarFila(&fila);

    int opcao;

    do {
        printf("\nMenu:\n");
        printf("1 - Inserir arquivo na fila\n");
        printf("2 - Executar impressão\n");
        printf("3 - Exibir fila de impressão\n");
        printf("4 - Fim\n");
        printf("Escolha uma opção: ");
        scanf("%d", &opcao);

        switch (opcao) {
            case 1:
                inserirArquivo(&fila);
                break;
            case 2:
                executarImpressao(&fila);
                break;
            case 3:
                exibirFila(&fila);
                break;
            case 4:
                printf("Encerrando o programa.\n");
                break;
            default:
                printf("Opção inválida! Tente novamente.\n");
        }
    } while (opcao != 4);

    return 0;
}