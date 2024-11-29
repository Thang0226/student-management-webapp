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
//				showCreateForm(request, response);
				break;
			case "edit":
//				showEditForm(request, response);
				break;
			case "delete":
//				showDeleteForm(request, response);
				break;
			case "view":
//				viewCustomer(request, response);
				break;
			default:
				listStudents(request, response);
				break;
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
