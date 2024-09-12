#include <stdio.h>

int main() {
    int numero, total;

    printf("digite um numero ");
    scanf("%d", &numero);
    if (numero %2==0){
        total= numero+5;
    }
    else{
        total= numero+8;
    }
    printf("seu numero e par e somando 5 da %d", total);
    return 0;
}
