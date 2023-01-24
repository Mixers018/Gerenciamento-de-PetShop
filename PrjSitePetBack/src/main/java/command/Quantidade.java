package command;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Temp;

public class Quantidade implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		
		response.setCharacterEncoding("UTF-8");
		int quantidade = Integer.parseInt(request.getParameter("Quantidade"));
		int id = Integer.parseInt(request.getParameter("id"));
		int idProd = Integer.parseInt(request.getParameter("idProd"));
		
		
		@SuppressWarnings("unchecked")
		ArrayList<Temp> temp = (ArrayList<Temp>)request.getSession().getAttribute("carrinho");
		
		if(quantidade >=1) {
			if(temp != null) {
				for(Temp t: temp) {
					if(t.getId() == id) {
						if(t.getIdProd() == idProd) {
							t.setQtd(quantidade);
							HttpSession session = request.getSession();
							session.setAttribute("quantidade", temp);
							session.setAttribute("idProd", idProd);
							RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
							rd.forward(request, response);
						}
						
						
					}
				}
			}
			
		}
		

	}

}
