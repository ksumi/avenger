package com.lovo.cq.shopping10_1.vo;

import com.lovo.cq.shopping10_1.po.Book;

/**
 * 购物车中的购物项，它包括商品和商品数量
 */
public class CartItem {
	
	private Book book;
	
	private int count;//书的数量
	
	public CartItem(Book book){		
		this.book=book;
		count++;
	}
	
	public Book getBook() {
		return book;
	}
	
	public void setBook(Book book) {
		this.book = book;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	//计算某一购物项的总价
	public float getItemPrice(){
		
		float price = book.getNowPrice()*count;
		return price;
	}
}
