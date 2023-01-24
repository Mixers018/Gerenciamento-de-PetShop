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
import dao.ClienteDao;
import dao.DetalhesPedidoDao;
import dao.PedidoDao;
import model.Agendamento;
import model.Cliente;
import model.DetalhesPedido;
import model.Temp;

public class Entrar implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException {
			response.setContentType("text/html;charset=UTF-8");
		
			String pEmail = request.getParameter("email");
			String pSenha = request.getParameter("senha");
			

			Cliente cliente = new Cliente();
			cliente.setEmail(pEmail);
			cliente.setSenha(pSenha);
			
			
			ClienteDao cs = new ClienteDao();
			
			
			PedidoDao temp = new PedidoDao();
			List<Temp> listaPed;
			
			AgendamentoDao agd = new AgendamentoDao();
			List<Agendamento> lstAgenda;
			
			RequestDispatcher rd = null;

			
			try {
				

				Cliente cli = cs.carregar(cliente);
				String email, senha, mensagem, nome, image;
				email = cliente.getEmail();
				senha = cliente.getSenha();
				nome = cliente.getNome();
				image = cliente.getImage();
				
				
				Cliente cl = cs.getCliente(cli);
				
				if(email != null && senha !=null) {
					//String pattern = "\\S+";
					//Pattern r = Pattern.compile(pattern);
				   // Matcher m = r.matcher(nome);
				    String[] s = nome.trim().split(" ");
				    
				    
				    if (nome!="" && nome != null && email!= null) {
				    	
				    	DetalhesPedidoDao dpd = new DetalhesPedidoDao();
				    	List<DetalhesPedido> historico = dpd.getAllDetalhesPedido(cli.getId());
				    	
				    	listaPed = temp.getAllTemp(cli.getId());
				    	lstAgenda = agd.getAgendaCl(cli.getId());
				    	
				    	HttpSession session = request.getSession();	
						session.setAttribute("Dados", cl);
						session.setAttribute("Nome", s[0].concat(" "+ s[s.length-1]));
						request.setAttribute("msg", "Bem-vindo, "+s[0].concat(" "+ s[s.length-1]));
						session.setAttribute("Email", email);
						session.setAttribute("Image", image);
						System.out.print(image);
						session.setAttribute("lstAgenda", lstAgenda);
						session.setAttribute("carrinho", listaPed);
						session.setAttribute("historico", historico);
						rd = request.getRequestDispatcher("controller.do?command=GetCategoria&idCategoria=6");
				        rd.forward(request, response);
				      }
					System.out.println("Foi feito o login");
				}
				else if (email == null && senha == null){
					mensagem = "Email e/ou Senha não encontrado!";
					request.setAttribute("mensagem", mensagem);
					request.setAttribute("usuario", pEmail);
					request.setAttribute("senha", pSenha);
					rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
					System.out.println("Não foi feito o login");
				}
				
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	
	
	}


