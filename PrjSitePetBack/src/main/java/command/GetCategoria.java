package command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoriaDao;
import dao.FavoritosProdutosDao;
import dao.ProdutoDao;
import model.Categoria;
import model.Produto;

public class GetCategoria implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		
		
		int categoriaS = Integer.parseInt(request.getParameter("idCategoria"));
		
		String pesquisa = request.getParameter("Search");
		
		CategoriaDao cD = new CategoriaDao();
		ProdutoDao pd = new ProdutoDao();
		FavoritosProdutosDao fd = new FavoritosProdutosDao();
		
		List<Categoria> cat;
		List<Produto> lista;
		List<Produto> favoritos;
		RequestDispatcher rd;
		
		if(pesquisa == null) {
			if(categoriaS == 6) {
				cat = cD.getForNumber((categoriaS));
				lista = pd.getAllProducts();
				favoritos = fd.getAllProdutosFavoritos();
				request.setAttribute("listaProd", lista);
				request.setAttribute("favoritos", favoritos);
				request.setAttribute("Cate", cat);
				rd = request.getRequestDispatcher("produto.jsp");
				rd.forward(request, response);
				
				
				
			} else if(categoriaS != 6) {
				cat = cD.getForNumber((categoriaS));
				lista = pd.getAllCategoria(categoriaS);
				favoritos = fd.getAllProdutosFavoritos();
				
				
				request.setAttribute("favoritos", favoritos);
				request.setAttribute("listaProd", lista);
				request.setAttribute("Cate", cat);
				rd = request.getRequestDispatcher("produto.jsp");
				rd.forward(request, response);
			}
		}else {
			cat = cD.getForNumber((categoriaS));
			lista = pd.pesquisarPorNome(pesquisa);
			favoritos = fd.getAllProdutosFavoritos();
			request.setAttribute("favoritos", favoritos);
			request.setAttribute("listaProd", lista);
			request.setAttribute("Cate", cat);
			rd = request.getRequestDispatcher("produto.jsp");
			rd.forward(request, response);
		}
		
	}

}