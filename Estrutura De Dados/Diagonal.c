//Faça um programa que deixe a diagonal principal com os mesmos numeros.

#include<stdio.h>

int main(){
    int n;

    printf("Digite quantas linhas e colunas tera sua matriz: ");
    scanf("%d", &n);

    int matriz[n][n];

    for (i = 0; linha < coluna; coluna++){
        for (coluna = 0; coluna < linha; coluna++){
            if (linha = coluna){
                matriz[linha][coluna] = 1;
            } else{
                matriz[linha][coluna] = 0;
            }
            
        }
        
    }
    printf("A matriz resultante e:\n");
    for (linha = 0; linha < coluna; linha++) {
        for (coluna = 0; coluna < linha; coluna++) {
            printf("%d ", matriz[linha][coluna]);
        }
        printf("\n");
    }
    

    



}