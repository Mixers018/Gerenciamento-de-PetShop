package command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PedidoDao;
import model.Temp;

public class ExcluirProdutoTemp implements Command{
	
	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
		int idProd = Integer.parseInt(request.getParameter("idProduto"));
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));	
		int quantidade = Integer.parseInt(request.getParameter("Quantidade"));
			
		PedidoDao pedDao = new PedidoDao();
		HttpSession session = request.getSession();
			
		@SuppressWarnings("unchecked")
		ArrayList<Temp> temp = (ArrayList<Temp>)request.getSession().getAttribute("carrinho");
			
		try {
			if(quantidade >=1) {
				if(temp != null) {
					for(Temp t: temp) {
						if(t.getIdProd() == idProd) {
							t.setQtd(quantidade);
									
							pedDao.inserir(t);
									
							List<Temp> carrinho = pedDao.excluirProdTemp(idProd, idCliente);
									
							session.setAttribute("carrinho", carrinho);
									
							RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
							rd.forward(request, response);
								
						}	
					}
				}			
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}				
	}	
}