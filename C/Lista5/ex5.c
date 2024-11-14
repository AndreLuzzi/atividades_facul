#include <stdio.h>

void main(){
    int numero;
    int i = 1;
    int soma = 0;

    while (i <= 10) { 
        printf("Digite o numero %d\n",i);
        scanf("%d", &numero);

        soma += numero;

        i++;
    }

     printf("A soma dos 10 números é: %d\n", soma);
    
    return 0;
}

