package com.hjs.study.spring.ext.dao;

import java.util.List;

import com.hjs.study.spring.bean.Page;
import com.hjs.study.spring.ext.model.LogonHistory;

public interface ILogonHistoryDao {

	/**
	 * 新增登陆历史
	 */
	public int insertHistory(LogonHistory param);
	/**
	 * 
	 */
	public int selectLogonHistoryCount(LogonHistory param);
	/**
	 * 查询登录历史
	 */
	public List<LogonHistory> selectLogonHistory(Page<LogonHistory> page);
}
