package br.com.andreluzzi.exerciciop2;

public class PincipalContaBancaria {

    public static void main(String[] args) {
        // Cria um objeto da classe ContaBancaria
        ContaBancaria conta = new ContaBancaria();

        // Usando os setters para atribuir valores aos atributos
        conta.setNumeroDaConta("12345-6");
        conta.setTitular("João Silva");
        conta.setSaldo(5000.75);

        // Usando os getters para exibir os valores
        System.out.println("Número da Conta: " + conta.getNumeroDaConta());
        System.out.println("Titular: " + conta.getTitular());
        System.out.println("Saldo: R$ " + conta.getSaldo());
    }
}
