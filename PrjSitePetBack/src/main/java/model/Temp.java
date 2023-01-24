package model;

public class Temp {
	private int id;
	private int idProd;
	private int idCliente;
	private String nome;
	private int qtd;
	private int qtdProd;
	private double preco;
	private double total;
	private String imageProd;
	
	
	public Temp() {
		super();
	}





	public Temp(int id, int idProd, int idCliente, String nome, int qtd, int qtdProd, double preco, double total, String ImageProd) {
		super();
		this.id = id;
		this.idProd = idProd;
		this.idCliente = idCliente;
		this.nome = nome;
		this.qtd = qtd;
		this.qtdProd = qtdProd;
		this.preco = preco;
		this.total = total;
		this.imageProd = ImageProd;
	}





	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getIdProd() {
		return idProd;
	}


	public void setIdProd(int idProd) {
		this.idProd = idProd;
	}


	public int getIdCliente() {
		return idCliente;
	}


	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public int getQtd() {
		return qtd;
	}


	public void setQtd(int qtd) {
		this.qtd = qtd;
	}


	public double getPreco() {
		return preco;
	}


	public void setPreco(double preco) {
		this.preco = preco;
	}


	public double getTotal() {
		return total;
	}


	public void setTotal(double total) {
		this.total = total;
	}


	public int getQtdProd() {
		return qtdProd;
	}


	public void setQtdProd(int qtdProd) {
		this.qtdProd = qtdProd;
	}





	public String getImageProd() {
		return imageProd;
	}





	public void setImageProd(String imageProd) {
		this.imageProd = imageProd;
	}
	
	
	
	
	
	
	

}
