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


public class ExcluirAgendamento implements Command{
	
	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		try {
			int idAgendamento = Integer.parseInt(request.getParameter("idAgendamento"));
			HttpSession session = request.getSession();
			Cliente cl = (Cliente) session.getAttribute("Dados");
		
			
			AgendamentoDao agd = new AgendamentoDao();
			List<Agendamento> agenda = agd.excluirAgenda(idAgendamento,cl.getId());
			
			System.out.print("Agendamento cancelado com sucesso" + idAgendamento);
			
			request.setAttribute("cancelarAgenda","Serviço cancelado com sucesso. Aqui, queremos que você tenha sempre a melhor experiência.");
			session.setAttribute("lstAgenda", agenda);
			RequestDispatcher rd = request.getRequestDispatcher("mostrarAgendamentos.jsp");
			rd.forward(request, response);
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}		
	}

}
