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


public class AlterarFotoPerfil implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {		
		HttpSession session = request.getSession();
		Cliente cl = (Cliente) session.getAttribute("Dados");
		int idCli = cl.getId();
		String image = request.getParameter("foto");
		
		if(cl.getImage() == image || cl.getImage().equals(image)) {
		
			request.setAttribute("erro","Foto de perfil já está em uso.");
			
		} else {
			
			Cliente cliente = new Cliente();
			cliente.setId(idCli);
			cliente.setNome(cl.getNome());
			cliente.setEmail(cl.getEmail());
			cliente.setTelefone(cl.getTelefone());
	    	cliente.setCep(cl.getCep());
	    	cliente.setCpf(cl.getCpf());
	        cliente.setSenha(cl.getSenha());
	        cliente.setImage(image);
	        
			ClienteDao cd = new ClienteDao();
			cd.alterarFotoPerfil(cliente.getImage(), cliente.getId());
			
			Cliente clNew = cd.getCliente(cliente);
			
			request.setAttribute("sucesso","Foto de perfil alterada com sucesso!!");
			session.setAttribute("Image",image);
			session.setAttribute("Dados",clNew);
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("conta.jsp");
		rd.forward(request, response);
		
	}
}
