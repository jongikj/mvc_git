package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import global.Command;
import global.DispatcherServlet;
import global.Seperator;
import javafx.scene.control.Separator;

//{} 안에 넣어주면 String 배열 (객체)화가 된다
@WebServlet("/member.do")

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 진입...");
		Seperator.init(request, response);
		MemberService service = MemberServiceImpl.getInstance();
		MemberBean bean = new MemberBean();
		switch (Seperator.command.getAction()) {
		case "login":
			bean.setId(request.getParameter("id"));
			bean.setPw(request.getParameter("pw"));
			String name = service.login(bean);
			if (name.equals("")) {
				Seperator.command.setPage("login");
				Seperator.command.setView();
			} else {
				Seperator.command.setDirectory(request.getParameter("directory"));
				Seperator.command.setView();
				request.setAttribute("name", service.findBy());
			}
			break;
			
		case "regist":
			bean.setId(request.getParameter("id"));
			bean.setPw(request.getParameter("pw"));
			bean.setName(request.getParameter("name"));
			bean.setRegDate();
			bean.setSsn(request.getParameter("ssn"));
			bean.setEmail(request.getParameter("email"));
			String reg = service.regist(bean);
			if(reg.equals("")){
				Seperator.command.setDirectory(request.getParameter("directory"));
				Seperator.command.setPage("regist");
				Seperator.command.setView();
			} else {
				Seperator.command.setDirectory(request.getParameter("directory"));
				Seperator.command.setPage("login");
				Seperator.command.setView();
			}
			break;
			
		case "find_by_id":
			request.setAttribute("find_by_id", service.findBy());
			break;
			
		case "update":
			request.setAttribute("update", service.findBy());
			bean.setPw(request.getParameter("pw"));
			bean.setEmail(request.getParameter("email"));
			bean.setId(service.findBy().getId());
			service.update(bean);
			Seperator.command.setDirectory(request.getParameter("directory"));
			Seperator.command.setPage("update");
			Seperator.command.setView();
			break;
			
		case "delete":
			
			break;
		default:
			break;
		}
		
		DispatcherServlet.send(request, response, Seperator.command);
	}
}