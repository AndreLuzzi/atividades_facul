#include <stdio.h>

int main() {
    int n, i, j;

    printf("Digite o tamanho da matriz (n x n): ");
    scanf("%d", &n);

    int matriz[n][n];

    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            if (i == j) {
                matriz[i][j] = 1;  
            } else {
                matriz[i][j] = 0; 
            }
        }
    }

    printf("Sua matriz e:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            printf("%d ", matriz[i][j]);
        }
        printf("\n");
    }

    return 0;
}