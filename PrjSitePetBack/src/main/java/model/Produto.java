package model;

import java.util.Date;

public class Produto {
	private int id;
	private String descricao;
	private String nome;		
	private Date fabricacao;	
	private Date validade;	
	private double peso;
	private double preco;
	private int quantidade;
	private int idFornecedor;
	private int idCategoria;
	private String imageProd;
	
	
	
	
	public Produto() {
		super();
	}


	public Produto(int id, String descricao, String nome, Date fabricacao, Date validade, double peso, double preco,
			int quantidade, int idFornecedor, int idCategoria, String imageProd) {
		super();
		this.id = id;
		this.descricao = descricao;
		this.nome = nome;
		this.fabricacao = fabricacao;
		this.validade = validade;
		this.peso = peso;
		this.preco = preco;
		this.quantidade = quantidade;
		this.idFornecedor = idFornecedor;
		this.idCategoria = idCategoria;
		this.imageProd = imageProd;
	}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getDescricao() {
		return descricao;
	}


	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public Date getFabricacao() {
		return fabricacao;
	}


	public void setFabricacao(Date fabricacao) {
		this.fabricacao = fabricacao;
	}


	public Date getValidade() {
		return validade;
	}


	public void setValidade(Date validade) {
		this.validade = validade;
	}


	public double getPeso() {
		return peso;
	}


	public void setPeso(double peso) {
		this.peso = peso;
	}


	public double getPreco() {
		return preco;
	}


	public void setPreco(double preco) {
		this.preco = preco;
	}


	public int getQuantidade() {
		return quantidade;
	}


	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public int getIdFornecedor() {
		return idFornecedor;
	}


	public void setIdFornecedor(int idFornecedor) {
		this.idFornecedor = idFornecedor;
	}


	public int getIdCategoria() {
		return idCategoria;
	}


	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
	

	public String getImageProd() {
		return imageProd;
	}


	public void setImageProd(String imageProd) {
		this.imageProd = imageProd;
	}


	@Override
	public String toString() {
		return "Produto [descricao=" + descricao + ", nome=" + nome + ", fabricacao=" + fabricacao + ", validade="
				+ validade + ", peso=" + peso + ", preco=" + preco + ", quantidade=" + quantidade + "]";
	}

	
	
	
}
