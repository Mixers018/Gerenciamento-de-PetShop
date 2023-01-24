package command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Contato implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {

		request.setAttribute("message", "Agradecemos o seu contato e ficamos muito felizes em saber do seu interesse e confiança em nossos produtos/serviços.");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
		
	}

}
