#include <stdio.h>

//Funções
int soma(int n1,int n2){
    return n1+n2;
}

int subtracao(int n1,int n2){
    return n1-n2;
}

float aoQuadrado(int x){
    return x*x;
}

int ehPar(int num){
    if (num % 2 == 0){
        return 1;
    }else{
        return 0;
    }
}

int ehParSemElse(int num){
    if (num % 2 == 0){
        return 1;
    }
    return 0;
}

char* ehParString(int num){
    if (num % 2 == 0){
        return "par";
    }
    return "impar";
}

//Procedimento
void dizBoaNoite(){
    printf("Boa Noite");
}

void main(){
    int abobrinha;
    int ervilha;
    int resposta;
    printf("primeiro numero:");
    scanf("%d",&abobrinha);
    printf("\nsegundo numero:");
    scanf("%d",&ervilha);
    printf("\n");

    resposta = soma(abobrinha,ervilha);

    printf("resultado: %d\n", resposta);

    printf("Prova real: %d", subtracao(resposta,abobrinha));

    //testa parimpar
    int numero;
    printf("numero:");
    scanf("%d",&numero);
    printf("O numero %d eh %s. \n",numero, ehParString(numero));

    //chamada de um procedimento
    dizBoaNoite();

}