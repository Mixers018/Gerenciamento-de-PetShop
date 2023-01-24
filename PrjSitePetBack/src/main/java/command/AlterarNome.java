package command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClienteDao;
import model.Cliente;


public class AlterarNome implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		HttpSession session = request.getSession();
		Cliente cl = (Cliente) session.getAttribute("Dados");
		int idCli = cl.getId();
		String nomeCli = request.getParameter("nomeCli");
		
		
		Cliente cliente = new Cliente();
		cliente.setId(idCli);
		cliente.setNome(nomeCli);
		cliente.setEmail(cl.getEmail());
		cliente.setTelefone(cl.getTelefone());
    	cliente.setCep(cl.getCep());
    	cliente.setCpf(cl.getCpf());
        cliente.setSenha(cl.getSenha());
          
		ClienteDao cd = new ClienteDao();
		cd.alterarNome(cliente.getNome(), cliente.getId());
		
		String[] nomes = nomeCli.split(" ", 2);
        session.setAttribute("Nome", nomes[0].concat(" "+ nomes[nomes.length-1]));
		request.setAttribute("sucesso","Nome alterado com sucesso!!");
		RequestDispatcher rd = request.getRequestDispatcher("conta.jsp");
		rd.forward(request, response);
              
	}

}
