package com.lovo.cq.shopping10_1.po;

/**
 *√Ë ˆ ÈµƒJavaBean
 */
public class Book {
	private int bookId;

	private int superTypeId;

	private int subTypeId;

	private String bookName;

	private String introduce;

	private float price;

	private float nowPrice;

	private String picture;
	
	private int pages;
	
	private String publisher;
	
	private String author;
	
	private String ISBN;

	private String inTime;

	private int newBooks;

	private int saleBooks;

	private int hostBooks;
	
	private int specialBooks;

	private int bookNum;

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getBookNum() {
		return bookNum;
	}

	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}

	public int getHostBooks() {
		return hostBooks;
	}

	public void setHostBooks(int hostBooks) {
		this.hostBooks = hostBooks;
	}

	public String getInTime() {
		return inTime;
	}

	public void setInTime(String inTime) {
		this.inTime = inTime;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getNewBooks() {
		return newBooks;
	}

	public void setNewBooks(int newBooks) {
		this.newBooks = newBooks;
	}

	public float getNowPrice() {
		return nowPrice;
	}

	public void setNowPrice(float nowPrice) {
		this.nowPrice = nowPrice;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getSaleBooks() {
		return saleBooks;
	}

	public void setSaleBooks(int saleBooks) {
		this.saleBooks = saleBooks;
	}

	public int getSubTypeId() {
		return subTypeId;
	}

	public void setSubTypeId(int subTypeId) {
		this.subTypeId = subTypeId;
	}

	public int getSuperTypeId() {
		return superTypeId;
	}

	public void setSuperTypeId(int superTypeId) {
		this.superTypeId = superTypeId;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String isbn) {
		ISBN = isbn;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getSpecialBooks() {
		return specialBooks;
	}

	public void setSpecialBooks(int specialBooks) {
		this.specialBooks = specialBooks;
	}

	
}
