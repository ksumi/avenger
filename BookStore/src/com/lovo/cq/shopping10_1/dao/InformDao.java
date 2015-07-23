package com.lovo.cq.shopping10_1.dao;

import java.util.List;

import com.lovo.cq.shopping10_1.po.Inform;

public interface InformDao {
	//根据时间来显示相应的公告
	public List showInformByInTime();
	//根据公告的ID得到该公告信息
	public Inform getInformById(int infromId);
}
