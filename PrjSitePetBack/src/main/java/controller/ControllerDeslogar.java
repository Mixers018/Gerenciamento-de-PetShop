package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerDeslogar
 */
@WebServlet("/Deslogar")
public class ControllerDeslogar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllerDeslogar() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()){
			if(request.getSession().getAttribute("Dados") != null || request.getSession().getAttribute("Nome") != null) {
				request.getSession().removeAttribute("Dados");
				request.getSession().removeAttribute("Nome");
				request.getSession().removeAttribute("pesquisa");
				request.setAttribute("sair","Obrigado(a) por ter vindo à nossa loja. Volte sempre!!");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);				

			}else {
				response.sendRedirect("index.jsp");
			}
		}
	}

}
