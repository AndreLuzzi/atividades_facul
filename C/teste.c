#include <stdio.h>

void main(){
    int n1,n2;
    printf("Informe 2 numeros \n");
    printf("n1: ");
    scanf("%d", &n1);
    printf("\n n2: ");
    scanf("%d",&n2);

    while (n1<=n2)
    {
        printf("%d",n1);
        n1 = n1+1;
    }
    
}