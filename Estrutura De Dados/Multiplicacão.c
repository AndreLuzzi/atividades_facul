//Faça um programa que multiplique duas matrizes e diga caso não seja possível multiplica-la.
#include <stdio.h>

int main() {
    int n, i, j;

    // Leitura do tamanho da matriz
    printf("Digite o tamanho da matriz (n x n): ");
    scanf("%d", &n);

    // Criando a matriz
    int matriz[n][n];

    // Preenchendo a matriz
    printf("Digite o valor para a diagonal: ");
    int valor;
    scanf("%d", &valor);

    // Preenchendo a matriz com 0 fora da diagonal
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            if (i == j) {
                matriz[i][j] = valor;  // Valor na diagonal
            } else {
                matriz[i][j] = 0;  // 0 fora da diagonal
            }
        }
    }

    // Imprimindo a matriz
    printf("A matriz resultante é:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            printf("%d ", matriz[i][j]);
        }
        printf("\n");
    }

    return 0;
}