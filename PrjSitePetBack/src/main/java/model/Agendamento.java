package model;

import java.util.Date;

public class Agendamento {
	private int id;
	private int idCliente;
	private int idServico;
	private int idPet;
	private String nomeServico;
	private String nomePet;
	private String hora;
	private Date data;
	private String descricao;
	private double valor;
	
	
	public Agendamento() {
		super();
	}
	
	
	public Agendamento(int id, int idCliente, int idServico, int idPet, String nomeServico, String nomePet, String hora, Date data, String descricao, double valor) {
		super();
		this.id = id;
		this.idCliente = idCliente;
		this.idServico = idServico;
		this.idPet = idPet;
		this.nomeServico = nomeServico;
		this.nomePet = nomePet;
		this.hora = hora;
		this.data = data;
		this.descricao = descricao;
		this.valor = valor;
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

	public int getIdServico() {
		return idServico;
	}

	public void setIdServico(int idServico) {
		this.idServico = idServico;
	}

	public int getIdPet() {
		return idPet;
	}

	public void setIdPet(int idPet) {
		this.idPet = idPet;
	}
	
	public String getNomeServico() {
		return nomeServico;
	}

	public void setNomeServico(String nomeServico) {
		this.nomeServico = nomeServico;
	}
	
	public String getNomePet() {
		return nomePet;
	}

	public void setNomePet(String nomePet) {
		this.nomePet = nomePet;
	}
	
	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}
	
	
	@Override
	public String toString() {
		return "Pedido [id=" + id + ", hora=" + hora + ", data=" + data + ", descricao=" + descricao + ", valor=" + valor + "]";
	}
	
}
