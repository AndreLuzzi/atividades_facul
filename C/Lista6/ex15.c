#include <stdio.h>

void main(){
    int matriz[6][6];

    for(int l=0;l<6;l++){
        for(int c=0;c<6;c++){
            printf("matriz[%d][%d]:",l,c);
            scanf("%d",&matriz[l][c]);
        }
    }

    int soma = 0;
    for(int i=0;i<6;i++){
        soma = soma + matriz[i][i];
    }

    for(int l=0;l<6;l++){
        for(int c=0;c<6;c++){
            printf("%d",matriz[l][c]);
        }
        printf("\n");
    }

    printf("\n %d",soma);

}