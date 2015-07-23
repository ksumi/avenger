package com.lovo.cq.shopping10_1.dao;

import java.util.List;

import com.lovo.cq.shopping10_1.po.Book;
import com.lovo.cq.shopping10_1.po.BookPager;

public interface AdminBookDao {

	public List getAllBooks();
	public boolean addBook(Book book);
	public boolean checkBookNameIsExist(String bookName);
	public boolean checkISBNIsExist(String ISBN);
	public BookPager searchBook(String bookName);
	public List getAllBookName();
	public BookPager getBookPager(int index,int pageSize);
	public boolean deleteBook(int[] bookIds);
}
