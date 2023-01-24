package command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PedidoDao;
import dao.ProdutoDao;

import model.Produto;
import model.Temp;

public class AddPedido implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		try {
			int idProduto = Integer.parseInt(request.getParameter("idProd"));
			int idCliente = Integer.parseInt(request.getParameter("idCliente"));
			int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
			
			Temp temporario = new Temp();
			Produto produto = new Produto();
			ProdutoDao produtoDao = new ProdutoDao();
			
			produto = produtoDao.pesquisaID(idProduto);
			
			temporario.setIdCliente(idCliente);
			temporario.setIdProd(produto.getId());
			temporario.setNome(produto.getNome());
			temporario.setPreco(produto.getPreco());
			temporario.setQtd(1);
			temporario.setQtdProd(produto.getQuantidade());
			temporario.setTotal(1);
			temporario.setImageProd(produto.getImageProd());
			
			PedidoDao pedidoDao = new PedidoDao();
			
			List<Temp> carrinho = pedidoDao.getAllTemp(idCliente);
			HttpSession session = request.getSession();	
			
			if(carrinho.isEmpty()) {
				pedidoDao.inserir(temporario);
					
				carrinho = pedidoDao.getAllTemp(idCliente);
				
				request.setAttribute("sucesso", "Adicionado com sucesso no carrinho!!");
				session.setAttribute("carrinho", carrinho);
				
				RequestDispatcher rd = request.getRequestDispatcher("controller.do?command=GetCategoria&idCategoria=" + idCategoria);
		        rd.forward(request, response);
			}
			else {
				int contemProd = pedidoDao.getIdProduto(idProduto, idCliente);
				if(contemProd == idProduto) {		
					pedidoDao.inserir(temporario);	
					carrinho = pedidoDao.getAllTemp(idCliente);
						
					request.setAttribute("erro", "Produto já existe no carrinho!!");
					session.setAttribute("carrinho", carrinho);
				}else {
					pedidoDao.inserir(temporario);	
					carrinho = pedidoDao.getAllTemp(idCliente);
	
					request.setAttribute("sucesso", "Adicionado com sucesso no carrinho!!");
					session.setAttribute("carrinho", carrinho);
				}	
				RequestDispatcher rd = request.getRequestDispatcher("controller.do?command=GetCategoria&idCategoria=" + idCategoria);
				rd.forward(request, response);
			}
		}catch (Exception e) {
			System.out.print(e.getMessage());
		}
	}
}