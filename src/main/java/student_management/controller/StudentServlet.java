package student_management.controller;

import student_management.DAO.StudentDAO;
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
	private final StudentDAO studentDAO = new StudentDAO();

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
				showDeleteForm(request, response);
				break;
			case "view":
				viewStudent(request, response);
				break;
			case "search":
				showSearchForm(request, response);
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
		Student student = studentDAO.findById(id);
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

	private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Student student = studentDAO.findById(id);
		RequestDispatcher dispatcher;
		if (student == null) {
			dispatcher = request.getRequestDispatcher("error-404.jsp");
		} else {
			request.setAttribute("student", student);
			dispatcher = request.getRequestDispatcher("student/delete.jsp");
		}
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}

	private void viewStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Student student = studentDAO.findById(id);
		RequestDispatcher dispatcher;
		if (student == null) {
			dispatcher = request.getRequestDispatcher("error-404.jsp");
		} else {
			request.setAttribute("student", student);
			dispatcher = request.getRequestDispatcher("student/view.jsp");
		}
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}

	private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("student/search.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Student> students = studentDAO.findAll();
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
				deleteStudent(request, response);
				break;
			case "search":
				searchStudent(request, response);
				break;
			default:
				break;
		}
	}

	private void createStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String score_str = request.getParameter("score");
		int score = 0;
		try {
			score = Integer.parseInt(score_str);
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());
		}
		int class_id = Integer.parseInt(request.getParameter("class_id"));

		studentDAO.add(name, score, class_id);
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

		Student student = studentDAO.findById(id);
		student.setName(name);
		student.setScore(score);
		studentDAO.update(id, student);

		request.setAttribute("message", "Student information was modified");
		request.setAttribute("student", student);
		RequestDispatcher dispatcher = request.getRequestDispatcher("student/edit.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		studentDAO.remove(id);
		response.sendRedirect("/students");
	}

	private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		List<Student> students = studentDAO.findAll();
		boolean found = false;
		for (Student student : students) {
			if (student.getName().equalsIgnoreCase(name)) {
				request.setAttribute("student", student);
				found = true;
				break;
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("student/view.jsp");
		if (!found) {
			request.setAttribute("message", "Student not found!");
		}
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			System.out.println(e.getMessage());
		}
	}
}
