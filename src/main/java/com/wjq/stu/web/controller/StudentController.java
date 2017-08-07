package com.wjq.stu.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wjq.stu.utils.Page;
import com.wjq.stu.bean.BaseDict;
import com.wjq.stu.bean.Student;
import com.wjq.stu.bean.User;
import com.wjq.stu.service.StudentService;
import com.wjq.stu.service.SystemService;
import com.wjq.stu.service.UserService;

/**
 * 
 * @author HarvestWu
 *
 */

@Controller
public class StudentController {

	// 依赖注入
	@Autowired
	private StudentService studentService;
	@Autowired
	private SystemService systemService;
	@Value("${student.sex.type}")
	private String SEX_TYPE;
	@Value("${student.college.type}")
	private String COLLEGE_TYPE;
	@Value("${student.grade.type}")
	private String GRADE_TYPE;

	@RequestMapping(value = "/student")
	public String showStudent() {
		return "redirect:/student/list.action";
	}

	// 学生列表
	@RequestMapping(value = "/student/list")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
			String studentName, String studentSex, String studentCollege, String studentGrade, Model model) {

		Page<Student> students = studentService.findStudentList(page, rows, studentName, studentSex, studentCollege,
				studentGrade);
		model.addAttribute("page", students);
		// 性别
		List<BaseDict> sexType = systemService.findBaseDictListByType(SEX_TYPE);
		// 学院
		List<BaseDict> collegeType = systemService.findBaseDictListByType(COLLEGE_TYPE);
		// 年级
		List<BaseDict> gradeType = systemService.findBaseDictListByType(GRADE_TYPE);
		model.addAttribute("sexType", sexType);
		model.addAttribute("collegeType", collegeType);
		model.addAttribute("gradeType", gradeType);
		// 参数回显
		model.addAttribute("studentName", studentName);
		model.addAttribute("studentSex", studentSex);
		model.addAttribute("studentCollege", studentCollege);
		model.addAttribute("studentGrade", studentGrade);
		return "student";
	}

	@RequestMapping("/student/edit")
	@ResponseBody
	public Student getStudentById(Long id) {
		Student student = studentService.getStudentById(id);
		return student;
	}

	@RequestMapping("/student/update")
	@ResponseBody
	public String studentUpdate(Student student) {
		studentService.updateStudent(student);
		return "OK";
	}

	@RequestMapping("/student/insert")
	@ResponseBody
	public String studentInsert(Student student) {
		studentService.insertStudent(student);
		return "OK";
	}

	@RequestMapping("/student/delete")
	@ResponseBody
	public String studentDelete(Long id) {
		studentService.deleteStudent(id);
		return "OK";
	}
	
	@Autowired
    UserService userService;


    @RequestMapping("/student/login")
    public String login(User user,HttpServletRequest request){
    boolean loginType = userService.login(user.getUserName(),user.getPassword());
    if(loginType){
        request.setAttribute("user",user);
            HttpSession session = request.getSession(true);
            session.setAttribute("userName", user.getUserName());
        return "redirect:/student/list.action";
    }else{
        request.setAttribute("message","用户名密码错误");
        return "error";
    }
}


}
