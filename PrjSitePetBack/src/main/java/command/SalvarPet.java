package command;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConnectionFactory;
import dao.PetDao;
import model.Cliente;
import model.Pet;


public class SalvarPet implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		try {
			HttpSession session = request.getSession();
			Cliente cl = (Cliente) session.getAttribute("Dados");
			int idCliente = cl.getId();
			
			String especie = request.getParameter("especie");
			String nome = request.getParameter("nome");
			String raca = request.getParameter("raca");
			String sexo = request.getParameter("sexo");
			String pvacina = request.getParameter("vacina");

		
			PetDao pd = new PetDao();
			
			Connection conn = new ConnectionFactory().conexao();	
			String id = pd.verificarPet(nome,especie,raca,sexo,idCliente,conn);

			// == null n�o tem Pet        != null tem Pet
			RequestDispatcher rd;
			
			if(id != null) {
		
				request.setAttribute("erroAddPet", "Pet já cadastrado!!");
            	rd = request.getRequestDispatcher("agendarServico.jsp");
    			rd.forward(request, response);
    			System.out.println("Pet já cadastrado");
    			
			}else {
				try {
					Pet pet = new Pet();
					pet.setIdCliente(idCliente);
					pet.setEspecie(especie);
					pet.setNome(nome);
					pet.setRaca(raca);
					pet.setSexo(sexo);
					pet.setVacina(pvacina);
				
					pd.inserir(pet);
				
					List<Pet> listaPet = pd.ListGetPet(idCliente);	
				
					request.setAttribute("sucessoAddPet","Pet cadastrado com sucesso!!");
					session.setAttribute("listaPet", listaPet);
					rd = request.getRequestDispatcher("agendarServico.jsp");
					rd.forward(request, response);
					System.out.println("Cadastro realizado com sucesso");
					
				
				} catch (Exception e) {
					e.getMessage();
				}
			}
			
		} catch (Exception e) {
			e.getMessage();
		}
		
	}
	
}
