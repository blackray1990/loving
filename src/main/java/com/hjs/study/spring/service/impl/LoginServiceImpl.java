package com.hjs.study.spring.service.impl;

import org.springframework.stereotype.Service;

import com.hjs.study.spring.bean.User;
import com.hjs.study.spring.dao.IUserDao;
import com.hjs.study.spring.ext.dao.ILogonHistoryDao;
import com.hjs.study.spring.ext.model.LogonHistory;
import com.hjs.study.spring.service.ILoginService;
import javax.annotation.*;

@Service
public class LoginServiceImpl implements ILoginService{

	public LoginServiceImpl(){}
	
	@Resource
	private IUserDao userDao;
	
	@Resource
	private ILogonHistoryDao logonHistoryDao;
	
	public User getUser(User user) {
		User loginUser = userDao.getUserForLogin(user);
		return loginUser;
	}

	@Override
	public boolean insertNewHistory(LogonHistory entity) {
		int r = logonHistoryDao.insertHistory(entity);
		return r>0;
	}
}
