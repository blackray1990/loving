package com.hjs.study.spring.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hjs.study.spring.bean.Menu;
import com.hjs.study.spring.bean.Page;
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
	 * 登陆页
	 */
	@RequestMapping(value="login")
	public String login(){
		
		return "default";
	}
	
	/**
	 * 登陆验证
	 */
	@RequestMapping(value="logonsys")
	public String logonSys(HttpServletRequest request,HttpServletResponse response,@ModelAttribute User user,Model model) throws Exception{
		
		String sessionId = request.getAttribute(Constants.JSESSIONID).toString();
		
		if(user==null){
			model.addAttribute("errordtl", "登录超时，请重新登录!");
			model.addAttribute("LOGIN_STATUS", STATUS_FAILED);
			return "redirect:/login";
		}
		
		model.addAttribute("loginName",user.getUsername());
		
		user.setPassword(MD5Util.MD5Encode(user.getPassword(), null));
		User user1 = loginService.getUser(user);
		if(user1==null){
			model.addAttribute("errordtl", "用户名或密码错误");
			model.addAttribute("LOGIN_STATUS", STATUS_FAILED);
			return "redirect:/login";
		}

		model.addAttribute("LOGIN_STATUS", STATUS_SUCCESS);
		
		request.getSession().setAttribute("USER", user1);
		request.getSession().setAttribute("CONTEXT", request.getContextPath());
		request.getSession().setAttribute(sessionId, user1.getUsername());
		return "redirect:/index";
	}

	@RequestMapping(value="index")
	public String index(Model model){
		
		return "login/index";
	}
	
	/**
	 * 退出登录 清除session
	 */
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest request){
		String sessionId = request.getAttribute(Constants.JSESSIONID).toString();
		request.getSession().removeAttribute(sessionId);
		return "redirect:/index";
	}
	
	/**
	 * 读取登录历史
	 */
	@RequestMapping(value="gethistory")
	public String getLogonHistory(LogonHistory param,Page<LogonHistory> page,Model model){
		page.setStartIndex((page.getCurrentPage()-1)*page.getPageSize());
		int entityCount = logonHistoryDao.selectLogonHistoryCount(param);
		List<LogonHistory> entityList = logonHistoryDao.selectLogonHistory(page);
		page.setTotalCount(entityCount);
		page.setItems(entityList);
		
		model.addAttribute("page",page);

		return "login/history";
	}
	
	
}
