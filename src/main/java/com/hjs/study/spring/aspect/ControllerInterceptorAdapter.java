package com.hjs.study.spring.aspect;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hjs.study.spring.bean.Menu;
import com.hjs.study.spring.ext.model.LogonHistory;
import com.hjs.study.spring.service.ILoginService;
import com.hjs.study.spring.service.IMenuService;
import com.hjs.study.spring.util.Constants;
import com.hjs.study.spring.util.StringUtil;

import org.springframework.web.servlet.ModelAndView;
/**
 * 拦截Controller
 */
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ControllerInterceptorAdapter extends HandlerInterceptorAdapter{
	
	private List<String> ignoreList = new ArrayList<String>();
	
	@Resource
	public ILoginService loginService;
	
	@Resource
	public IMenuService menuService;
	
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
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		String path = request.getServletPath();
		
		//写入日志
		if(path!=null&&path.indexOf("logonsys")>=0){
			int status = Integer.valueOf(modelAndView.getModel().get("LOGIN_STATUS").toString());
			if(status==2){
				return;
			}
			String loginName = modelAndView.getModel().get("loginName").toString();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			LogonHistory entity = new LogonHistory();
			entity.setLoginName(loginName);
			entity.setLastLoginTime(sdf.format(new Date()));
			entity.setIpAdd(StringUtil.getRemoteIp(request));
			if(status==0){	//登陆成功
				entity.setRemark("成功");
			}else{
				entity.setRemark("失败");
			}
			loginService.insertNewHistory(entity);
		}
		if(modelAndView!=null){
			List<Menu> menus = menuService.getAllMenuList();
			modelAndView.getModelMap().addAttribute("menus",menus);
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
