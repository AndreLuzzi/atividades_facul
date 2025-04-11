package br.com.andreluzzi.exercicio12;

12. Qual a saída do código abaixo?
class Teste {
int a = 5;
static int b = 10;
void incrementar() {
a++;
b++;
}
public static void main(String[] args) {
Teste t1 = new Teste();
Teste t2 = new Teste();
t1.incrementar();
t2.incrementar();
System.out.println(t1.a + " " + t2.a + " " + t1.b);
}

}

A) 6 6 12
B) 6 6 11
C) 6 6 10
D) 6 7 12

Resposta: Letra A
