package global;

import javax.servlet.http.HttpServletRequest;

/**
 * @date   :2016. 7. 26.
 * @author :장종익
 * @file   :ParamMap.java
 * @story  :
*/
public class ParamMap {
	public static String getValue(HttpServletRequest request, String name){
		String[] values = request.getParameterMap().get(name);
		StringBuffer buff = new StringBuffer();
		String str = "";
		for (int i = 0; i < values.length; i++) {
			buff.append(values[i] + ", ");
		}
		str = buff.toString().substring(0, buff.toString().length()-2);
		return str;
	}
}