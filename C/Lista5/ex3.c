#include <stdio.h>

void main(){
    char nome;
    printf("Digite o seu nome: ");
    scanf("%s",&nome);

    for (int nome=1;nome<=10;nome++){
        printf("%s\n",nome);
    }
}