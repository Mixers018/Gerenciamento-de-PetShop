package command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDao;
import model.Cliente;

public class ModificarSenha implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
			
			String cpf = request.getParameter("cpf").trim();
			String email = request.getParameter("email").trim();
			String senha = request.getParameter("senha").trim();
			String repetSenha = request.getParameter("repetSenha").trim();
		
			ClienteDao cld = new ClienteDao();
			
			RequestDispatcher rd;
			Cliente cl1 = new Cliente();
			
			try {
				if(cld.EmailCadastrado(email) || cld.VerificaCPF(cpf) ) {
					
					cl1.setEmail(email);
					
					
					Cliente cl = cld.getCliente(cl1);
					
					if(senha.equals(repetSenha)){
						
						cld.alterarSenha(senha, cl.getId());
						
						request.setAttribute("msgSenha", "Sua senha foi alterada com sucesso!!");
						
						rd = request.getRequestDispatcher("login.jsp");
				        rd.forward(request, response);
						
						
					}else {
						request.setAttribute("msgSenha", "Suas senhas não coincidem!!");
						request.setAttribute("sCpf", cpf);
						request.setAttribute("sEmail", email);
						
						rd = request.getRequestDispatcher("esqueciSenha.jsp");
				        rd.forward(request, response);
					}
					
					
					
					
					
				}else {
					request.setAttribute("msgUsuario", "Usuário não encontrado!!");
					request.setAttribute("sCpf", cpf);
					request.setAttribute("sEmail", email);
					rd = request.getRequestDispatcher("esqueciSenha.jsp");
			        rd.forward(request, response);
				}
				
				
				
				
				
				
				
				
			}catch(Exception e) {
				e.getMessage();
				
			}
			
		
		
		
	}

}
