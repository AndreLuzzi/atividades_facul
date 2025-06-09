#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TAM_NOME 100
#define TAM_HAMBURGUER 100

// Estrutura de um pedido (no da fila)
typedef struct Pedido {
    int numeroPedido;
    char nomeCliente[TAM_NOME];
    char tipoHamburguer[TAM_HAMBURGUER];
    struct Pedido* prox;
} Pedido;

// Estrutura da fila
typedef struct {
    Pedido* inicio;
    Pedido* fim;
    int proximoNumero; // Controle automatico do numero do pedido
} Fila;

// Inicializa a fila
void inicializarFila(Fila* fila) {
    fila->inicio = NULL;
    fila->fim = NULL;
    fila->proximoNumero = 1;
}

// Verifica se a fila esta vazia
int filaVazia(Fila* fila) {
    return fila->inicio == NULL;
}

// Insere um novo pedido na fila
void inserirPedido(Fila* fila, char nome[], char hamburguer[]) {
    Pedido* novo = (Pedido*) malloc(sizeof(Pedido));
    if (novo == NULL) {
        printf("Erro ao alocar memoria para o pedido.\n");
        exit(1);
    }

    novo->numeroPedido = fila->proximoNumero++;
    strcpy(novo->nomeCliente, nome);
    strcpy(novo->tipoHamburguer, hamburguer);
    novo->prox = NULL;

    if (filaVazia(fila)) {
        fila->inicio = novo;
        fila->fim = novo;
    } else {
        fila->fim->prox = novo;
        fila->fim = novo;
    }

    printf("Pedido #%d inserido com sucesso!\n", novo->numeroPedido);
}

// Remove o primeiro pedido da fila
void entregarPedido(Fila* fila) {
    if (filaVazia(fila)) {
        printf("Nenhum pedido na fila para entregar.\n");
        return;
    }

    Pedido* temp = fila->inicio;
    printf("Entregando pedido #%d: %s - %s\n",
           temp->numeroPedido, temp->nomeCliente, temp->tipoHamburguer);

    fila->inicio = fila->inicio->prox;
    if (fila->inicio == NULL)
        fila->fim = NULL;

    free(temp);
}

// Exibe todos os pedidos na fila
void exibirFila(Fila* fila) {
    if (filaVazia(fila)) {
        printf("Fila vazia.\n");
        return;
    }

    Pedido* atual = fila->inicio;
    printf("Pedidos na fila:\n");
    while (atual != NULL) {
        printf("Pedido #%d - Cliente: %s | Hamburguer: %s\n",
               atual->numeroPedido, atual->nomeCliente, atual->tipoHamburguer);
        atual = atual->prox;
    }
}

// Libera toda a memoria da fila
void liberarFila(Fila* fila) {
    while (!filaVazia(fila)) {
        entregarPedido(fila);
    }
}

// Funcao principal (exemplo de uso)
int main() {
    Fila fila;
    inicializarFila(&fila);

    inserirPedido(&fila, "Ana", "Bacon Supreme");
    inserirPedido(&fila, "Carlos", "Veggie Deluxe");
    inserirPedido(&fila, "Beatriz", "Cheddar Duplo");

    printf("\n--- Situacao Atual da Fila ---\n");
    exibirFila(&fila);

    printf("\n--- Entregando um Pedido ---\n");
    entregarPedido(&fila);

    printf("\n--- Fila Apos Entrega ---\n");
    exibirFila(&fila);

    liberarFila(&fila);
    return 0;
}