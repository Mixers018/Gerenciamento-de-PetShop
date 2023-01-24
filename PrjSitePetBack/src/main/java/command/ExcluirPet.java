package command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PetDao;
import dao.ServicoDao;
import model.Cliente;
import model.Pet;
import model.Servico;

public class ExcluirPet implements Command{
	
	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		try {
			int idServico = Integer.parseInt(request.getParameter("idServico"));
			int idPet = Integer.parseInt(request.getParameter("idPet"));
			
			HttpSession session = request.getSession();
			Cliente cl = (Cliente) session.getAttribute("Dados");
			int idCliente = cl.getId();
			
			ServicoDao sd = new ServicoDao();
			List<Servico> listaServico = sd.carregar(idServico);
			
			PetDao pd = new PetDao();
			pd.excluirPet(idPet);
			
			List<Pet> listaPet = pd.ListGetPet(idCliente);	
			System.out.print("Codigo"+idPet);
			session.setAttribute("listaServico", listaServico);
			session.setAttribute("listaPet", listaPet);
			
			RequestDispatcher rd = request.getRequestDispatcher("agendarServico.jsp");
			rd.forward(request, response);
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
				
	}

}
