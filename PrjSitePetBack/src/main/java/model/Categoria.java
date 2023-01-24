package model;

public class Categoria {
	private int id;
	private String nome;
	private String descricao;
	
	
	public Categoria() {
		super();
	}


	public Categoria(int id, String nome, String des) {
		super();
		this.id = id;
		this.nome = nome;
		this.descricao = des;
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


	@Override
	public String toString() {
		return "Categoria [id=" + id + ", nome=" + nome + "]";
	}


	public String getDescricao() {
		return descricao;
	}


	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
	
	
}
