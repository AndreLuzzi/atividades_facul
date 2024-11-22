#include <stdio.h>

void main(){
    int idade;
    int i = 1;
    int soma = 0;

    while (i <= 20) { 
        printf("Digite a idades %d\n",i);
        scanf("%d", &idade);

        soma += idade;

        i++;
    }

     printf("A media das 20 idades e: %d\n", soma/20);
    
    return 0;
}