
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class ProdutoDao {
	
	public List<Produto> getAllCategoria(int idCategoria){
		List<Produto> ser = new ArrayList<Produto>();
		String query = "select * from tblProduto where ID_Categoria = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setInt(1, idCategoria);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Produto row = new Produto();
				row.setId(rs.getInt("ID"));
				row.setDescricao(rs.getString("Descricao"));
				row.setFabricacao(rs.getDate("Fabricacao"));
				row.setNome(rs.getString("Nome"));
				row.setPeso(rs.getDouble("Peso"));
				row.setPreco(rs.getDouble("Preco"));
				row.setQuantidade(rs.getInt("Quantidade"));
				row.setValidade(rs.getDate("Validade"));
				row.setIdCategoria(rs.getInt("ID_Categoria"));
				row.setIdFornecedor(rs.getInt("ID_Fornecedor"));
				row.setImageProd(rs.getString("ImgProd"));
				
				ser.add(row);
			}
			
		}catch (Exception e) {
			e.getMessage();
		}
		return ser;
	}
	
	
	
	public List<Produto> getAllProducts(){
		List<Produto> ser = new ArrayList<Produto>();
		String query = "select * from tblProduto";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Produto row = new Produto();
				row.setId(rs.getInt("ID"));
				row.setDescricao(rs.getString("Descricao"));
				row.setFabricacao(rs.getDate("Fabricacao"));
				row.setNome(rs.getString("Nome"));
				row.setPeso(rs.getDouble("Peso"));
				row.setPreco(rs.getDouble("Preco"));
				row.setQuantidade(rs.getInt("Quantidade"));
				row.setValidade(rs.getDate("Validade"));
				row.setIdCategoria(rs.getInt("ID_Categoria"));
				row.setIdFornecedor(rs.getInt("ID_Fornecedor"));
				row.setImageProd(rs.getString("ImgProd"));
				
				ser.add(row);
			}
			
		}catch (Exception e) {
			e.getMessage();
		}
		return ser;
	}
	
	
	
	public List<Produto> pesquisarPorNome(String Search){
		List<Produto> ser = new ArrayList<Produto>();
		String query = "select * from tblProduto where Nome like '%' + ? + '%'";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setString(1, Search);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Produto row = new Produto();
				row.setId(rs.getInt("ID"));
				row.setDescricao(rs.getString("Descricao"));
				row.setFabricacao(rs.getDate("Fabricacao"));
				row.setNome(rs.getString("Nome"));
				row.setPeso(rs.getDouble("Peso"));
				row.setPreco(rs.getDouble("Preco"));
				row.setQuantidade(rs.getInt("Quantidade"));
				row.setValidade(rs.getDate("Validade"));
				row.setIdCategoria(rs.getInt("ID_Categoria"));
				row.setIdFornecedor(rs.getInt("ID_Fornecedor"));
				row.setImageProd(rs.getString("ImgProd"));
				
				ser.add(row);
			}
			
		}catch (Exception e) {
			e.getMessage();
		}
		return ser;
	}



	public Produto pesquisaID(int idProduto) {
		Produto prod = new Produto();
		String query = "select * from tblProduto where ID = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setInt(1, idProduto);
			try (ResultSet rs = stm.executeQuery();) {
                if (rs.next()) {
                	prod.setId(rs.getInt("ID"));
                	prod.setDescricao(rs.getString("Descricao"));
                	prod.setFabricacao(rs.getDate("Fabricacao"));
                	prod.setNome(rs.getString("Nome"));
                	prod.setPeso(rs.getDouble("Peso"));
                	prod.setPreco(rs.getDouble("Preco"));
                	prod.setQuantidade(rs.getInt("Quantidade"));
                	prod.setValidade(rs.getDate("Validade"));
                	prod.setIdCategoria(rs.getInt("ID_Categoria"));
                	prod.setIdFornecedor(rs.getInt("ID_Fornecedor"));
                	prod.setImageProd(rs.getString("ImgProd"));
                } else {
                	prod.setId(0);
                	prod.setDescricao(null);
                	prod.setFabricacao(null);
                	prod.setNome(null);
                	prod.setPeso(0.0);
                	prod.setPreco(0.0);
                	prod.setQuantidade(0);
                	prod.setValidade(null);
                	prod.setIdCategoria(0);
                	prod.setIdFornecedor(0);
                	prod.setImageProd(null);
                }
			} catch (SQLException e) {
                e.printStackTrace();
            }
		}catch (Exception e1) {
			e1.printStackTrace();
		}
		return prod;
	}
	
	
	
	public void atualizarQtdeProduto(int QuantidadeProduto, int IdProduto) {
		String sqlUpdate = "UPDATE tblProduto SET Quantidade = ? WHERE ID = ?";
		
		try (Connection conn = new ConnectionFactory().conexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setInt(1, QuantidadeProduto);
			stm.setInt(2, IdProduto);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int verificarQtdeProduto(int idProduto) throws SQLException, ClassNotFoundException{
        String query = "SELECT Quantidade FROM tblProduto WHERE ID = ?";
        try(Connection conn = new ConnectionFactory().conexao();
                PreparedStatement ps = conn.prepareStatement(query);){
            ps.setInt(1, idProduto);
            try(ResultSet rs = ps.executeQuery()){
                if(rs.next()){
                    return rs.getInt("Quantidade");
                }
            }
        }
        return 0;
    }
}
