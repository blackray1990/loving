package com.hjs.study.spring.service;

import com.hjs.study.spring.bean.User;
import com.hjs.study.spring.ext.model.LogonHistory;

public interface ILoginService {
	
	/**
	 * 查询用户
	 */
	public User getUser(User user);
	
	
	/**
	 * 插入登陆历史
	 */
	public boolean insertNewHistory(LogonHistory entity);
	
}
