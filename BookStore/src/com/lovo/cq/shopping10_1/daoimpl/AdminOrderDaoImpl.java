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
import com.lovo.cq.shopping10_1.dao.AdminOrderDao;
import com.lovo.cq.shopping10_1.po.Inform;
import com.lovo.cq.shopping10_1.po.InformPager;
import com.lovo.cq.shopping10_1.po.Order;
import com.lovo.cq.shopping10_1.po.OrderFreezePager;
import com.lovo.cq.shopping10_1.po.OrderItem;
import com.lovo.cq.shopping10_1.po.OrderNotSendPager;
import com.lovo.cq.shopping10_1.po.OrderPager;
import com.lovo.cq.shopping10_1.po.OrderSendPager;
import com.lovo.cq.shopping10_1.po.User;

public class AdminOrderDaoImpl implements AdminOrderDao {

	public List getAllOrder() {
		List orderList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_order";
			ps = dao.getCon().prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				User user = new User();
				order.setOrderId(rs.getInt("orderId"));
				user.setName(rs.getString("name"));
				order.setRecvName(rs.getString("realName"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setEmail(rs.getString("email"));
				order.setUser(user);
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}

	public Order getOneOrder(int id) {
		Order order = new Order();
		List orderItemList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_orderItem where orderId = ?";
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				OrderItem orderItem = new OrderItem();
				orderItem.setOrderItemId(rs.getInt("orderItemId"));
				orderItem.setOrderId(rs.getInt("orderId"));
				orderItem.setBookId(rs.getInt("bookId"));
				orderItem.setBookName(rs.getString("bookName"));
				orderItem.setPrice(rs.getFloat("price"));
				orderItem.setBookNum(rs.getInt("bookNum"));
				orderItemList.add(orderItem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		order.setOrderItem(orderItemList);
		return order;
	}

	public List getNotSendOrder(int flag) {
		List orderList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_order where flag = ?";
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, flag);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				User user = new User();
				order.setOrderId(rs.getInt("orderId"));
				user.setName(rs.getString("name"));
				order.setRecvName(rs.getString("recvName"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setEmail(rs.getString("email"));
				order.setUser(user);
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}

	public List getSendOrder(int flag) {
		List orderList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_order where flag = ?";
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, flag);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				User user = new User();
				order.setOrderId(rs.getInt("orderId"));
				user.setName(rs.getString("name"));
				order.setRecvName(rs.getString("realName"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setEmail(rs.getString("email"));
				order.setUser(user);
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}

	public boolean SendOrder(int[] orderids) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "update tb_order set flag=1 where orderId=?";
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for(int j=0;j<orderids.length;j++) {
				ps.setInt(1, orderids[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();
			if(k.length == orderids.length) {
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

	public OrderPager getOrderPager(int index, int pageSize) {
		Map orderMap = new HashMap();
		DbUtil db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			db = new DbUtil();
			String sql = "select * from tb_order limit ?,?";
			ps = db.getCon().prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				User user = new User();
				order.setOrderId(rs.getInt("orderId"));
				user.setName(rs.getString("name"));
				order.setRecvName(rs.getString("realName"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setEmail(rs.getString("email"));
				order.setUser(user);
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				orderMap.put(order.getOrderId(), order);
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
		OrderPager op = new OrderPager();
		op.setOrderMap(orderMap);
		op.setPageSize(pageSize);
		op.setTotalNum(getAllOrder().size());
		return op;
	}

	public OrderSendPager getOrderSendPager(int index, int pageSize) {
		Map orderMap = new HashMap();
		DbUtil db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			db = new DbUtil();
			String sql = "select * from tb_order where flag=1 limit ?,?";
			ps = db.getCon().prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				User user = new User();
				order.setOrderId(rs.getInt("orderId"));
				user.setName(rs.getString("name"));
				order.setRecvName(rs.getString("realName"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setEmail(rs.getString("email"));
				order.setUser(user);
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				orderMap.put(order.getOrderId(), order);
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
		OrderSendPager op = new OrderSendPager();
		op.setOrderMap(orderMap);
		op.setPageSize(pageSize);
		op.setTotalNum(getSendOrder(1).size());
		return op;
	}
	public boolean deleteOrder(int[] ids) {
		
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "delete from tb_order where orderId=?";
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for(int j=0;j<ids.length;j++) {
				ps.setInt(1, ids[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();
			if(k.length == ids.length) {
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

	public OrderNotSendPager getOrderNotSendPager(int index, int pageSize) {
		Map orderMap = new HashMap();
		DbUtil db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			db = new DbUtil();
			String sql = "select * from tb_order where flag=0 limit ?,?";
			ps = db.getCon().prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				User user = new User();
				order.setOrderId(rs.getInt("orderId"));
				user.setName(rs.getString("name"));
				order.setRecvName(rs.getString("realName"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setEmail(rs.getString("email"));
				order.setUser(user);
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				orderMap.put(order.getOrderId(), order);
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
		OrderNotSendPager op = new OrderNotSendPager();
		op.setOrderMap(orderMap);
		op.setPageSize(pageSize);
		op.setTotalNum(getSendOrder(0).size());
		return op;
	}
	public OrderFreezePager getOrderFreezePager(int index,int pageSize) {
		Map orderMap = new HashMap();
		DbUtil db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			db = new DbUtil();
			String sql = "select * from tb_order where flag=2 limit ?,?";
			ps = db.getCon().prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				User user = new User();
				order.setOrderId(rs.getInt("orderId"));
				user.setName(rs.getString("name"));
				order.setRecvName(rs.getString("realName"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setEmail(rs.getString("email"));
				order.setUser(user);
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				orderMap.put(order.getOrderId(), order);
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
		OrderFreezePager op = new OrderFreezePager();
		op.setOrderMap(orderMap);
		op.setPageSize(pageSize);
		op.setTotalNum(getSendOrder(2).size());
		return op;
	}

	public boolean freezeOrder(int[] orderids) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "update tb_order set flag=2 where orderId=?";
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for(int j=0;j<orderids.length;j++) {
				ps.setInt(1, orderids[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();
			if(k.length == orderids.length) {
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
