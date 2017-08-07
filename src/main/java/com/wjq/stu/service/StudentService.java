package com.wjq.stu.service;

import com.wjq.stu.utils.Page;
import com.wjq.stu.bean.Student;

/**
 * 
 * @author HarvestWu
 *
 */

public interface StudentService {

	// 查询列表
	public Page<Student> findStudentList(Integer page, Integer rows, 
			String studentName,  String studentSex,String studentCollage,String studentGrade);

	public Student getStudentById(Long id);

	public void updateStudent(Student student);
	
	public void insertStudent(Student student);

	public void deleteStudent(Long id);
}
