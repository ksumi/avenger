package com.lovo.cq.shopping10_1.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lovo.cq.shopping10_1.common.DbUtil;
import com.lovo.cq.shopping10_1.dao.AdminBookDao;
import com.lovo.cq.shopping10_1.po.Book;
import com.lovo.cq.shopping10_1.po.BookPager;
import com.lovo.cq.shopping10_1.po.Inform;
import com.lovo.cq.shopping10_1.po.InformPager;

public class AdminBookDaoImpl implements AdminBookDao{

	public List getAllBooks() {
		List books = new ArrayList();
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select * from tb_book";
			ps = daoUtil.getCon().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Book book = new Book();
				book.setBookId(rs.getInt("bookId"));
				book.setSuperTypeId(rs.getInt("superTypeId"));
				book.setSubTypeId(rs.getInt("subTypeId"));
				book.setBookName(rs.getString("bookName"));
				book.setIntroduce(rs.getString("introduce"));
				book.setPrice(rs.getFloat("price"));
				book.setNowPrice(rs.getFloat("nowPrice"));
				book.setPicture(rs.getString("picture"));
				book.setInTime(rs.getString("inTime"));
				book.setNewBooks(rs.getInt("newBooks"));
				book.setSaleBooks(rs.getInt("saleBooks"));
				book.setHostBooks(rs.getInt("hostBooks"));
				book.setBookNum(rs.getInt("bookNum"));
				books.add(book);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return books;
	}

	public boolean addBook(Book book) {
		DbUtil dao = null;
		PreparedStatement ps = null;
		String sql = "";
		try {
			dao = new DbUtil();
			sql = "insert into tb_book values(null,?,?,?,?,?,?,?,?,?,?,?,null,?,?,?,?,?)";
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, book.getSuperTypeId());
			ps.setInt(2, book.getSubTypeId());
			ps.setString(3, book.getBookName());
			ps.setString(4, book.getISBN());
			ps.setString(5, book.getIntroduce());
			ps.setFloat(6, book.getPrice());
			ps.setFloat(7, book.getNowPrice());
			ps.setString(8, book.getPicture());
			ps.setInt(9, book.getPages());
			ps.setString(10, book.getPublisher());
			ps.setString(11, book.getAuthor());
			ps.setInt(12, book.getNewBooks());
			ps.setInt(13, book.getSaleBooks());
			ps.setInt(14, book.getHostBooks());
			ps.setInt(15, book.getSpecialBooks());
			ps.setInt(16, book.getBookNum());
			int i = ps.executeUpdate();
			if(i != 0) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				dao.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return false;
	}

	public boolean checkBookNameIsExist(String bookName) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select * from tb_book where bookName = ?";
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, bookName);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return false;
	}

	public boolean checkISBNIsExist(String ISBN) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select * from tb_book where ISBN = ?";
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, ISBN);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return false;
	}

	public BookPager searchBook(String bookName) {
		Map bookMap = new HashMap();
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select * from tb_book where bookName like ?";
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, bookName+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				Book book = new Book();
				book.setBookId(rs.getInt("bookId"));
				book.setSuperTypeId(rs.getInt("superTypeId"));
				book.setSubTypeId(rs.getInt("subTypeId"));
				book.setBookName(rs.getString("bookName"));
				book.setIntroduce(rs.getString("introduce"));
				book.setPrice(rs.getFloat("price"));
				book.setNowPrice(rs.getFloat("nowPrice"));
				book.setPicture(rs.getString("picture"));
				book.setInTime(rs.getString("inTime"));
				book.setNewBooks(rs.getInt("newBooks"));
				book.setSaleBooks(rs.getInt("saleBooks"));
				book.setHostBooks(rs.getInt("hostBooks"));
				book.setBookNum(rs.getInt("bookNum"));
				bookMap.put(book.getBookId(),book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		BookPager bp = new BookPager();
		bp.setBookMap(bookMap);
		bp.setTotalNum(bookMap.size());
		return bp;
	}

	public List getAllBookName() {
		List bookNameList = new ArrayList();
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select bookName from tb_book";
			ps = daoUtil.getCon().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				bookNameList.add(rs.getString("bookName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return bookNameList;
	}
	public BookPager getBookPager(int index,int pageSize) {
		Map bookMap = new HashMap();
		DbUtil db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			db = new DbUtil();
			String sql = "select * from tb_book limit ?,?";
			ps = db.getCon().prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while(rs.next()) {
				Book book = new Book();
				book.setBookId(rs.getInt("bookId"));
				book.setSuperTypeId(rs.getInt("superTypeId"));
				book.setSubTypeId(rs.getInt("subTypeId"));
				book.setBookName(rs.getString("bookName"));
				book.setIntroduce(rs.getString("introduce"));
				book.setPrice(rs.getFloat("price"));
				book.setNowPrice(rs.getFloat("nowPrice"));
				book.setPicture(rs.getString("picture"));
				book.setInTime(rs.getString("inTime"));
				book.setNewBooks(rs.getInt("newBooks"));
				book.setSaleBooks(rs.getInt("saleBooks"));
				book.setHostBooks(rs.getInt("hostBooks"));
				book.setBookNum(rs.getInt("bookNum"));
				bookMap.put(book.getBookId(), book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				db.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		BookPager bp = new BookPager();
		bp.setBookMap(bookMap);
		bp.setPageSize(pageSize);
		bp.setTotalNum(getAllBooks().size());
		return bp;
	}
	public boolean deleteBook(int[] bookIds) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "delete from tb_book where bookId=?";
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for(int j=0;j<bookIds.length;j++) {
				ps.setInt(1, bookIds[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();
			if(k.length == bookIds.length) {
				return true;
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				ps.close();
				daoUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
