#include <stdio.h>

 void main(){
    int base,altura,soma,area;
    printf("Informe a base e a altura do triangulo \n");
    printf("base: ");
    scanf("%d", &base);
    printf("\naltura: ");
    scanf("%d",altura);
    soma=(base*altura);
    area=(soma/2);
    printf("Area do triangulo:%d",area);
}