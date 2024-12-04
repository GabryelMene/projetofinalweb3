package model;


public class Produto {
    private int id;
    private String nome, marca, modelo, imagem, descricao, endereco; 
    private double preco; 
    
    public Produto(int id, String nome, String marca, String modelo, String descricao, String imagem, String endereco,double preco) {
        this.id = id;
        this.nome = nome;
        this.marca = marca;
        this.modelo = modelo;
        this.descricao = descricao;
        this.imagem = imagem;
        this.endereco = endereco;
        this.preco = preco;
    }
    
    public Produto(int id, String nome, String marca, String modelo, String descricao, String imagem,double preco) {
        this.id = id;
        this.nome = nome;
        this.marca = marca;
        this.modelo = modelo;
        this.descricao = descricao;
        this.imagem = imagem;
        this.preco = preco;
    }
    
    public Produto() {}

    public Produto(int id, String nome, String endereco) {
        this.id = id;
        this.nome = nome;
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

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }
    
    @Override 
    public String toString() {
        return "ID: " + id + " nome: " + nome; 
    }
    
    public String toImage() {
        return imagem; 
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
}
