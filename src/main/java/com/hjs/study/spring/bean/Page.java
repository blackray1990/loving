package com.hjs.study.spring.bean;

import java.util.List;

public class Page<T> {

	private int startIndex=0;	//起始位置
	
	private int endIndex;	//结束为止
	
	private int currentPage=1;
	
	private int pageSize=10;	//每页条数
	
	private int totalCount;	//总条数
	
	private int totalPage=1;	//总页数
	
	private List<T> items;	//数据列表

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getItems() {
		return items;
	}

	public void setItems(List<T> items) {
		this.items = items;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		int left = totalCount/pageSize;
		int right = (totalCount%pageSize)==0?0:1;
		this.totalPage = left + right;
	}
	
	
}
