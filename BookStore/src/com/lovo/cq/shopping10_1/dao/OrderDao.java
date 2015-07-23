package com.lovo.cq.shopping10_1.dao;

import java.util.List;

import com.lovo.cq.shopping10_1.po.Order;

/**
 * 对订单进行操作的接口 
 */
public interface OrderDao {
	
	//添加订单，并返回订一个单号
	public int addOrder(Order order);
	//根据当前用户的用户名查订单
	public List selectOrder(String name);
	//查订单项
	public List selectOrderItem(int id);
}
