package global;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @date   :2016. 7. 21.
 * @author :장종익
 * @file   :Separator.java
 * @story  :
*/
public class Seperator {
	public static CommandFactory factory = new CommandFactory();
	public static Command command;
	
	public static Command init(HttpServletRequest request, HttpServletResponse response){
		String path = request.getServletPath();
		String directory = path.split("/")[1];
		String temp = path.split("/")[2];
		String  action = temp.substring(0, temp.indexOf("."));
		String page = request.getParameter("page");
		if (page.equals("")) {
			page = "main";
		}
		
		return factory.createCommand(directory, page);
	}
}
