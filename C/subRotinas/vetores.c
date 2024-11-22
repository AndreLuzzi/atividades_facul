#include <stdio.h>

void leVetorInteiro(int vetor[], int tamanho){
    for(int i = 0; i < tamanho; i++) {
        printf("[%d]= ", i);
        scanf("%d", &vetor[i]);    
    }
}

void escreveVetorInteiro(int vetor[], int tamanho){
    for(int i = 0; i < tamanho; i++) {
        printf("[%d]= %d\n", i, vetor[i]);
    }
}
//questao 12
void vetFibonacci(int vetor[],int tamanho){
    vetor[0]=0;
    vetor[1]=1;
    for (int i=2;i<tamanho;i++){
        vetor[i] = vetor[i-1]+vetor[i-2];
    }
}

void main(){
    int tam = 10;
    int vet[tam];

    vetFibonacci(vet,tam);
    escreveVetorInteiro(vet,tam);
}