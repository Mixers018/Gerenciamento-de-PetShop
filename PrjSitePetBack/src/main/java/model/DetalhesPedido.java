package model;

public class DetalhesPedido {
	private int ID_Produto;
	private int ID_Pedido;
	private String nome_Produto;
	private int quantidade;
	private double preco;
	
	
	
	public DetalhesPedido(int iD_Produto, int iD_Pedido, String nome_Produto, int quantidade, double preco) {
		super();
		this.ID_Produto = iD_Produto;
		this.ID_Pedido = iD_Pedido;
		this.nome_Produto = nome_Produto;
		this.quantidade = quantidade;
		this.preco = preco;
	}



	public DetalhesPedido() {
		super();
	}



	public int getID_Produto() {
		return ID_Produto;
	}



	public void setID_Produto(int iD_Produto) {
		ID_Produto = iD_Produto;
	}



	public int getID_Pedido() {
		return ID_Pedido;
	}



	public void setID_Pedido(int iD_Pedido) {
		ID_Pedido = iD_Pedido;
	}



	public int getQuantidade() {
		return quantidade;
	}



	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}



	public double getPreco() {
		return preco;
	}



	public void setPreco(double preco) {
		this.preco = preco;
	}



	public String getNome_Produto() {
		return nome_Produto;
	}



	public void setNome_Produto(String nome_Produto) {
		this.nome_Produto = nome_Produto;
	}
	
}
