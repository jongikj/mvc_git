package home;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeController
 */
@WebServlet({"/intro.do"})	//Servlet Path
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("서블릿 입장..");
//		String servletPath = request.getServletPath();
//		System.out.println("서블릿 경로 : " + servletPath);
//		String path = servletPath.split("/")[1];
//		String view = path.substring(0, path.indexOf("."));
//		System.out.println("가야할 경로 : " + view);
         request.getRequestDispatcher("/WEB-INF/global/" + request.getParameter("page") + ".jsp").forward(request, response);
	}
}