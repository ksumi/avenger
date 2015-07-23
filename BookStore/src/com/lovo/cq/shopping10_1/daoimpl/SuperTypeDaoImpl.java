package com.lovo.cq.shopping10_1.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.lovo.cq.shopping10_1.common.DbUtil;
import com.lovo.cq.shopping10_1.dao.SuperTypeDao;
import com.lovo.cq.shopping10_1.po.SuperType;

public class SuperTypeDaoImpl implements SuperTypeDao {

	public List showAllSuperType() {
		List superList = new ArrayList();
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		DbUtil dbUtil = null;
		try {
			dbUtil = new DbUtil();
			String sql = "select * from tb_superType";
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SuperType st = new SuperType();
				st.setSuperTypeId(rs.getInt(1));
				st.setTypeName(rs.getString(2));
				superList.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return superList;
	}
	
}
