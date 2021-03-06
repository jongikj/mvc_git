package home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import global.Command;
import global.DispatcherServlet;
import global.Seperator;

/**
 * Servlet implementation class HomeController
 */
@WebServlet({"/home.do"})	//Servlet Path
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("====HomeCotroller====");
		DispatcherServlet.send(request, response, Seperator.init(request, response));
	}
}