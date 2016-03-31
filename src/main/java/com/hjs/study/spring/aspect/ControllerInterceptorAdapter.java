package com.hjs.study.spring.aspect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hjs.study.spring.util.Constants;




/**
 * 拦截Controller
 */
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ControllerInterceptorAdapter extends HandlerInterceptorAdapter{
	
	private List<String> ignoreList = new ArrayList<String>();
	
	/**
	 * 进入controller前拦截
	 * 检查是否登录
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String sessionId = getJSESSIONID(request);
		request.setAttribute(Constants.JSESSIONID, sessionId);	//传递到controller中
		
		String servletName = request.getServletPath();
		if(ignoreList.contains(servletName)){	//不过滤List中的路径
			return true;
		}
		
		Object msgObj = request.getSession().getAttribute(sessionId);	//session中的sessionid
		if(msgObj!=null){	//当前是已登录状态
			request.setAttribute(Constants.CHECK_RESULT, Constants.RESULT_MSG);
			return true;
		}else{
			response.sendRedirect("login");	//重定向到登录页面
			return false;
		}
	}
	
	/**
	 * 获取当前JSESSIONID
	 */
	private String getJSESSIONID(HttpServletRequest request){
		//客户端的sessionId
		String jSessionId=null;
		Cookie[] cookies = request.getCookies();
		if(cookies==null){
			return "";
		}
		for (Cookie cookie : cookies) {
			if(Constants.JSESSIONID.equals(cookie.getName())){
				jSessionId = cookie.getValue();
			}
		}
		return jSessionId;
	}

	public List<String> getIgnoreList() {
		return ignoreList;
	}

	public void setIgnoreList(List<String> ignoreList) {
		this.ignoreList = ignoreList;
	}
	
	
	
	
}
