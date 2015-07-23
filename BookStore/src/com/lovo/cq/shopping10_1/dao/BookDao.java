package com.lovo.cq.shopping10_1.dao;

import java.util.List;

import com.lovo.cq.shopping10_1.po.Book;
import com.lovo.cq.shopping10_1.po.Page;

public interface BookDao {
	/**
	 * 显示书籍
	 * @param type 显示类别（热卖，新书，降价）
	 * @param flag 表示是否是（热卖，新书，降价）
	 * @return List
	 */
	public List showBooks(int type,int flag);
	
	/**
	 * 根据书的BookId号来展示该书的详细信息
	 * @param bookId 书籍号
	 * @return Book
	 */
	public Book showBookById(int bookId);
	/**
	 *	将书本信息录入数据库 
	 */
	public boolean addBook(Book book);
	/**
	 * 分页显示书籍
	 */
	public Page doPage(int type,int currentPage,int pageSize);
	/**
	 * 根据用户输入的关键字搜索相关书籍
	 * @param keywords 用户输入的关键字 
	 */
	public List searchBooks(String keywords);
	/**
	 * 分页显示书籍
	 * @param currentPage 显示出来的当前页码
	 * @param pageSize 每页显示数目
	 * @return Page
	 */
	public Page doPage(String keywords,int currentPage,int pageSize);
	/**
	 * 根据用户选择的搜索条件搜索相关书籍
	 * @param superTypeId 所属大类的ID
	 * @param subTypeId 所属小类的ID
	 * @param searchMethod （可以是按作者、书名、出版社、ISBN、价格中的一个）
	 * @param upLoadTime 书籍上价时间
	 * @return List
	 */
	public List searchBooksByConditions(int superTypeId,int subTypeId,String searchMethod,String upLoadTime);
	/**
	 * 根据用户选择的搜索条件搜索分页显示相关书籍
	 * @param superTypeId 所属大类的ID
	 * @param subTypeId 所属小类的ID
	 * @param searchMethod （可以是按作者、书名、出版社、ISBN、价格中的一个）
	 * @param upLoadTime 书籍上价时间
	 * @param currentPage 显示出来的当前页码
	 * @param pageSize 每页显示数目
	 * @return Page
	 */
	public Page doPageByConditons(int superTypeId,int subTypeId,String searchMethod,String upLoadTime,int currentPage,int pageSize);
}
