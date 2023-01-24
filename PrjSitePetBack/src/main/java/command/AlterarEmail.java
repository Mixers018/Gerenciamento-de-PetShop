package command;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClienteDao;
import dao.ConnectionFactory;
import model.Cliente;


public class AlterarEmail implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		HttpSession session = request.getSession();
		Cliente cl = (Cliente) session.getAttribute("Dados");
		int idCli = cl.getId();
		String email = request.getParameter("email");
		
		Cliente cliente = new Cliente();
        ClienteDao cd = new ClienteDao();
        Connection conn = new ConnectionFactory().conexao();	
        String aux = cd.verificarEmailCadastrado(email, conn);
        RequestDispatcher rd;
        
		if(aux != null) {
			request.setAttribute("erro","Este Email já está em uso. Tente outro.");
		} else {
			cliente.setId(idCli);
			cliente.setEmail(email);
			cliente.setNome(cl.getNome());
			cliente.setTelefone(cl.getTelefone());
			cliente.setCep(cl.getCep());
			cliente.setCpf(cl.getCpf());
			cliente.setSenha(cl.getSenha());
          
			cd.alterarEmail(cliente.getEmail(), cliente.getId());
			request.setAttribute("sucesso","Email alterado com sucesso!!");
			System.out.print("Email alterado com sucesso!"+ cliente.getId() + cliente.getNome()+cliente.getEmail());
			session.setAttribute("Email",email);
		}
			rd = request.getRequestDispatcher("conta.jsp");
			rd.forward(request, response);
	}

}
