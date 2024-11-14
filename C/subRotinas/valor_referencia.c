#include <stdio.h>

void aumentarValor(int x){
    x = x + 1 ;
    printf("aumentar valor x = %d \n",x);
}

void aumentarRef(int* x){
    *x = *x + 1;
    printf("aumentar referencia x = %d \n",*x);
}


int main(){
   int a=10;
   aumentarValor(a);
   printf("main a por valor = %d \b",a);

   aumentarRef(&a);
   printf("main a por referencia = %d ",a);

    return 0;
}