package agenda;
public class Contato {
    private String nome; //Atributo
    
    private String telefone; //Atributo
    
    private String email; //Atributo

    //Construtor sem parametros
    public Contato() {
        
    }
    //Construtor com parametros
    public Contato(String nome, String telefone, String email) {
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
    }
    //Métodos de acesso (usados para acessar e modificar os valores dos atributos privados)
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
