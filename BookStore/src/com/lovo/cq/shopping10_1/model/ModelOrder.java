package com.lovo.cq.shopping10_1.model;

import java.util.List;

import com.lovo.cq.shopping10_1.dao.OrderDao;
import com.lovo.cq.shopping10_1.daoimpl.OrderDaoImpl;

public class ModelOrder {
	private OrderDao ordao = new OrderDaoImpl();

	public List selectOr(String name) {
		List list = ordao.selectOrder(name);
		return list;
	}
    public List selectOrderIt(int id ){
    	List list = ordao.selectOrderItem(id);
		return list;
    }
}
