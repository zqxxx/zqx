package com.wjq.stu.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wjq.stu.utils.Page;
import com.wjq.stu.bean.Student;
import com.wjq.stu.dao.BaseDictDao;
import com.wjq.stu.dao.StudentDao;
import com.wjq.stu.service.StudentService;

/**
 * 
 * @author HarvestWu
 *
 */

@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {

	// 定义dao属性
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private BaseDictDao baseDictDao;

	
	public Page<Student> findStudentList(Integer page, Integer rows, 
			String studentName,  String studentSex,String studentCollege,String studentGrade) {
		Student student = new Student();
		//判断学生姓名
		if(StringUtils.isNotBlank(studentName)){
			student.setStu_name(studentName);
		}
		//判断学生性别
		if(StringUtils.isNotBlank(studentSex)){
			student.setStu_sex(studentSex);
		}
		//判断所属学院
		if(StringUtils.isNotBlank(studentCollege)){
			student.setStu_college(studentCollege);
		}
		//判断所属年级
		if(StringUtils.isNotBlank(studentGrade)){
			student.setStu_grade(studentGrade);
		}
		//当前页
		student.setStart((page-1) * rows) ;
		//每页数
		student.setRows(rows);
		//查询学生列表
		List<Student> students = studentDao.selectStudentList(student);
		//查询列表总记录数
		Integer count = studentDao.selectStudentListCount(student);
		//创建Page返回对象
		Page<Student> result = new Page<>();
		result.setPage(page);
		result.setRows(students);
		result.setSize(rows);
		result.setTotal(count);
		return result;

	}


	@Override
	public Student getStudentById(Long id) {
		
		Student student = studentDao.getStudentById(id);
		return student;
		
	}


	@Override
	public void updateStudent(Student student) {
		studentDao.updateStudent(student);
		
	}
	
	@Override
	public void insertStudent(Student student) {
		studentDao.insertStudent(student);
		
	}

	@Override
	public void deleteStudent(Long id) {
		studentDao.deleteStudent(id);
		
	}


}
