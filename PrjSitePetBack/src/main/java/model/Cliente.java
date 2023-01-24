package model;

public class Cliente {
	private String nome;
	private String email;
	private String cpf;
	private String cep;
	private String telefone;
	private String senha;
	private int id;
	private String image; //Base 64
	private byte[] img;
	private String pagamento;
	private int cartao;


	public Cliente() {
		
	}

	
	public Cliente(String nome, String email, String cpf, String cep, String telefone, String senha, int id,
			String image, byte[] img, String pagamento, int cartao) {
		super();
		this.nome = nome;
		this.email = email;
		this.cpf = cpf;
		this.cep = cep;
		this.telefone = telefone;
		this.senha = senha;
		this.id = id;
		this.image = image;
		this.img = img;
		this.pagamento = pagamento;
		this.cartao = cartao;
	}


	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String b) {
		this.image = b;
	}

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}

	public String getPagamento() {
		return pagamento;
	}

	public void setPagamento(String pagamento) {
		this.pagamento = pagamento;
	}

	public int getCartao() {
		return cartao;
	}

	public void setCartao(int cartao) {
		this.cartao = cartao;
	}
	
	
	
	
	
	
	
	
}
