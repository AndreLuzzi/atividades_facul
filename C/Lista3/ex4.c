#include <stdio.h>

int main() {
    int numero, total;

    printf("digite um numero ");
    scanf("%d", &numero);
    if (numero >= 0){
        total= numero*2;
         printf("seu numero e positivo e seu dobro e %d", total);
    }
    else{
        total= numero*3;
        printf("seu numero e negativo e seu triplo e %d",total);
    }
    
    return 0;
}