#include <stdio.h>

int main() {
    int A, B, total;

    printf("digite um numero ");
    scanf("%d", &A);
    printf("digite outro numero ");
    scanf("%d", &B);
    if (A == B){
        total= A + B;
    } 
    else{
        total= A * B;
    }
    printf("O resultado e %d", total);
    return 0;
}