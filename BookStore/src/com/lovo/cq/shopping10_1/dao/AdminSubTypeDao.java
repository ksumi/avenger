package com.lovo.cq.shopping10_1.dao;

import java.util.List;

import com.lovo.cq.shopping10_1.po.SubType;

public interface AdminSubTypeDao {

	public List getSubTypeBySuperTypeId(int superTypeId);
	public boolean addSubType(SubType type);
	public boolean checkSubTypeIsExist(String subTypeName);
}
