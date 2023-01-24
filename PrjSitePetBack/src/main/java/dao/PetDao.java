package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Pet;

public class PetDao {
	public void inserir(Pet pet) throws ClassNotFoundException, IOException {
        String sqlInsert = "INSERT INTO tblPet(ID_Cliente,Nome,Especie,Raca,Sexo,Vacina) VALUES(?,?,?,?,?,CONVERT(varbinary(max), ?))";
        // usando o try with resources do Java 7, que fecha o que abriu
        try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
            stm.setInt(1, pet.getIdCliente());
        	stm.setString(2, pet.getNome());
            stm.setString(3, pet.getEspecie());
            stm.setString(4, pet.getRaca());
            stm.setString(5, pet.getSexo());
            stm.setString(6, pet.getVacina());
            stm.execute();
            String sqlQuery = "SELECT SCOPE_IDENTITY();";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();){
				if (rs.next()) {
					pet.setId(rs.getInt(1));
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	
	
	
	@SuppressWarnings("null")
	public Pet getPet(Pet pet) throws SQLException{
		String query = "select * from tblPet where ID_Cliente = ?";
		
		try (Connection conn = new ConnectionFactory().conexao(); PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setInt(1, pet.getId());	
			try (ResultSet rs = stm.executeQuery();) {
                if (rs.next()) {
                	
              	  	pet.setId(rs.getInt("ID"));
              	  	pet.setIdCliente(rs.getInt("ID_Cliente"));
              	  	pet.setNome(rs.getString("Nome"));
              	  	pet.setRaca(rs.getString("Raca"));
              	  	pet.setSexo(rs.getString("Sexo"));
              	  	pet.setEspecie(rs.getString("Especie"));
              	  	pet.setVacina(rs.getString("Vacina"));
                   
                    
                } else {
                	pet.setEspecie(null);
              	  	pet.setId((Integer) null);
              	  	pet.setIdCliente((Integer) null);
              	  	pet.setNome(null);
              	  	pet.setRaca(null);
              	  	pet.setSexo(null);
              	  	
                }
            } catch (SQLException e) {
            	e.getMessage();
            }
			
		}catch (Exception e) {
            e.getMessage();
		}
		return pet;
	}
	
	
	public List<Pet> ListGetPet(int idCliente) throws ClassNotFoundException, SQLException {
		List<Pet> pet = new ArrayList<Pet>();
		String query = "select * from tblPet where ID_Cliente = ?";
		
		try(Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(query)) {
			stm.setInt(1, idCliente);
			try(ResultSet rs = stm.executeQuery()){
				while(rs.next()) {
					Pet row = new Pet();
					row.setId(rs.getInt("ID"));
					row.setIdCliente(rs.getInt("ID_Cliente"));
					row.setNome(rs.getString("Nome"));
					row.setRaca(rs.getString("Raca"));
					row.setSexo(rs.getString("Sexo"));
					row.setEspecie(rs.getString("Especie"));
					row.setVacina(rs.getString("Vacina"));;
					
					pet.add(row);
				}
			}catch(Exception e){
				e.getMessage();
			}
		}catch(Exception e) {
			e.getMessage();
		}
		return pet;
	}
	
	
	public List<Pet> excluirPet(int idP) {
		List<Pet> pet = new ArrayList<Pet>();
		String sqlDelete = "DELETE FROM tblPet WHERE ID = ?";
		try (Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idP);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pet;
	}
	
	
	
	public String verificarPet(String nome, String especie, String raca, String sexo, int idCliente, Connection conexao) throws SQLException{
        String query = "SELECT ID FROM tblPet WHERE Nome =? AND Especie = ? AND Raca = ? AND Sexo = ? AND Id_Cliente = ?";
        try(PreparedStatement ps = conexao.prepareStatement(query)){
            ps.setString(1, nome);
            ps.setString(2, especie);
            ps.setString(3, raca);
            ps.setString(4, sexo);
            ps.setInt(5, idCliente);
            try(ResultSet rs = ps.executeQuery()){
                if(rs.next()){
                    return rs.getString("ID");
                }
            }
        }
        return null;
	}
	
	
	public void excluirPetC(int idCliente) {
		String sqlDelete = "DELETE FROM tblPet WHERE ID_Cliente = ?";
		try (Connection conn = new ConnectionFactory().conexao();
			PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idCliente);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
