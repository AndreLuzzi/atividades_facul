#include <stdio.h>

//exemplo de função
int fatorial(int num){
    if (num==1){
        return 1;
    }else{
        return num * fatorial(num-1);

    }
}

void main(){
    printf("fatorial(3)")
}