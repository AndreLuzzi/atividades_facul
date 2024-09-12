#include <stdio.h>

int main() {
    int numero;

    printf("digite um numero ");
    scanf("%d", &numero);
    if (numero %2==0 ){
        printf("O numero e par %d", numero);
    } 
    else{
        printf("O numero e impar %d", numero);
    }
    
    return 0;
}