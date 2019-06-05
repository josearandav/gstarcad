package com.gstarcad.website.util;

import java.util.List;

import com.google.common.collect.Lists;

/**
 * @author eva 分页类
 */
public class PagingBean<T> {

	public static final String PAGING_BEAN = "_paging_bean";

	public static Integer DEFAULT_PAGE_SIZE = 40;

	/**
	 * 最多显示页码数
	 */
	public final int SHOW_PAGES = 4;

	/**
	 * 每页开始的索引号,从0开始
	 */
	public Integer start;
	// 页码大小
	private Integer pageSize;

	// 总条数
	private Integer totalPages;

	// 当前页，从1开始
	private Integer currentPage;

	// 总记录数
	private Integer totalItems;
	// 展示的开始页数
	private Integer showstartPage;

	private List<T> content = Lists.newArrayList();
	
	public PagingBean(){}
	
	public PagingBean(int start, int limit) {
		this.pageSize = limit;
		this.start = start;
	}

	public boolean hasPreviousPage() {
		return currentPage > 1;
	}

	public boolean hasNextPage() {
		return currentPage < getTotalPages();
	}

	public List<T> getContent() {
		return content;
	}

	public void setContent(List<T> content) {
		this.content = content;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public void setTotalItems(Integer totalItems) {
		this.totalItems = totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;

	}

	public int getFirstResult() {
		return start;
	}

	public Integer getTotalPages() {
		if(totalItems == null){
			totalItems = 0;
		}
		totalPages = totalItems % pageSize == 0 ? (totalItems / pageSize)
				: (totalItems / pageSize + 1);
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	public Integer getCurrentPage() {
		if(currentPage!=null){
			return currentPage;
		}
		currentPage = start / pageSize + 1;
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getShowstartPage() {
		showstartPage = getTotalPages() - getCurrentPage() > SHOW_PAGES - 2 ? getCurrentPage()
				: getTotalPages() - (SHOW_PAGES - 1);
		return showstartPage;
	}

	public void setShowstartPage(Integer showstartPage) {
		this.showstartPage = showstartPage;
	}

	public int getSHOW_PAGES() {
		return SHOW_PAGES;
	}
}
