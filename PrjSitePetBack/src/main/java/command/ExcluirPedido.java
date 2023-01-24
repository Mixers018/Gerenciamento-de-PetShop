package command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DetalhesPedidoDao;
import dao.ProdutoDao;
import model.Cliente;
import model.DetalhesPedido;


public class ExcluirPedido implements Command{
	
	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		try {
			int idPedido = Integer.parseInt(request.getParameter("idPedido"));
			int idProduto = Integer.parseInt(request.getParameter("idProduto"));
			int qtdeSaida = Integer.parseInt(request.getParameter("quantidade"));
			HttpSession session = request.getSession();
			Cliente cl = (Cliente) session.getAttribute("Dados");
		
			ProdutoDao pd = new ProdutoDao();
			int qtdeVenda = pd.verificarQtdeProduto(idProduto);
			DetalhesPedidoDao dpd = new DetalhesPedidoDao();
			
			
			int quantidadeProduto = qtdeVenda + qtdeSaida;
			pd.atualizarQtdeProduto(quantidadeProduto, idProduto);
			
						
			List<DetalhesPedido> historico = dpd.excluirProdutoPedido(idProduto,idPedido,cl.getId());
			
			System.out.print("Pedido cancelado com sucesso" + idPedido);
			
			request.setAttribute("cancelarPedido","Pedido cancelado com sucesso. Aqui, queremos que você tenha sempre a melhor experiência.");
			session.setAttribute("historico", historico);
			RequestDispatcher rd = request.getRequestDispatcher("meusPedidos.jsp");
			rd.forward(request, response);
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}		
	}

}
