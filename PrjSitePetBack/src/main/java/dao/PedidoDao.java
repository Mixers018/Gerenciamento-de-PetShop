package dao;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cliente;
import model.Pedido;
import model.Temp;


public class PedidoDao {
	
	
	public void inserir(Temp temp) throws ClassNotFoundException, IOException, SQLException {
		String sql = "{CALL proce_VerificarCarrinho(?,?,?,?,?,?,?,?)}";
		
		try(Connection conn = new ConnectionFactory().conexao();
				CallableStatement cs =  conn.prepareCall(sql)) {
				cs.setInt(1,temp.getIdProd());
				cs.setInt(2, temp.getIdCliente());
				cs.setString(3, temp.getNome());
				cs.setInt(4, temp.getQtd());
				cs.setInt(5, temp.getQtdProd());
				cs.setDouble(6, temp.getPreco());
				cs.setDouble(7, temp.getTotal());
				cs.setString(8, temp.getImageProd());
				cs.execute();
				cs.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
    }

	public List<Temp> getAllTemp(int idCliente) {
		List<Temp> ser = new ArrayList<Temp>();
		String query = "select * from tblTemp where ID_Cliente = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setInt(1, idCliente);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Temp row = new Temp();
				row.setId(rs.getInt("ID"));
				row.setIdProd(rs.getInt("ID_Produto"));
				row.setIdCliente(rs.getInt("ID_Cliente"));
				row.setNome(rs.getString("Nome"));
				row.setQtd(rs.getInt("Qtd"));
				row.setQtdProd(rs.getInt("QtdProd"));
				row.setPreco(rs.getDouble("Preco"));
				row.setTotal(rs.getDouble("Total"));
				row.setImageProd(rs.getString("ImgProd"));
				
				ser.add(row);
			}
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return ser;
	}
	
	public double getTotalCartPreco(ArrayList<Temp> temp) {
		double sum = 0;
		String query = "select preco from tblTemp where ID =?";
		
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);){
			if(temp.size()>0) {
				for(Temp p: temp) {
					stm.setInt(1, p.getId());
					ResultSet rs = stm.executeQuery();
					
					while(rs.next()) {
						sum +=rs.getDouble("Preco")*p.getQtd();
					}
					
					
				}
			}
			
			
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return sum;
		
	}
	
	
	public List<Temp> excluirProdTemp(int idProd, int idCliente) {
		String sqlDelete = "DELETE FROM tblTemp WHERE ID_Produto = ? and ID_Cliente = ?";
		try (Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idProd);
			stm.setInt(2, idCliente);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getAllTemp(idCliente);
	}
	
	
	
	public void criar(Pedido ped) throws ClassNotFoundException, IOException {
        String sqlInsert = "INSERT INTO tblPedido VALUES(?)";
        // usando o try with resources do Java 7, que fecha o que abriu
        try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
            stm.setInt(1, ped.getIdCliente());

            stm.execute();
            String sqlQuery = "SELECT SCOPE_IDENTITY();";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();){
				if (rs.next()) {
					ped.setId(rs.getInt(1));
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	
	public int verificaPedido(Cliente cl) throws SQLException, ClassNotFoundException{
        String query = "SELECT max(ID) as ID_Ult FROM tblPedido WHERE ID_Cliente = ?";
        try(Connection conn = new ConnectionFactory().conexao();
        PreparedStatement stm = conn.prepareStatement(query);){
        	stm.setInt(1, cl.getId());
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()){
                    return rs.getInt("ID_Ult");
                }
            }
        }
        return 0;
    }
	
	
	
	public void excluirTempC(int idCliente) {
		String sqlDelete = "DELETE FROM tblTemp WHERE ID_Cliente = ?";
		try (Connection conn = new ConnectionFactory().conexao();
			PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idCliente);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void excluirPedidoC(int idCliente) {
		String sqlDelete = "DELETE FROM tblPedido WHERE ID_Cliente = ?";
		try (Connection conn = new ConnectionFactory().conexao();
			PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idCliente);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int getIdProduto(int idProduto, int idCliente) throws SQLException, ClassNotFoundException{
        String query = "SELECT ID_Produto FROM tblTemp WHERE ID_Produto = ? AND ID_Cliente = ?";
        try(Connection conn = new ConnectionFactory().conexao();
                PreparedStatement ps = conn.prepareStatement(query);){
            ps.setInt(1, idProduto);
            ps.setInt(2, idCliente);
            try(ResultSet rs = ps.executeQuery()){
                if(rs.next()){
                    return rs.getInt("ID_Produto");
                }
            }
        }
        return 0;
    }
}
