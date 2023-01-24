package model;


public class Pedido {
	private int id;
	private int idCliente;
	
	
	public Pedido() {
		super();
	}
	
	
	public Pedido(int id, int idCliente) {
		super();
		this.id = id;
		this.idCliente = idCliente;;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getIdCliente() {
		return idCliente;
	}


	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}


}
