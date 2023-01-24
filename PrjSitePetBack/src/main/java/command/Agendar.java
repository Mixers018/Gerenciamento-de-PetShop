package command;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AgendamentoDao;
import model.Agendamento;
import model.Cliente;
import dao.ServicoDao;

public class Agendar implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		try {
			HttpSession session = request.getSession();
			Cliente cl = (Cliente) session.getAttribute("Dados");
			int idCliente = cl.getId();
			
			int idServico = Integer.parseInt(request.getParameter("idServico"));
			int idPet = Integer.parseInt(request.getParameter("idPet"));
			String hora = request.getParameter("hora");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String pdata = request.getParameter("data");
			Date data = (Date) formatter.parse(pdata); 
			String descricao = request.getParameter("descricao");
			double valor = Double.parseDouble(request.getParameter("valor"));
		
			
			AgendamentoDao agd = new AgendamentoDao();
			String vhora = agd.verificarAgenda(hora,data,idServico);

			// == null n�o tem agendamento        != null tem agendamento
			RequestDispatcher rd;
	
			if(vhora != null) {
				
				request.setAttribute("erroAgenda","Não foi possível agendar. A data/horário estão indisponíveis!!");;
            	rd = request.getRequestDispatcher("agendarServico.jsp");
    			rd.forward(request, response);
    			System.out.println("Agendamento indisponível");
    			
			}else {
				try {
					ServicoDao sd = new ServicoDao();
					String nomeServico = sd.getNomeServico(idServico);
					
					Agendamento agendamento = new Agendamento();
					agendamento.setIdCliente(idCliente);
					agendamento.setIdServico(idServico);
					agendamento.setIdPet(idPet);
					agendamento.setNomeServico(nomeServico);
					agendamento.setHora(hora);
					agendamento.setData(data);
					agendamento.setDescricao(descricao);
					agendamento.setValor(valor);
				
					agd.agendar(agendamento);
				
					
					List<Agendamento> agenda = agd.getAgendaCl(idCliente);
					
					request.setAttribute("sucessoAgenda","Serviço agendado com sucesso. Obrigado(a) por confiar nos nossos serviços.");
					session.setAttribute("lstAgenda", agenda);
					rd = request.getRequestDispatcher("agendarServico.jsp");
					rd.forward(request, response);
					System.out.println("Agendamento realizado com sucesso");
					
				} catch (Exception e) {
					e.getMessage();
				}
			}
				
		}catch (Exception e) {
			System.out.print(e.getMessage());
		}
	}
	
}
