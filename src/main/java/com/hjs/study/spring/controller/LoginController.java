package com.hjs.study.spring.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hjs.study.spring.bean.Menu;
import com.hjs.study.spring.bean.User;
import com.hjs.study.spring.ext.dao.ILogonHistoryDao;
import com.hjs.study.spring.ext.model.LogonHistory;
import com.hjs.study.spring.service.ILoginService;
import com.hjs.study.spring.service.IMenuService;
import com.hjs.study.spring.util.Constants;
import com.hjs.study.spring.util.MD5Util;

/**
 * 登陆控制器
 * @author Administrator
 *
 */
@Controller
public class LoginController extends BaseController{

	@Resource
	private ILoginService loginService;
	@Resource
	private ILogonHistoryDao logonHistoryDao;
	
	@Resource
	private IMenuService menuService;
	
	/**
	 * 登陆验证
	 * @param request
	 * @param map
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="logonsys")
	public String logonSys(HttpServletRequest request,HttpServletResponse response,ModelMap map,@ModelAttribute User user,Model model) throws Exception{
		
		String sessionId = request.getAttribute(Constants.JSESSIONID).toString();
		if(Constants.RESULT_MSG.equals(request.getAttribute(Constants.CHECK_RESULT))){
			request.getSession().setAttribute("contextPaths", request.getContextPath());
			map.addAttribute("username",request.getSession().getAttribute(sessionId));
			return "login/logon";
		}
		if(user==null){
			map.addAttribute("errordtl", "登录超时，请重新登录!");
			return "default";
		}
		
		
		user.setPassword(MD5Util.MD5Encode(user.getPassword(), null));
		User user1 = loginService.getUser(user);
		if(user1==null){
			map.put("msg", FAIlURE);
			return "default";
		}

		request.getSession().setAttribute("USER", user1);
		request.getSession().setAttribute("contextPaths", request.getContextPath());
		request.getSession().setAttribute(sessionId, user1.getUsername());
		return "redirect:/index.do";
	}

	@RequestMapping(value="index")
	public String index(Model model){
		List<Menu> menus = menuService.getAllMenuList();
		model.addAttribute("menus",menus);
		return "login/index";
	}
	
	/**
	 * 退出登录 清除session
	 */
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest request){
		String sessionId = request.getAttribute(Constants.JSESSIONID).toString();
		request.getSession().removeAttribute(sessionId);
		return "default";
	}
	
	/**
	 * 读取登录历史
	 */
	@RequestMapping(value="gethistory")
	public String getLogonHistory(ModelMap model){
		List<LogonHistory> entityList = logonHistoryDao.selectLogonHistory(null);
		model.addAttribute("entityList",entityList);
		return "login/history";
	}
	
	
}
