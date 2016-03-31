package com.hjs.study.spring.service;

import java.util.List;

import com.hjs.study.spring.bean.Menu;



public interface IMenuService {

	/**
	 * 查询菜单
	 */
	public String getAllMenus();
	/**
	 * 查询菜单
	 */
	public List<Menu> getAllMenuList();
	/**
	 * 新增菜单
	 * @return
	 */
	public void createMenu(Menu menu);
	
	/**
	 * 修改菜单
	 * @return
	 */
	public void editMenu(Menu menu);
	
	/**
	 * 删除菜单
	 */
	public void removeMenu(Menu menu);
}
