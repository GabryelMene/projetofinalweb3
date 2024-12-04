package model;

public class Venda {
    private int id;
    private int idUsuario;
    private String nomeUsuario; 
    private int idProduto; 
    private String nomeProduto; 

    public Venda(int id, int idUsuario, String nomeUsuario ,  int idProduto, String nomeProduto) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.nomeUsuario = nomeUsuario;
        this.idProduto = idProduto;
        this.nomeProduto = nomeProduto; 
    }

    public Venda() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }
}
