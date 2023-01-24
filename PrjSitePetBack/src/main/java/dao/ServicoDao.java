package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.*;

public class ServicoDao {
	public List<Servico> getAllServico() throws SQLException{
		
		List<Servico> ser = new ArrayList<Servico>();
		String query = "select * from tblServico where ID > 1";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				Servico row = new Servico();
				row.setId(rs.getInt("ID"));
				row.setNome(rs.getString("Nome"));
				row.setHora(rs.getString("Hora"));
				row.setDia(rs.getDate("Dia"));
				row.setSaida(rs.getDate("Saida"));
				row.setDescricao(rs.getString("Descricao"));
				row.setPreco(rs.getDouble("Preco"));
				row.setTipo(rs.getString("Tipo"));

				ser.add(row);
			}
			
		}catch (Exception e) {
            e.printStackTrace();
		}
		return ser;
	
			
	}
	
	public List<Servico> carregar(int id) throws ClassNotFoundException, SQLException {
		String sqlInsert = "Select * from tblServico where ID = ?";
		List<Servico> row = new ArrayList<Servico>();
		
		try(Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert)) {
			stm.setInt(1, id);
			try(ResultSet rs = stm.executeQuery()){
				if(rs.next()) {
					Servico ser = new Servico();
					ser.setId(rs.getInt("ID"));
					ser.setNome(rs.getString("Nome"));
					ser.setHora(rs.getString("Hora"));
					ser.setDia(rs.getDate("Dia"));
					ser.setSaida(rs.getDate("Saida"));
					ser.setDescricao(rs.getString("Descricao"));
					ser.setPreco(rs.getDouble("Preco"));
					ser.setTipo(rs.getString("Tipo"));
					
					row.add(ser);
				}
			}catch(Exception e){
				e.getMessage();
			}
		}catch(Exception e) {
			e.getMessage();
		}
		return row;
			
			
	}
	
	
	public void criar(Servico servico) throws ClassNotFoundException, IOException {
        String sqlInsert = "INSERT INTO tblCliente(Nome,Hora,Dia,Saida,Descricao,Preco, Tipo) VALUES(?,?,?,?,?,?,?,?)";
        // usando o try with resources do Java 7, que fecha o que abriu
        try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
            stm.setString(1, servico.getNome());
            stm.setString(2, servico.getHora());
            stm.setDate(3, (Date) servico.getDia());
            stm.setDate(4, (Date) servico.getSaida());
            stm.setString(5, servico.getDescricao());
            stm.setDouble(6, servico.getPreco());
            stm.setString(7,servico.getTipo());
            
            stm.execute();
            String sqlQuery = "SELECT SCOPE_IDENTITY();";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();){
				if (rs.next()) {
					servico.setId(rs.getInt(1));
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}

        } catch (SQLException e) {
            e.printStackTrace();
            
            
        }
    }
	
	
	
	public String getNomeServico(int idServico) throws SQLException, ClassNotFoundException{
        String query = "SELECT Nome FROM tblServico WHERE ID = ?";
        try(Connection conn = new ConnectionFactory().conexao();
                PreparedStatement ps = conn.prepareStatement(query);){
            ps.setInt(1, idServico);
            try(ResultSet rs = ps.executeQuery()){
                if(rs.next()){
                    return rs.getString("Nome");
                }
            }
        }
        return null;
    }
}
