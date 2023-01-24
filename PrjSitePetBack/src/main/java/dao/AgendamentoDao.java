package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Agendamento;

public class AgendamentoDao{
	
	public void agendar(Agendamento agendamento) throws ClassNotFoundException, IOException {
        String sqlInsert = "Insert into tblAgendamento(ID_Cliente,ID_Servico,ID_Pet,NomeServico,Hora,Data,Descricao,Valor) VALUES(?,?,?,?,?,?,?,?)";
        try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
            stm.setInt(1, agendamento.getIdCliente());
            stm.setInt(2, agendamento.getIdServico());
            stm.setInt(3, agendamento.getIdPet());
            stm.setString(4, agendamento.getNomeServico());
            stm.setString(5, agendamento.getHora());
            stm.setDate(6, new java.sql.Date(agendamento.getData().getTime()));
            stm.setString(7, agendamento.getDescricao());
			stm.setDouble(8, agendamento.getValor());

            stm.execute();
            String sqlQuery = "Select SCOPE_IDENTITY();";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();){
				if (rs.next()) {
					agendamento.setId(rs.getInt(1));
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	public List<Agendamento> getAgendaCl(int idCliente){
		List<Agendamento> agenda = new ArrayList<Agendamento>();
		String query = "Select*,(select Nome from tblPet where ID = tblAgendamento.ID_Pet AND ID_Cliente = ?) as NomePet from tblAgendamento WHERE ID_Cliente = ?";

		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setInt(1, idCliente);
			stm.setInt(2, idCliente);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				Agendamento row = new Agendamento();
				row.setId(rs.getInt("ID"));
				row.setIdCliente(rs.getInt("ID_Cliente"));
				row.setIdServico(rs.getInt("ID_Servico"));
				row.setIdPet(rs.getInt("ID_Pet"));
				row.setNomeServico(rs.getString("NomeServico"));
				row.setNomePet(rs.getString("NomePet"));
				row.setHora(rs.getString("Hora"));
				row.setData(rs.getDate("Data"));
				row.setDescricao(rs.getString("Descricao"));
				row.setValor(rs.getDouble("Valor"));
				
				agenda.add(row);
			}
			
		}catch (Exception e) {
			e.getMessage();
		}
		return agenda;
	}
	
	
	public String verificarAgenda(String hora, Date data, int idServico) throws SQLException, ClassNotFoundException{
        String query = "SELECT Hora FROM tblAgendamento WHERE Hora = ? AND Data = ? AND	ID_Servico = ?";
        try(Connection conn = new ConnectionFactory().conexao();
                PreparedStatement ps = conn.prepareStatement(query);){
            ps.setString(1, hora);
            ps.setDate(2, new java.sql.Date(data.getTime()));
            ps.setInt(3, idServico);
            try(ResultSet rs = ps.executeQuery()){
                if(rs.next()){
                    return rs.getString("Hora");
                }
            }
        }
        return null;
    }
	
	
	public List<Agendamento> excluirAgenda(int idAgendamento, int idCliente) {
		String sqlDelete = "DELETE FROM tblAgendamento WHERE ID = ? and ID_Cliente = ?";
		try (Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idAgendamento);
			stm.setInt(2, idCliente);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getAgendaCl(idCliente);
	}
	
	
	
	public void excluirAgendamentoC(int idCliente) {
		String sqlDelete = "DELETE FROM tblAgendamento WHERE ID_Cliente = ?";
		try (Connection conn = new ConnectionFactory().conexao();
			PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idCliente);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
