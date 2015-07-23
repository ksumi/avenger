package com.lovo.cq.shopping10_1.dao;

import java.util.List;

import com.lovo.cq.shopping10_1.po.SuperType;

public interface AdminSuperTypeDao {

	public boolean addSuperType(SuperType type);
	public List getSuperType();
	public boolean checkSuperTypeIsExist(String superTypeName);
}
