package model;

public class Produtos {
    private int id;
    private String nome;
    private String imagem;
    private String marca;
    private String modelo;
    private String descricao;
    private String endereco;
    private String preco;

    public Produtos() {
    }

    public Produtos(String nome, String imagem, String marca, String modelo, String descricao, String endereco, String preco) {
        this.nome = nome;
        this.imagem = imagem;
        this.marca = marca;
        this.modelo = modelo;
        this.descricao = descricao;
        this.endereco = endereco;
        this.preco = preco;
    }
    
    
    
    public Produtos(int id, String nome, String imagem, String marca, String modelo, String descricao, String endereco, String preco) {
        this.id = id;
        this.nome = nome;
        this.imagem = imagem;
        this.marca = marca;
        this.modelo = modelo;
        this.descricao = descricao;
        this.endereco = endereco;
        this.preco = preco;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }

    @Override
    public String toString() {
        return "Produtos{" + "id=" + id + ", nome=" + nome + ", imagem=" + imagem + ", marca=" + marca + ", modelo=" + modelo + ", descricao=" + descricao + ", endereco=" + endereco + ", preco=" + preco + '}';
    }

   
}
