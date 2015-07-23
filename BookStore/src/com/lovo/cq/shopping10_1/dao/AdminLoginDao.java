package com.lovo.cq.shopping10_1.dao;

import com.lovo.cq.shopping10_1.po.Admin;

public interface AdminLoginDao {

	public boolean login(Admin admin);
	public boolean updatePassword(Admin admin);
}
