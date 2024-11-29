package student_management.controller;

import student_management.model.Student;
import student_management.service.StudentService;
import student_management.service.StudentServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = "/students")
public class StudentServlet extends HttpServlet {
	private final StudentService studentService = new StudentServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "";
		}
		switch (action) {
			case "create":
				showCreateForm(request, response);
				break;
			case "edit":
				showEditForm(request, response);
				break;
			case "delete":
//				showDeleteForm(request, response);
				break;
			case "view":
//				viewStudent(request, response);
				break;
			default:
				listStudents(request, response);
				break;
		}
	}

	private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("student/create.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Student student = studentService.findById(id);
		RequestDispatcher dispatcher;
		if (student == null) {
			dispatcher = request.getRequestDispatcher("error_404.jsp");
		} else {
			request.setAttribute("student", student);
			dispatcher = request.getRequestDispatcher("student/edit.jsp");
		}
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Student> students = studentService.findAll();
		request.setAttribute("students", students);

		RequestDispatcher dispatcher = request.getRequestDispatcher("student/list.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		String action = request.getParameter("action");

		if (action == null) {
			action = "";
		}
		switch (action) {
			case "create":
				createStudent(request, response);
				break;
			case "edit":
				updateStudent(request, response);
				break;
			case "delete":
//				deleteStudent(request, response);
				break;
			default:
				break;
		}
	}

	private void createStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String score_str = request.getParameter("score");
		int score = Integer.parseInt(score_str);
		int id;
		do {
			id = (int) (Math.random() * 10000 + 1);
		} while (studentService.findById(id) != null);

		Student student = new Student(id, name, score);
		studentService.add(student);
		request.setAttribute("message", "New student was created");
		RequestDispatcher dispatcher = request.getRequestDispatcher("student/create.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id_str = request.getParameter("id");
		int id = Integer.parseInt(id_str);
		String name = request.getParameter("name");
		String score_str = request.getParameter("score");
		int score = Integer.parseInt(score_str);

		Student student = studentService.findById(id);
		student.setName(name);
		student.setScore(score);
		studentService.update(id, student);

		request.setAttribute("message", "Student information was modified");
		request.setAttribute("student", student);
		RequestDispatcher dispatcher = request.getRequestDispatcher("student/edit.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}
}
