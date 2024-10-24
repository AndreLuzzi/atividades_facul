#include <stdio.h>

void main(){
    int matriz[4][5];

    for (int l=0;l<4;l++){
        for (int c=0;c<5;c++){
            printf("matriz[%d][%d]:",l,c);
            scanf("%d",&matriz [l][c]);
        }
    }


}
