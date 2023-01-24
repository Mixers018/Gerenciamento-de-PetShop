package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Categoria;
public class CategoriaDao {
	
	public List<Categoria> getAllCategoria(){
		List<Categoria> ser = new ArrayList<Categoria>();
			String query = "select * from tblCategoria";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Categoria row = new Categoria();
				row.setId(rs.getInt("ID"));
				row.setNome(rs.getString("Nome"));
				row.setDescricao(rs.getString("Descricao"));
				
				
				ser.add(row);
			}
			
		}catch (Exception e) {
			e.getMessage();
		}
		return ser;
	}
	
	
	public List<Categoria> getForNumber(int idCategoria){
		List<Categoria> ser = new ArrayList<Categoria>();
		String query = "select * from tblCategoria where ID = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setInt(1, idCategoria);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Categoria row = new Categoria();
				row.setId(rs.getInt("ID"));
				row.setDescricao(rs.getString("Descricao"));
				row.setNome(rs.getString("Nome"));

				
				ser.add(row);
			}
			
		}catch (Exception e) {
			e.getMessage();
		}
		return ser;
	}
	

}
