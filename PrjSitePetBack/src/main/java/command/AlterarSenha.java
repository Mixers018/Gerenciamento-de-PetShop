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


public class AlterarSenha implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {		
		HttpSession session = request.getSession();
		Cliente cl = (Cliente) session.getAttribute("Dados");
		int idCli = cl.getId();
		String senhaAtual = cl.getSenha().trim();
		String senhaAnt = request.getParameter("senhaAnt");
		String senhaN = request.getParameter("senhaN");
		String rSenhaN = request.getParameter("rSenhaN");
		
		
		if(senhaAnt.equals(senhaAtual)) {
			if(senhaN.equals(rSenhaN)) {
			
				Cliente cliente = new Cliente();
				cliente.setId(idCli);
				cliente.setEmail(cl.getEmail());
				cliente.setNome(cl.getNome());
				cliente.setTelefone(cl.getTelefone());
		    	cliente.setCep(cl.getCep());
		    	cliente.setCpf(cl.getCpf());
		        cliente.setSenha(senhaN);

				ClienteDao cd = new ClienteDao();
				cd.alterarSenha(senhaN, idCli);
				
				
				request.setAttribute("sucesso", "Senha alterada com sucesso!");
				System.out.print("Senha alterada com sucesso!");
	        
			}else {
				
				request.setAttribute("erro", "As senhas não conferem.");
				System.out.println("As senhas não conferem.");
				
	        }
		
		}else {
			request.setAttribute("erro", "Senha atual incorreta.");
			System.out.println("Senha atual incorreta.");
			
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("seguranca.jsp");
	    rd.forward(request, response);
		

	}
	
	

}
