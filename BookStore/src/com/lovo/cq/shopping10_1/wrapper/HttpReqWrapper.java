package com.lovo.cq.shopping10_1.wrapper;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class HttpReqWrapper extends HttpServletRequestWrapper {

	private Map<String,String> map = null;
	public HttpReqWrapper(HttpServletRequest request) {
		super(request);
	}
	//过滤脏话
	public String replace(String str){
		StringBuffer sb = new StringBuffer(str);
		Set<String>keys = this.getMap().keySet();
		Iterator<String>it = keys.iterator();
		String ss = null;
		while(it.hasNext()) {
			String key = it.next();
			System.out.println("key="+key);
			int index = sb.indexOf(key);
			System.out.println("index="+index);
			if(index != -1) {
				if(key != null)
					ss = key;
				sb.replace(index, index+key.length(), this.getMap().get(key));
			}
		}
		System.out.println("ss="+ss);
		System.out.println("过滤后的content="+sb.toString());
		if(ss!=null) {
			if (sb.toString().indexOf(ss) == -1) {
				return sb.toString();
			} else {
				System.out.println("进来了!");
				return replace(sb.toString());
			}
		}
		return sb.toString();
	}

//	重写getParameter()方法
	public String getParameter(String str) {
		System.out.println("str="+str);
		if(str.equals("pager.offset")){
			return super.getParameter(str);
		}else{
			String content =  super.getParameter(str);
			System.out.println("还没过滤的content="+content);
			return replace(content);
		}	
	}

	public Map<String,String> getMap() {
		return map;
	}

	public void setMap(Map<String,String> map) {
		this.map = map;
	}
	
	
}
