#include <stdio.h>

//procedimento
void leVetorInteiro(int vetor[], int tamanho){
    for(int i=0;i < tamanho;i++){
        printf("[%d]= ",i);
        scanf("%d",&vetor[i]);    
    }
}

void escreveVetorInteiro(int vetor[], int tamanho){
    for(int i=0;i < tamanho;i++){
        printf("[%d]= %d\n",i,vetor[i]);
    }
}

void main(){
    int tam;
    printf("Informe o tamanho do vetor: ");
    scanf("%d", &tam);
    int meuVetor[tam];
    
    leVetorInteiro(meuVetor,tam);
    escreveVetorInteiro(meuVetor,tam);
}