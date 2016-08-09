package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import global.DispatcherServlet;
import global.ParamMap;
import global.Seperator;
import subject.SubjectBean;
import subject.SubjectMember;
import subject.SubjectService;
import subject.SubjectServiceImpl;

//{} 안에 넣어주면 String 배열 (객체)화가 된다
@WebServlet("/member.do")

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 진입...");
		HttpSession session = request.getSession();
		Seperator.init(request, response);
		MemberService service = MemberServiceImpl.getInstance();
		SubjectService subService = SubjectServiceImpl.getInstance();
		SubjectBean subject = new SubjectBean();
		SubjectMember sm = new SubjectMember();
		MemberBean bean = new MemberBean();
		
		switch (Seperator.command.getAction()) {
		case "move":
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "detail":
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "login":
			bean.setId(request.getParameter("id"));
			bean.setPw(request.getParameter("pw"));
			sm = service.login(bean);
			if (bean.getId().equals("fail")) {
				System.out.println("컨트롤러 : 로그인 실패");
				Seperator.command.setPage("login");
				Seperator.command.setView();
			} else {
				System.out.println("컨트롤러 : 로그인 성공");
				request.setAttribute("user", sm);
				session.setAttribute("user", sm);
				Seperator.command.setDirectory("global");
				Seperator.command.setView();
			}
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "regist":
			bean.setId(request.getParameter("id"));
			bean.setPw(request.getParameter("pw"));
			bean.setName(request.getParameter("name"));
			bean.setRegDate();
			bean.setSsn(request.getParameter("ssn"));
//			bean.setGenderAndBirth(request.getParameter("ssn"));
			bean.setPhone(request.getParameter("phone"));
			bean.setEmail(request.getParameter("email"));
			System.out.println("전공 : " + request.getParameter("major"));
			System.out.println("수강과목 : " + ParamMap.getValue(request, "subject"));
			
			if(service.regist(bean).equals("fail")){
				System.out.println("회원가입 실패");
				Seperator.command.setDirectory(request.getParameter("directory"));
				Seperator.command.setPage("regist");
				Seperator.command.setView();
			} else {
				System.out.println("회원가입 성공");
				subject.setId(request.getParameter("id"));
				subject.setMajor(request.getParameter("major"));
				subject.setSubjects(ParamMap.getValue(request, "subject"));
				System.out.println(subject);
				subService.insert(subject);
				Seperator.command.setDirectory(request.getParameter("directory"));
				Seperator.command.setPage(request.getParameter("page"));
				Seperator.command.setView();
			}
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "update":
			bean = (MemberBean) session.getAttribute("user");
			bean.setPw(request.getParameter("pw"));
			bean.setEmail(request.getParameter("email"));
			service.update(bean);
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "delete":
			bean = (MemberBean) session.getAttribute("user");
			session.invalidate();
			service.delete(bean);
			Seperator.command.setDirectory("home");
			Seperator.command.setPage("main");
			Seperator.command.setView();
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "logout":
			session.invalidate();
			Seperator.command.setDirectory("home");
			Seperator.command.setPage("main");
			Seperator.command.setView();
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "count":
			request.setAttribute("count", service.count());
			Seperator.command.setPage("count");
			Seperator.command.setView();
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "find_by_id":
			request.setAttribute("member", service.findById(request.getParameter("keyword")));
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "find_by_name":
			service.findBy(request.getParameter("keyword"));
			request.setAttribute("list", service.findBy(request.getParameter("keyword")));
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		case "list":
			request.setAttribute("list", service.list());
			DispatcherServlet.send(request, response, Seperator.command);
			break;
			
		default:
			break;
		}
	}
}