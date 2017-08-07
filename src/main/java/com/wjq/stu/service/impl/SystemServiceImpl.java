package com.wjq.stu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wjq.stu.bean.BaseDict;
import com.wjq.stu.dao.BaseDictDao;
import com.wjq.stu.service.SystemService;
/**
 * 基础信息数据字典
 * @author HarvestWu
 *
 */

@Service("systemService")
public class SystemServiceImpl implements SystemService{
	
	@Autowired
	private BaseDictDao baseDictDao;
	//根据类型编号查询数据字典
	public List<BaseDict> findBaseDictListByType(String typecode) {
		return baseDictDao.selectByTypecode(typecode);
	}
}
