#include <stdio.h>

int main() {
    float A, B;

    printf("digite o valor de A ");
    scanf("%f", &A);
    printf("digite o valor de B ");
    scanf("%f", &B);
    if (A > B){
        printf("O maior valor e %.2f", A);
    } 
    else if (B > A){
        printf("O maior valor e %.2f", B);
    }
    
    return 0;
}
