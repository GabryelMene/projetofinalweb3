package model;

public class ProdutosRegistrados {
    private int id;
    private int idUsuario;
    private int idProduto;
    private String nomeUsuario; 
    private String nomeProduto; 
    private String data;
    private String endereco;

    public ProdutosRegistrados() {
    }

    public ProdutosRegistrados(String endereco) {
        this.endereco = endereco;
    }

    public ProdutosRegistrados(int id, String endereco) {
        this.id = id;
        this.endereco = endereco;
    }

    public ProdutosRegistrados(int id, String data, String endereco) {
        this.id = id;
        this.data = data;
        this.endereco = endereco;
    }

    public ProdutosRegistrados(int id, int idUsuario, String nomeUsuario, String data, String endereco) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.nomeUsuario = nomeUsuario;
        this.data = data;
        this.endereco = endereco;
    }
    
     public ProdutosRegistrados(int idUsuario, String nomeUsuario, String nomeProduto ,int idProduto, String endereco) {
        this.idUsuario = idUsuario;
        this.nomeUsuario = nomeUsuario;
        this.nomeProduto = nomeProduto;
        this.idProduto = idProduto; 
        this.endereco = endereco;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }
    
    
    
    

    @Override
    public String toString() {
        return "ProdutosRegistrados{" + "id=" + id + ", data=" + data + ", endereco=" + endereco + '}';
    }

    
    
   }