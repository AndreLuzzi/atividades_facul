#include <stdio.h>

int main() {
    int A, B, C;

    printf("digite tres valores:\n");
    scanf("%d %d %d", &A, &B, &C);
    if (C < B && B < A){
        printf("%d %d %d", C, B, A);
    } 
    if (C < A && A < B ){
        printf("%d %d %d", C, A, B);
    }
     if (A < B && B < C){
        printf("%d %d %d", A, B, C);
    } 
    if (A < C && C < B ){
        printf("%d %d %d", A, C, B);
    }
     if (B < A && A < C){
        printf("%d %d %d", B, A, C);
    } 
    if (B < C && C < A ){
        printf("%d %d %d", B, C, A);
    }
    
    
    return 0;
}