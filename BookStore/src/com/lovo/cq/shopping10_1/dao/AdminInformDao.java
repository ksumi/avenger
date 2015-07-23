package com.lovo.cq.shopping10_1.dao;

import java.util.List;

import com.lovo.cq.shopping10_1.po.Inform;
import com.lovo.cq.shopping10_1.po.InformPager;

public interface AdminInformDao {

	public boolean addInform(Inform inform);
	public List getAllInform();
	public boolean deleteInform(int[] ids);
	public Inform getOneInform(int id);
	public InformPager getInformPager(int index,int pageSize);
}
