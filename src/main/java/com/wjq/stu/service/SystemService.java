package com.wjq.stu.service;

import java.util.List;

import com.wjq.stu.bean.BaseDict;

/**
 * 
 * @author HarvestWu
 *
 */
 
public interface SystemService {

	//根据类型查询数据字典
		public List<BaseDict> findBaseDictListByType(String typecode);
	
}
