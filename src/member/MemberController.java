/*
package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import global.Seperator;

//{} 안에 넣어주면 String 배열 (객체)화가 된다
@WebServlet({
	"/member/member.do",
	"/member/detail.do",
	"/member/regist.do",
	"/member/update.do",
	"/member/delete.do",
	"/member/login.do",
	"/member/logout.do",
	"/member/find_by_id.do",
	"/member/find_by.do",
	"/member/count.do"
})

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 진입...");
		Seperator.init(request, response);
		
		MemberService service = MemberServiceImpl.getInstance();
		
		switch (Seperator.command.getAction()) {
		case "main":
			this.dispatch(request, response, Seperator.command.getDirectory() + "/"
					+ Seperator.command.getAction());
			
		case "regist":
			String nameReg = service.regist(this.init(request));
			request.setAttribute("result", nameReg);
			if(!nameReg.equals("")){
				this.directory = "member";
				this.view = "login";
			}
			break;
			
		default:
			break;
		}
		
		
				
		try {
			this.dispatch(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String page) throws Exception {
		RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/" + page + ".jsp");
		dis.forward(request, response);
	}
}
*/