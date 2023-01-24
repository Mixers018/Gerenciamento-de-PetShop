package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.FavoritosProdutos;
import model.Produto;


public class FavoritosProdutosDao {
	
	
	public List<Produto> getAllProdutosFavoritos(){
		List<FavoritosProdutos> ser = new ArrayList<FavoritosProdutos>();
		String query = "select * from tblFavoritosProdutos";
		
		try (Connection conn = new ConnectionFactory().conexao();
                PreparedStatement stm = conn.prepareStatement(query);) {
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				FavoritosProdutos row = new FavoritosProdutos();
				row.setId(rs.getInt("ID"));
				row.setIdProd(rs.getInt("ID_Produto"));
				
				ser.add(row);
			}
			
			
			List<Produto> prod = new ArrayList<Produto>();
			
			for(FavoritosProdutos p: ser) {
				
				
				prod.add(pesquisaID(p.getIdProd()));
				
				
			}
			return prod;
			
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
		
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
	
	
	
	
}
