package model;

public class ProdutosRegistrados {
    private int id;
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

    @Override
    public String toString() {
        return "ProdutosRegistrados{" + "id=" + id + ", data=" + data + ", endereco=" + endereco + '}';
    }

    
    
   }
