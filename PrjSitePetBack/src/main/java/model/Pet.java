package model;

public class Pet {
	private int id;
	private int idCliente;
	private String nome;
	private String raca;
	private String especie;
	private String sexo; // M - Masculino F-Feminino
	private String vacina; //Foto das vacinas
	
	
	public Pet() {
		super();
	}



	public Pet(int id, int idCliente, String nome, String raca, String sexo,String especie, String vacina) {
		super();
		this.id = id;
		this.idCliente = idCliente;
		this.nome = nome;
		this.raca = raca;
		this.sexo = sexo;
		this.vacina = vacina;
		this.especie = especie;
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



	public String getNome() {
		return nome;
	}



	public void setNome(String nome) {
		this.nome = nome;
	}



	public String getRaca() {
		return raca;
	}



	public void setRaca(String raca) {
		this.raca = raca;
	}



	public String getSexo() {
		return sexo;
	}



	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	

	public String getVacina() {
		return vacina;
	}



	public void setVacina(String vacina) {
		this.vacina = vacina;
	}
	

	public String getEspecie() {
		return especie;
	}



	public void setEspecie(String especie) {
		this.especie = especie;
	}



	@Override
	public String toString() {
		return "Pet [id=" + id + ", idCliente=" + idCliente + ", nome=" + nome + ", raca=" + raca + ", especie="
				+ especie + ", sexo=" + sexo + ", vacina=" + vacina + "]";
	}
	
	
	
}
