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
    printf("o resultado deu %d", total);
    return 0;
}
