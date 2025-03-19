#include <stdio.h>

int main() {
   
    int M1[3][3];
    int M2[3][3];
    int resultado[3][3] = {0};
   
    printf("Digite os valores da primeira matriz (3x3):\n");
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf("Primeira Matriz[%d][%d]: ", i, j);
            scanf("%d", &M1[i][j]);
        }
    }

    printf("\nDigite os valores da segunda matriz (3x3):\n");
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf("Segunda Matriz[%d][%d]: ", i, j);
            scanf("%d", &M2[i][j]);
        }
    }

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            for (int k = 0; k < 3; k++) {
                resultado[i][j] += M1[i][k] * M2[k][j];
            }
        }
    }

    printf("\nResultado de (A x B):\n");
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%d\t", resultado[i][j]);
        }
        printf("\n");
    }

    return 0;
}