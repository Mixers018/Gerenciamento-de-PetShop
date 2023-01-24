package model;

import java.util.Date;

public class Servico {
	private int id;
	private String nome;
	private String hora;
	private Date dia;
	private Date saida;
	private String descricao;
	private double preco;
	private String tipo;
	
	
	public Servico() {
		super();
	}
	
	
	public Servico(int id, String nome, String hora, Date dia, Date saida, String descricao, double preco,
			String tipo) {
		super();
		this.id = id;
		this.nome = nome;
		this.hora = hora;
		this.dia = dia;
		this.saida = saida;
		this.descricao = descricao;
		this.preco = preco;
		this.tipo = tipo;
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


	public String getHora() {
		return hora;
	}


	public void setHora(String hora) {
		this.hora = hora;
	}


	public Date getDia() {
		return dia;
	}


	public void setDia(Date dia) {
		this.dia = dia;
	}


	public Date getSaida() {
		return saida;
	}


	public void setSaida(Date saida) {
		this.saida = saida;
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


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	@Override
	public String toString() {
		return "Servico [id=" + id + ", nome=" + nome + ", hora=" + hora + ", dia=" + dia + ", saida=" + saida
				+ ", descricao=" + descricao + ", preco=" + preco + ", tipo=" + tipo + "]";
	}
	
	
	
	
}
