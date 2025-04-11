package br.com.andreluzzi.exercicio11;

11. Diferença entre Atributos de Instância e de Classe
Considere a classe abaixo:
class Exemplo {
static int contador = 0;
int valor = 10;
}

O que acontece se criarmos duas instâncias de Exemplo e modificarmos contador?
A) Cada instância terá seu próprio contador separado.
B) O valor de contador será compartilhado entre todas as instâncias.
C) contador não pode ser alterado.
D) contador é criado toda vez que uma instância é criada.

Resposta: Letra B