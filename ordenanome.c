#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void selectionSort(char nomes[][100], int n) {
    int i, j, min;
    char aux[100];

    for (i = 0; i < n - 1; i++) {
        min = i;
        for (j = i + 1; j < n; j++) {
            if (strcmp(nomes[j], nomes[min]) < 0) {
                min = j;
            }
        }

        // Troca nomes[i] com nomes[min]
        strcpy(aux, nomes[i]);
        strcpy(nomes[i], nomes[min]);
        strcpy(nomes[min], aux);
    }
}

int main() {
    char nomes[200][100]; // 200 nomes de até 99 caracteres + '\0'
    int n, i;

    printf("Quantos nomes deseja ordenar (1 a 200)? ");
    scanf("%d", &n);
    getchar(); // Limpa o '\n' deixado pelo scanf

    if (n < 1 || n > 200) {
        printf("Quantidade invalida!\n");
        return 1;
    }

    printf("Digite os %d nomes:\n", n);
    for (i = 0; i < n; i++) {
        fgets(nomes[i], sizeof(nomes[i]), stdin);
        nomes[i][strcspn(nomes[i], "\n")] = '\0'; // Remove o '\n' do final
    }

    selectionSort(nomes, n);

    printf("\nNomes em ordem alfabetica:\n");
    for (i = 0; i < n; i++) {
        printf("%s\n", nomes[i]);
    }

    return 0;
}
