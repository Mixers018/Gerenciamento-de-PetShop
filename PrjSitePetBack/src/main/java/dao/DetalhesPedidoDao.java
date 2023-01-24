package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DetalhesPedido;
import model.Temp;

public class DetalhesPedidoDao {
	public boolean criar(ArrayList<Temp> listaPed, int idPedido) throws ClassNotFoundException, IOException, SQLException {
        String sqlInsert = "INSERT INTO tblDetalhesPedido VALUES(?,?,?,?,?)";
        // usando o try with resources do Java 7, que fecha o que abriu
        
	        try (Connection conn = new ConnectionFactory().conexao();
	                PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
	        	for(Temp s:listaPed){
	        	
	        		System.out.println(s.getIdProd());
	        		stm.setInt(1, s.getIdProd());
	        		stm.setInt(2, idPedido);
	        		stm.setString(3, s.getNome());
	        		stm.setInt(4, s.getQtd());
	        		stm.setDouble(5, s.getPreco());
	        		
	        		stm.execute();
	        	}
	            String sqlQuery = "SELECT SCOPE_IDENTITY();";
	            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
						ResultSet rs = stm2.executeQuery();){
					if (rs.next()) {
						for(Temp t: listaPed) {
							t.setId(rs.getInt(1));
							return true;
						}		
					}
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
        }
		return false;
    }
	
	
	
	public void excluirCarrinho(int idCliente) {
		String sqlDelete = "DELETE FROM tblTemp WHERE ID_Cliente = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
			PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idCliente);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public List<DetalhesPedido> getAllDetalhesPedido(int idCliente) {
		List<DetalhesPedido> ser = new ArrayList<DetalhesPedido>();
		String query = "select * from tblDetalhesPedido where ID_Pedido in (select ID from tblPedido where ID_Cliente = ?)";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setInt(1, idCliente);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				DetalhesPedido row = new DetalhesPedido();
				row.setID_Pedido(rs.getInt("ID_Pedido"));
				row.setID_Produto(rs.getInt("ID_Produto"));
				row.setNome_Produto(rs.getString("Nome_Produto"));
				row.setQuantidade(rs.getInt("Quantidade"));
				row.setPreco(rs.getDouble("Preco"));
				
				ser.add(row);
			}
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return ser;
	}
	
	
	
	public List<DetalhesPedido> excluirProdutoPedido(int idProduto, int idPedido, int idCliente) {
		String sqlDelete = "DELETE FROM tblDetalhesPedido WHERE ID_Produto = ? and ID_Pedido = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
			PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idProduto);
			stm.setInt(2, idPedido);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getAllDetalhesPedido(idCliente);
	}
}
