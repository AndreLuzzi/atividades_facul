package br.com.andreluzzi.exercicio2;

public class Principal {
    public static void main(String[] args) {
        ContaBancaria conta = new ContaBancaria();
        conta.setNumerodaConta("7654321");
        conta.setSaldo(1000);
        conta.setTitular("Klebinho");

        System.out.println("Titular da conta: " + conta.getTitular());
        System.out.println("Numero da conta: " + conta.getNumerodaConta());
        System.out.println("Saldo: " + conta.getSaldo());
    }
}
