package com.wjq.stu.dao;

import java.util.List;

import com.wjq.stu.bean.Student;


/**
 * 
 * @author HarvestWu
 *
 */
 
public interface StudentDao {

	List<Student> selectStudentList(Student student);
	Integer selectStudentListCount(Student student);
	Student getStudentById(Long id);
	void updateStudent(Student student);
	void insertStudent(Student student);
	void deleteStudent(Long id);
	
}