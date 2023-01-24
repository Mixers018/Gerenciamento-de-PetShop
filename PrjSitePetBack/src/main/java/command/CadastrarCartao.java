package command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDao;
import model.Cliente;

public class CadastrarCartao implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		int cartao = Integer.parseInt(request.getParameter("cartao"));
		int numeroCartao = Integer.parseInt(request.getParameter("Ncartao"));
			
		String tipoPagamento;
		Cliente cl = (Cliente) request.getSession().getAttribute("Dados");
		ClienteDao cd = new ClienteDao();
			
			
		int idCliente = cl.getId();
			
			
		if(cartao == 1) {
			tipoPagamento = "Cartão de Crédito";
			cd.inserirCartao(idCliente, tipoPagamento, numeroCartao);
			response.sendRedirect("controller.do?command=ConfirmarCompra");		
		}else {
			tipoPagamento = "Cartão de Débito";
			cd.inserirCartao(idCliente, tipoPagamento, numeroCartao);
			response.sendRedirect("controller.do?command=ConfirmarCompra");
		}
	}

}
