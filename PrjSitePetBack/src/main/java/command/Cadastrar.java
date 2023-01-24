package command;

import java.sql.Connection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClienteDao;
import dao.ConnectionFactory;
import model.Cliente;

public class Cadastrar implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String pEmail = request.getParameter("email");
		String repetSenha = request.getParameter("repitSenha");
		String senha = request.getParameter("senha");
		String msg;
		int aj;
        
        
        Cliente cliente = new Cliente();
        ClienteDao dao = new ClienteDao();
        Connection conn = new ConnectionFactory().conexao();	
        String aux = dao.verificarEmailCadastrado(pEmail, conn);
        RequestDispatcher rd = null;
        
        if(senha.equals(repetSenha)) {
        	if(aux != null && cliente.getCpf() == null
                    || (cliente.getCpf() != null && aux != null && !aux.equals(cliente.getCpf()))) {
        		
	    	        

	    			request.setAttribute("Email", pEmail);

        			
        			msg = "Usuário já possui conta.";
        			aj = 0;
        			request.setAttribute("ajuda", aj);
        			request.setAttribute("msg", msg);
                	rd = request.getRequestDispatcher("cadastro.jsp");
        			rd.forward(request, response);
        			System.out.println("Email já cadastrado");
                
                }
        		else {
        			
        			String pCpf = request.getParameter("cpf");
    		        String pTel = request.getParameter("tel");
    		        String pCep = request.getParameter("cep");
    		        String pSenha = request.getParameter("senha");
    		        String pNome = request.getParameter("nome");
    		        String pImage = request.getParameter("foto");
    	        	
    	        	
    				//String codificado = dao.encodeImage(pImage);
    				cliente.setNome(pNome.trim());
    		        cliente.setCpf(pCpf);
    		        cliente.setEmail(pEmail);
    		        cliente.setTelefone(pTel);
    		        cliente.setCep(pCep);
    		        cliente.setSenha(pSenha);
    		        //cliente.setImage(codificado);
    		        cliente.setImage(pImage);
    		        
    		        
    		        ClienteDao cs = new ClienteDao();
    		        cs.criar(cliente);
    		        
    		        
    		        Cliente cl = cs.getCliente(cliente);
        	        
        	        String pattern = "\\S+";
    				Pattern r = Pattern.compile(pattern);
    			    Matcher m = r.matcher(pNome);
    			    String[] nomes = pNome.split(" ", 2);
        	        
    			    if (m.find()) {
            	        
            	        HttpSession session = request.getSession();	
            	        session.setAttribute("Dados", cl);
            	        session.setAttribute("Email", pEmail);
            	        session.setAttribute("Image", pImage);
            	        request.setAttribute("msg", "Bem-vindo, "+nomes[0].concat(" "+ nomes[nomes.length-1]));
						session.setAttribute("Nome", nomes[0].concat(" "+ nomes[nomes.length-1]));
						rd = request.getRequestDispatcher("controller.do?command=GetCategoria&idCategoria=6");
				        rd.forward(request, response);
        		        System.out.println("Cadastro realizado com sucesso");
    			    }
        		}
        }else {
        	
        	String pCpf = request.getParameter("cpf");
	        String pTel = request.getParameter("tel");
	        String pCep = request.getParameter("cep");
	        String pCttEmail = request.getParameter("cttEmail");
	        String pNome = request.getParameter("nome");
	        String pImage = request.getParameter("foto");
	        
	        request.setAttribute("pnome", pNome);
			request.setAttribute("pEmail", pEmail);
			request.setAttribute("pcpf", pCpf);
			request.setAttribute("ptel", pTel);
			request.setAttribute("pcep", pCep);
			request.setAttribute("pcttEmail", pCttEmail);
			request.setAttribute("pimg", pImage);
        	
        	
	        
	        
        	aj = 1;
        	//msg="Falha na autenticação de senha";
        	msg="Falha na autenticação de senha.";
        	request.setAttribute("ajuda", aj);
        	request.setAttribute("msg", msg);
        	rd = request.getRequestDispatcher("cadastro.jsp");
	        rd.forward(request, response);
        }
        
        
		
	}
	
	

}
