#include <stdio.h>

void main(){
    char nome[30];
    int numero;
    int i = 1;

    printf("Digite o seu nome: ");
    scanf("%s",nome);

    printf("Agora informe um numero; ");
    scanf("%d",&numero);

    while (i <= numero) { 
        printf("%s\n",nome);
        i++;
    }
    
    return 0;
}
