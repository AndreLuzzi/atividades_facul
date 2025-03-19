
/* TAD: Ponto (x,y) */
/* Tipo exportado */

typedef struct ponto Ponto;
/* Funções exportadas */
/* Função cria
** Aloca e retorna um ponto com coordenadas (x, y)
*/

Ponto* cria (float x, float y);
/* Função libera
** Libera a memória de um ponto previamente criado.
*/

void libera (Ponto* p) ;
/* Função acessa
** Devolve os valores das coordenadas de um ponto
*/

void acessa (Ponto* p, float* x, float* y);
/* Função atribui
** Atribui novos valores às coordenadas de um ponto
*/

void atribui (Ponto* p, float x, float y);
/* Função distancia
** Retorna a distância entre dois pontos 
*/

float distancia (Ponto* p1, Ponto* p2);

#include <stdlib.h> /*malloc, free, exit*/
#include <stdio.h> /*printf*/
#include <math.h> /*sqrt*/
#include "ponto.h

struct ponto {
float x;
float y;
};

Ponto* cria (float x, float y) {
Ponto* p = (Ponto*) malloc(sizeof(Ponto));
if (p == NULL) {
printf("Memória insuficiente!\n");
exit(1);
}
p->x = x;
p->y = y;
return p;
}