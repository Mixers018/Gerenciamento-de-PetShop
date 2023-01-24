package command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AgendamentoDao;
import model.Agendamento;
import model.Cliente;


public class GetDetalhesAgenda implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		HttpSession session = request.getSession();
		Cliente cl = (Cliente) session.getAttribute("Dados");
		int idCliente = cl.getId();
		
		AgendamentoDao agd = new AgendamentoDao();
		List<Agendamento> agenda = agd.getAgendaCl(idCliente);
		
		
		session.setAttribute("lstAgenda", agenda);
		RequestDispatcher rd = request.getRequestDispatcher("mostrarAgendamentos.jsp");
		rd.forward(request, response);

	}

}
