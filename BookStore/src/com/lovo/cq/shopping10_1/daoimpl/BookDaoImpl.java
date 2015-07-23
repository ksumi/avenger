package com.lovo.cq.shopping10_1.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.lovo.cq.shopping10_1.common.DbUtil;
import com.lovo.cq.shopping10_1.dao.BookDao;
import com.lovo.cq.shopping10_1.po.Book;
import com.lovo.cq.shopping10_1.po.Page;
import com.lovo.cq.shopping10_1.po.User;

public class BookDaoImpl implements BookDao {
	/**
	 * 显示书籍
	 * @param type 显示类别（热卖，新书，降价,特别推荐）
	 * @param flag 表示是否是（热卖，新书，降价）
	 */
	public List showBooks(int type,int flag){
		List all = new ArrayList();
		PreparedStatement pstmt = null;
		DbUtil dbUtil = null;
		ResultSet rs = null;
		String sql = null;
		if(type==0){
			//显示所有书籍
			sql = "select * from tb_book";
			try {
				dbUtil = new DbUtil();
				pstmt = dbUtil.getCon().prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Book book = new Book();
					book.setBookId(rs.getInt("bookId"));
					book.setBookName(rs.getString("bookName"));
					book.setISBN(rs.getString("ISBN"));
					book.setPages(rs.getInt("pages"));
					book.setAuthor(rs.getString("author"));
					book.setPublisher(rs.getString("publisher"));
					book.setIntroduce(rs.getString("introduce"));
					book.setPrice(rs.getFloat("price"));
					book.setNowPrice(rs.getFloat("nowPrice"));
					book.setPicture(rs.getString("picture"));
					all.add(book);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					pstmt.close();
					dbUtil.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}else {
		if(type==1) {
			//热卖书籍
		    sql = "select * from tb_book where hostBooks=?";
		}
		if(type==2){
			//新到书籍
			sql = "select * from tb_book where newBooks=?";
		}
		if(type==3){
			//打折书籍
			sql = "select * from tb_book where saleBooks=?";
		}
		if(type==4){
			//特别推荐
			sql = "select * from tb_book where specialBooks=?";
		}
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			pstmt.setInt(1, flag);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Book book = new Book();
				book.setBookId(rs.getInt("bookId"));
				book.setBookName(rs.getString("bookName"));
				book.setISBN(rs.getString("ISBN"));
				book.setPages(rs.getInt("pages"));
				book.setAuthor(rs.getString("author"));
				book.setPublisher(rs.getString("publisher"));
				book.setIntroduce(rs.getString("introduce"));
				book.setPrice(rs.getFloat("price"));
				book.setNowPrice(rs.getFloat("nowPrice"));
				book.setPicture(rs.getString("picture"));
				all.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		}
		return all;
	}
	/**
	 * 根据书的BookId号来展示该书的详细信息
	 * @param bookId 书籍号
	 * @return Book
	 */
	public Book showBookById(int bookId){
		Book book = new Book();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_book where bookId=?";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			pstmt.setInt(1, bookId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				book.setBookId(rs.getInt("bookId"));
				book.setBookName(rs.getString("bookName"));
				book.setIntroduce(rs.getString("introduce"));
				book.setISBN(rs.getString("ISBN"));
				book.setAuthor(rs.getString("author"));
				book.setPages(rs.getInt("pages"));
				book.setPublisher(rs.getString("publisher"));
				book.setPrice(rs.getFloat("price"));
				book.setNowPrice(rs.getFloat("nowPrice"));
				book.setPicture(rs.getString("picture"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return book;
	}
	/**
	 *	将书本信息录入数据库 
	 */
	public boolean addBook(Book book){
		boolean flag = false;
		PreparedStatement pstmt = null;
		DbUtil dbUtil = null;
		String sql = "insert into tb_book values(null,?,?,?,?,?,?,?,?,?,?,?,null,?,?,?,?)";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			pstmt.setInt(1, book.getSuperTypeId());
			pstmt.setInt(2, book.getSubTypeId());
			pstmt.setString(3, book.getBookName());
			pstmt.setString(4, book.getISBN());
			pstmt.setString(5, book.getIntroduce());
			pstmt.setFloat(6, book.getPrice());
			pstmt.setFloat(7, book.getNowPrice());
			pstmt.setString(8, book.getPicture());
			pstmt.setInt(9, book.getPages());
			pstmt.setString(10, book.getPublisher());
			pstmt.setString(11, book.getAuthor());
			pstmt.setInt(12, book.getNewBooks());
			pstmt.setInt(13, book.getSaleBooks());
			pstmt.setInt(14, book.getHostBooks());
			pstmt.setInt(15, book.getBookNum());
			int i = pstmt.executeUpdate();
			if(i != 0){
				//插入书籍成功
				return flag;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	/**
	 * 分页显示书籍
	 * @param type 按要求显示相应的书籍
	 * @param currentPage 显示出来的当前页码
	 * @param pageSize 每页显示数目
	 * @return Page
	 */
	public Page doPage(int type,int currentPage,int pageSize){
		Page page = new Page();
		System.out.println("pagetype="+type);
		int totalNum = showBooks(type,1).size();
		System.out.println("totalNum"+totalNum);
		List pageList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = null;
		if(type==0){//显示所有书籍
			sql = "select * from tb_book limit "+currentPage+","+pageSize;
		}
		if(type==1) {
			//热卖书籍
		    sql = "select * from tb_book where hostBooks=1 limit "+currentPage+","+pageSize;
		}
		if(type==2){
			//新到书籍
			sql = "select * from tb_book where newBooks=1 limit "+currentPage+","+pageSize;
		}
		if(type==3){
			//打折书籍
			sql = "select * from tb_book where saleBooks=1 limit "+currentPage+","+pageSize;
		}
		if(type==4){
			//特别推荐
			sql = "select * from tb_book where specialBooks=1 limit "+currentPage+","+pageSize;
		}
		System.out.println("sql="+sql);
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Book book = new Book();
			    book.setBookId(rs.getInt("bookId"));
				book.setBookName(rs.getString("bookName"));
				book.setPicture(rs.getString("picture"));
				book.setPrice(rs.getFloat("price"));
				book.setNowPrice(rs.getFloat("nowPrice"));
				pageList.add(book);
			}
			System.out.println("pageList="+pageList.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		page.setPageList(pageList);
		page.setTotalNum(totalNum);
		return page;
	}
	/**
	 * 根据用户输入的关键字搜索相关书籍
	 * @param keywords 用户输入的关键字 
	 */
	public List searchBooks(String keywords){
		List searchList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_book where bookName like '%"+keywords+"%'";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//有相关书籍
				while(rs.next()){
					Book book = new Book();
					book.setBookName(rs.getString("bookName"));
					book.setPicture(rs.getString("picture"));
					searchList.add(book);
				}	
			}else{
				//没有找到相关书籍
				throw new NoRelativeBooksException("没有搜索到你想找的相关书籍！！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchList;
	}
	/**
	 * 分页显示书籍
	 * @param currentPage 显示出来的当前页码
	 * @param pageSize 每页显示数目
	 * @return Page
	 */
	public Page doPage(String keywords,int currentPage,int pageSize){
		Page page = new Page();
		int totalNum = searchBooks(keywords).size();
		System.out.println("totalNum="+totalNum);
		List pageList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_book where bookName like '%"+keywords+"%' limit "+currentPage+","+pageSize;
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Book book = new Book();
				book.setBookId(rs.getInt("bookId"));
				book.setBookName(rs.getString("bookName"));
				book.setPicture(rs.getString("picture"));
				book.setPrice(rs.getFloat("price"));
				book.setNowPrice(rs.getFloat("nowPrice"));
				pageList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		page.setPageList(pageList);
		page.setTotalNum(totalNum);
		return page;
	}
	/**
	 * 根据用户选择的搜索条件搜索相关书籍
	 * @param superTypeId 所属大类的ID
	 * @param subTypeId 所属小类的ID
	 * @param searchMethod （可以是按作者、书名、出版社、ISBN、价格中的一个）
	 * @param upLoadTime 书籍上价时间
	 * @return List
	 */
	public List searchBooksByConditions(int superTypeId,int subTypeId,String searchMethod,String upLoadTime){
		List bookList = new ArrayList();
		String str[] = searchMethod.split("=");
		System.out.println("str[0]="+str[0]+",str[1]="+str[1]);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = null;
		String upLoadDate = null;//截止日期
		String nowDate = null;//现在日期
		float priceLow = 0l;//价格最低价
		int dateLow = 0;//最暗时间
		float priceLower = 0l;//价格下界
		float priceTop = 0l;//价格上界
		if(str[0].equals("price")){//选择了按价格查询方式
			if(str[1].equals("大于200")){
				priceLow = 200l;
				if(upLoadTime.equals("大于30")){
					dateLow = 30;
					upLoadDate = this.getDate(dateLow);
					nowDate = this.getNowDate();
					System.out.println("nowDate="+nowDate);
					System.out.println("upLoadDate"+upLoadDate);
					//价格大于200，时间大于一个月
					sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+" >?";
				}else {
					//价格大于200，时间没有一个月
					dateLow = Integer.parseInt(upLoadTime);
					upLoadDate = this.getDate(dateLow);
					nowDate = this.getNowDate();
					System.out.println("nowDate="+nowDate);
					System.out.println("upLoadDate"+upLoadDate);
					sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+" >? and inTime between ? and ?";
				}
			}else{
				priceLower = Float.parseFloat(str[1].split("-")[0]);
				priceTop = Float.parseFloat(str[1].split("-")[1]);
				if(upLoadTime.equals("大于30")){
					//价格小于200，时间大于30
					dateLow = 30;
					upLoadDate = this.getDate(dateLow);
					nowDate = this.getNowDate();
					System.out.println("nowDate="+nowDate);
					sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+" between ? and ?";
				}else {
					//价格小于200，时间没有一个月
					dateLow = Integer.parseInt(upLoadTime);
					upLoadDate = this.getDate(dateLow);
					nowDate = this.getNowDate();
					System.out.println("nowDate="+nowDate);
					System.out.println("upLoadDate"+upLoadDate);
					sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+" between ? and ? and inTime between ? and ?";
				}
			}	
		}else {//选择的是其它查询方式
			if(upLoadTime.equals("大于30")){
				dateLow = 30;
				upLoadDate = this.getDate(dateLow);
				nowDate = this.getNowDate();
				System.out.println("nowDate="+nowDate);
				//时间大于一个月
				sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+"=?";
			}else {
				//时间没有一个月
				dateLow = Integer.parseInt(upLoadTime);
				upLoadDate = this.getDate(dateLow);
				nowDate = this.getNowDate();
				System.out.println("nowDate="+nowDate);
				System.out.println("upLoadDate="+upLoadDate);
				sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+"=? and inTime between ? and ?";
			}
		}
		System.out.println("sql="+sql);
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			if(str[0].equals("price")&& str[1].equals("大于200")&&upLoadTime.equals("大于30")){//按价格查询，价格大于200，时间大于一个月
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setFloat(3, priceLow);
			}
			if(str[0].equals("price")&& str[1].equals("大于200")&&!upLoadTime.equals("大于30")){//按价格查询，价格大于200，时间小于一个月
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setFloat(3, priceLow);
				pstmt.setString(4, upLoadDate);
				pstmt.setString(5, nowDate);
			}
			if(str[0].equals("price")&& !str[1].equals("大于200")&&upLoadTime.equals("大于30")){//按价格查询，价格小于200，时间大于一个月
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setFloat(3, priceLower);
				pstmt.setFloat(4, priceTop);
			}
			if(str[0].equals("price")&& !str[1].equals("大于200")&&!upLoadTime.equals("大于30")){//按价格查询，价格小于200，时间小于一个月
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setFloat(3, priceLower);
				pstmt.setFloat(4, priceTop);
				pstmt.setString(5, upLoadDate);
				pstmt.setString(6, nowDate);
			}
			if(!str[0].equals("price")&& upLoadTime.equals("大于30")){//按非价格方式查询，时间大于30天
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setString(3, str[1]);
			}
			if(!str[0].equals("price")&& !upLoadTime.equals("大于30")){//按非价格方式查询，时间小于30天
				System.out.println("按非价格方式查询，时间小于30天");
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setString(3, str[1]);
				pstmt.setString(4, upLoadDate);
				pstmt.setString(5, nowDate);
			}
			rs = pstmt.executeQuery();
			if(rs.next()){
				//有相关书籍
				while(rs.next()){
					Book book = new Book();
					book.setBookName(rs.getString("bookName"));
					book.setPicture(rs.getString("picture"));
					bookList.add(book);
				}	
			}else{
				//没有找到相关书籍
				throw new NoRelativeBooksException("没有搜索到你想找的相关书籍！！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bookList;
	}
	/**
	 * 根据用户选择的搜索条件搜索相关书籍
	 * @param superTypeId 所属大类的ID
	 * @param subTypeId 所属小类的ID
	 * @param searchMethod （可以是按作者、书名、出版社、ISBN、价格中的一个）
	 * @param upLoadTime 书籍上价时间
	 */
	public Page doPageByConditons(int superTypeId,int subTypeId,String searchMethod,String upLoadTime,int currentPage,int pageSize){
		Page page = new Page();
		String str[] = searchMethod.split("=");
		int totalNum = searchBooksByConditions(superTypeId,subTypeId,searchMethod,upLoadTime).size();
		System.out.println("totalNum"+totalNum);
		List pageList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = null;
		String upLoadDate = null;//截止日期
		String nowDate = null;//现在日期
		float priceLow = 0l;//价格最低价
		int dateLow = 0;//最暗时间
		float priceLower = 0l;//价格下界
		float priceTop = 0l;//价格上界
		if(str[0].equals("price")){//选择了按价格查询方式
			if(str[1].equals("大于200")){
				priceLow = 200l;
				if(upLoadTime.equals("大于30")){
					dateLow = 30;
					upLoadDate = this.getDate(dateLow);
					nowDate = this.getNowDate();
					System.out.println("nowDate="+nowDate);
					System.out.println("upLoadDate"+upLoadDate);
					//价格大于200，时间大于一个月
					sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+" >?";
				}else {
					//价格大于200，时间没有一个月
					dateLow = Integer.parseInt(upLoadTime);
					upLoadDate = this.getDate(dateLow);
					nowDate = this.getNowDate();
					System.out.println("nowDate="+nowDate);
					System.out.println("upLoadDate"+upLoadDate);
					sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+" >? and inTime between ? and ?";
				}
			}else{
				priceLower = Float.parseFloat(str[1].split("-")[0]);
				priceTop = Float.parseFloat(str[1].split("-")[1]);
				if(upLoadTime.equals("大于30")){
					//价格小于200，时间大于30
					dateLow = 30;
					upLoadDate = this.getDate(dateLow);
					nowDate = this.getNowDate();
					System.out.println("nowDate="+nowDate);
					sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+" between ? and ?";
				}else {
					//价格小于200，时间没有一个月
					dateLow = Integer.parseInt(upLoadTime);
					upLoadDate = this.getDate(dateLow);
					nowDate = this.getNowDate();
					System.out.println("nowDate="+nowDate);
					System.out.println("upLoadDate"+upLoadDate);
					sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+" between ? and ? and inTime between ? and ?";
				}
			}	
		}else {//选择的是其它查询方式
			if(upLoadTime.equals("大于30")){
				dateLow = 30;
				upLoadDate = this.getDate(dateLow);
				nowDate = this.getNowDate();
				System.out.println("nowDate="+nowDate);
				//时间大于一个月
				sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+"=?";
			}else {
				//时间没有一个月
				dateLow = Integer.parseInt(upLoadTime);
				upLoadDate = this.getDate(dateLow);
				nowDate = this.getNowDate();
				System.out.println("nowDate="+nowDate);
				System.out.println("upLoadDate"+upLoadDate);
				sql = "select * from tb_book where superTypeId=? and subTypeId=? and "+str[0]+"=? and inTime between ? and ?";
			}
		}
		System.out.println("sql="+sql);
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			if(str[0].equals("price")&& str[1].equals("大于200")&&upLoadTime.equals("大于30")){//按价格查询，价格大于200，时间大于一个月
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setFloat(3, priceLow);
			}
			if(str[0].equals("price")&& str[1].equals("大于200")&&!upLoadTime.equals("大于30")){//按价格查询，价格大于200，时间小于一个月
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setFloat(3, priceLow);
				pstmt.setString(4, upLoadDate);
				pstmt.setString(5, nowDate);
			}
			if(str[0].equals("price")&& !str[1].equals("大于200")&&upLoadTime.equals("大于30")){//按价格查询，价格小于200，时间大于一个月
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setFloat(3, priceLower);
				pstmt.setFloat(4, priceTop);
			}
			if(str[0].equals("price")&& !str[1].equals("大于200")&&!upLoadTime.equals("大于30")){//按价格查询，价格小于200，时间小于一个月
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setFloat(3, priceLower);
				pstmt.setFloat(4, priceTop);
				pstmt.setString(5, upLoadDate);
				pstmt.setString(6, nowDate);
			}
			if(!str[0].equals("price")&& upLoadTime.equals("大于30")){//按非价格方式查询，时间大于30天
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setString(3, str[1]);
			}
			if(!str[0].equals("price")&& !upLoadTime.equals("大于30")){//按非价格方式查询，时间小于30天
				pstmt.setInt(1, superTypeId);
				pstmt.setInt(2, subTypeId);
				pstmt.setString(3, str[1]);
				pstmt.setString(4, upLoadDate);
				pstmt.setString(5, nowDate);
			}
			rs = pstmt.executeQuery();
			while(rs.next()){
				Book book = new Book();
				book.setBookId(rs.getInt("bookId"));
				book.setBookName(rs.getString("bookName"));
				book.setPicture(rs.getString("picture"));
				book.setPrice(rs.getFloat("price"));
				book.setNowPrice(rs.getFloat("nowPrice"));
				book.setInTime(rs.getString("inTime"));
				book.setAuthor(rs.getString("author"));
				book.setPublisher(rs.getString("publisher"));
				pageList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		page.setPageList(pageList);
		page.setTotalNum(totalNum);
		return page;
	}
	
	//获取要查询的截止日期
	public String getDate(int days){
		SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		long dates = new Date().getTime()-days*24*60*60*1000;
		String date = myFormatter.format(dates);
		return date;
	}
	//获取现在的日期
	public String getNowDate(){
		SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String date = myFormatter.format(new Date());
		return date;
	}
}
