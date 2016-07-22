package grade;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/grade/main.do", 
	"/grade/count.do", 
	"/grade/delete.do", 
	"/grade/list.do",
	"/grade/regist.do", 
	"/grade/search.do", 
	"/grade/update.do"})
public class GradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sPath = request.getServletPath();	// 클래스 바로 위에 있는 곳에서 읽어온다
		System.out.println("서블릿 경로  : " + sPath);
		String[] arr = sPath.split("/");
		String pkg = arr[1];
		String view = arr[2].substring(0, arr[2].indexOf("."));
		RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/" + pkg + "/" + view + ".jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}