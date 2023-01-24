package command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DetalhesPedidoDao;
import dao.PedidoDao;
import dao.ProdutoDao;
import model.Cliente;
import model.DetalhesPedido;
import model.Pedido;
import model.Temp;

public class ConfirmarCompra implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		@SuppressWarnings("unchecked")
		ArrayList<Temp> listaPed = (ArrayList<Temp>)request.getSession().getAttribute("carrinho");
		Cliente cl = (Cliente) request.getSession().getAttribute("Dados");
		
		Pedido ped = new Pedido();
		ped.setIdCliente(cl.getId());
	
		PedidoDao pedDao = new PedidoDao();
		pedDao.criar(ped);
		int idPedido = pedDao.verificaPedido(cl);
			
		DetalhesPedidoDao dP = new DetalhesPedidoDao();
			
		if(dP.criar(listaPed, idPedido) == true)
		{
			List<DetalhesPedido> historico = dP.getAllDetalhesPedido(cl.getId());
			
			for(Temp lp: listaPed) {
				int qtdeSaida = lp.getQtd();
				int qtdeVenda = lp.getQtdProd();
				int idProduto = lp.getIdProd();
				
				int quantidadeProduto = qtdeVenda - qtdeSaida;
				
				ProdutoDao pd = new ProdutoDao();
				pd.atualizarQtdeProduto(quantidadeProduto, idProduto);
			}
			
			dP.excluirCarrinho(cl.getId());
			List<Temp> carrinho = pedDao.getAllTemp(cl.getId());
			
			
			
			HttpSession session = request.getSession();	
			request.setAttribute("sucessoCompra", "Compra confirmada com sucesso. Obrigado(a) pela sua compra!!");
			session.setAttribute("carrinho", carrinho);
			session.setAttribute("historico", historico);
			RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
		    rd.forward(request, response);
		};
	}
}