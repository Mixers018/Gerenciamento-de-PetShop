package command;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AgendamentoDao;
import dao.ClienteDao;
import dao.PedidoDao;
import dao.PetDao;
import model.Cliente;


public class ExcluirCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		Cliente cl = (Cliente) request.getSession().getAttribute("Dados");
		
	
		try (PrintWriter out = response.getWriter()){
			if(request.getSession().getAttribute("Dados") != null || request.getSession().getAttribute("Nome") != null) {
				
				int idCliente = cl.getId();
				
				PetDao pd = new PetDao();
				pd.excluirPetC(idCliente);
				
				PedidoDao pdd = new PedidoDao();
				pdd.excluirTempC(idCliente);
				pdd.excluirPedidoC(idCliente);
				
				AgendamentoDao agd = new AgendamentoDao();
				agd.excluirAgendamentoC(idCliente);
				
				ClienteDao cd = new ClienteDao();
				cd.excluirCliente(idCliente);
				
				request.getSession().removeAttribute("Dados");
				request.getSession().removeAttribute("Nome");
				request.setAttribute("sucessoDeleteConta","Conta excluída com sucesso. Obrigado(a) pela parceria e confiança!! Até mais!!");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
				
			}else {
				response.sendRedirect("index.jsp");
			}
		}
		
	
	}

}
