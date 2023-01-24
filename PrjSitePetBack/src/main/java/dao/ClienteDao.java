package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import model.Cliente;

public class ClienteDao {
    public void criar(Cliente cliente) throws ClassNotFoundException, IOException {
        String sqlInsert = "INSERT INTO tblCliente (Nome, Email, CPF, Telefone, Senha, Cep, ImgCli) VALUES(?,?,?,?,?,?,?)";
        // usando o try with resources do Java 7, que fecha o que abriu
        try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
            stm.setString(1, cliente.getNome());
            stm.setString(2, cliente.getEmail());
            stm.setString(3, cliente.getCpf());
            stm.setString(4, cliente.getTelefone());
            stm.setString(5, cliente.getSenha());
            stm.setString(6, cliente.getCep());
			stm.setString(7, cliente.getImage());

            stm.execute();
            String sqlQuery = "SELECT SCOPE_IDENTITY();";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();){
				if (rs.next()) {
					cliente.setId(rs.getInt(1));
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    public Cliente carregar(Cliente cliente) throws ClassNotFoundException {
          String sqlSelect = "SELECT * FROM tblCliente WHERE Email = ? and Senha = ?";
          // usando o try with resources do Java 7, que fecha o que abriu
          try (Connection conn = new ConnectionFactory().conexao();
                  PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
              stm.setString(1, cliente.getEmail());
              stm.setString(2, cliente.getSenha());
              try (ResultSet rs = stm.executeQuery();) {
                  if (rs.next()) {
                	  cliente.setTelefone(rs.getString("Telefone"));
                	  cliente.setCep(rs.getString("Cep"));
                	  cliente.setCpf(rs.getString("Cpf"));
                	  cliente.setNome(rs.getString("Nome"));
                      cliente.setSenha(rs.getString("Senha"));
                      cliente.setCartao(rs.getInt("cartao"));
                      cliente.setPagamento(rs.getString("Pagamento"));
                      cliente.setEmail(rs.getString("Email"));
                      cliente.setImage(rs.getString("ImgCli"));
                  } else {
                	  cliente.setTelefone(null);
                	  cliente.setCep(null);
                	  cliente.setCpf(null);
                	  cliente.setNome(null);
                	  cliente.setCartao(0);
                      cliente.setPagamento(null);
                      cliente.setSenha(null);
                      cliente.setEmail(null);
                      cliente.setImage(null);
                  }
              } catch (SQLException e) {
                  e.printStackTrace();
              }
          } catch (SQLException e1) {
              System.out.print(e1.getStackTrace());
          }
          return cliente;
      }
 
    public boolean EmailCadastrado(String email) throws SQLException, ClassNotFoundException{
        String query = "SELECT Email FROM tblCliente WHERE Email = ?";
        try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
        	stm.setString(1, email);
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()){
                    return true;
                }
            }
        }
        return false;
    }
    
    
    
    public boolean VerificaCPF(String cpf) throws SQLException, ClassNotFoundException{
        String query = "SELECT CPF FROM tblCliente WHERE CPF = ?";
        try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
        	stm.setString(1, cpf);
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()){
                    return true;
                }
            }
        }
        return false;
    }
    
    
    
    
    public String verificarEmailCadastrado(String email, Connection conexao) throws SQLException{
        String query = "SELECT Email FROM tblCliente WHERE Email = ?";
        try(PreparedStatement ps = conexao.prepareStatement(query)){
            ps.setString(1, email);
            try(ResultSet rs = ps.executeQuery()){
                if(rs.next()){
                    return rs.getString("Email");
                }
            }
        }
        return null;
    }
    
    
    
	public int loginCliente(Cliente cliente) {
		int resultado = 0;
		String sqlLoginCliente = "Select COUNT(*) FROM tblCliente WHERE Email = ? and Senha = ?";
		try(Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlLoginCliente)) {
			stm.setString(1, cliente.getEmail());
			stm.setString(2, cliente.getSenha());
			try(ResultSet rs = stm.executeQuery();){
				if(rs.next()) {
					resultado = rs.getInt(1);
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
	public String encodeImage(String imgPath) throws Exception {
		String codificado  = Base64.getEncoder().encodeToString(imgPath.getBytes());
		return codificado;
	}
	
	public byte[] decodeImage(String varbinary) {
		byte[] img = Base64.getDecoder().decode(varbinary);
		return img;
	}
	
	
public Cliente getCliente(Cliente cliente) throws SQLException{
		String query = "select * from tblCliente where Email= ?";
		
		try (Connection conn = new ConnectionFactory().conexao(); PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setString(1, cliente.getEmail());	
			try (ResultSet rs = stm.executeQuery();) {
                if (rs.next()) {
                	cliente.setId(rs.getInt("ID"));
              	  	cliente.setTelefone(rs.getString("Telefone"));
              	  	cliente.setCep(rs.getString("Cep"));
              	  	cliente.setCpf(rs.getString("Cpf"));
              	  	cliente.setNome(rs.getString("Nome"));
                    cliente.setSenha(rs.getString("Senha"));
                    cliente.setCartao(rs.getInt("cartao"));
                    cliente.setPagamento(rs.getString("Pagamento"));
                    cliente.setEmail(rs.getString("Email"));
                    byte[] img = decodeImage(rs.getString("ImgCli"));
                    
                    cliente.setImg(img);
                    System.out.println("Buscando var binary " + rs.getString("ImgCli") );
                    System.out.println("Buscando byte " + cliente.getImg() );
                   
                    
                } else {
              	  cliente.setTelefone(null);
              	  cliente.setCep(null);
              	  cliente.setCpf(null);
              	  cliente.setNome(null);
                    cliente.setSenha(null);
                    cliente.setCartao(0);
                    cliente.setPagamento(null);
                    cliente.setEmail(null);
                    cliente.setImage(null);
                }
            } catch (SQLException e) {
            	e.getMessage();
            }
			
		}catch (Exception e) {
            e.getMessage();
		}
		return cliente;
	
			
	}
	
	

	public void excluirCliente(int idCliente) {
		String sqlDelete = "DELETE FROM tblCliente WHERE ID = ?";
		try (Connection conn = new ConnectionFactory().conexao();
			PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idCliente);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void alterarNome(String nomeCli, int idCli) {
		String sqlUpdate = "UPDATE tblCliente SET Nome = ? WHERE ID = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, nomeCli);
			stm.setInt(2, idCli);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void alterarEmail(String email, int idCliente) {
		String sqlUpdate = "UPDATE tblCliente SET Email = ? WHERE ID = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, email);
			stm.setInt(2, idCliente);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void alterarSenha(String senhaN, int idCli) {
		String sqlUpdate = "UPDATE tblCliente SET Senha = ? WHERE ID = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, senhaN);
			stm.setInt(2, idCli);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void alterarFotoPerfil(String image, int idCli) {
		String sqlUpdate = "UPDATE tblCliente SET ImgCli = ? WHERE ID = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, image);
			stm.setInt(2, idCli);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public Cliente atualizar(Cliente cliente) throws ClassNotFoundException {
        String sqlSelect = "SELECT * FROM tblCliente WHERE ID = ?";
    
        try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
            stm.setInt(1, cliente.getId());
            try (ResultSet rs = stm.executeQuery();) {
                if (rs.next()) {
              	  cliente.setTelefone(rs.getString("Telefone"));
              	  cliente.setCep(rs.getString("Cep"));
              	  cliente.setCpf(rs.getString("Cpf"));
              	  cliente.setNome(rs.getString("Nome"));
                  cliente.setSenha(rs.getString("Senha"));
                  cliente.setCartao(rs.getInt("cartao"));
                  cliente.setPagamento(rs.getString("Pagamento"));
                  cliente.setEmail(rs.getString("Email"));
                } else {
              	  cliente.setTelefone(null);
              	  cliente.setCep(null);
              	  cliente.setCpf(null);
              	  cliente.setNome(null);
              	  cliente.setCartao(0);
              	  cliente.setPagamento(null);
                    cliente.setSenha(null);
                    cliente.setEmail(null);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e1) {
            System.out.print(e1.getStackTrace());
        }
        return cliente;
    }


	public void inserirCartao(int idCliente, String cartao, int numeroCartao) throws ClassNotFoundException {
		Cliente cliente = new Cliente();
		String sqlInsert = "Update tblCliente SET cartao = ?, Pagamento = ? where ID = ?";
        // usando o try with resources do Java 7, que fecha o que abriu
        try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
        	stm.setInt(1, numeroCartao);
        	stm.setString(2, cartao);
            stm.setInt(3, idCliente);

            stm.execute();
            String sqlQuery = "SELECT SCOPE_IDENTITY();";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();){
				if (rs.next()) {
					cliente.setId(rs.getInt(1));
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}

        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}
}
 
	


