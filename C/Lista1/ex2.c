#include <stdio.h>

 void main(){
    int n1,n2,n3,soma,media;
    printf("Informe 3 numeros \n");
    printf("n1: ");
    scanf("%d", &n1);
    printf("\nn2: ");
    scanf("%d",&n2);
     printf("\nn3: ");
    scanf("%d",&n3);
    soma=(n1+n2+n3);
    media=(soma/3);
    printf("Sua media:%d",media);
}