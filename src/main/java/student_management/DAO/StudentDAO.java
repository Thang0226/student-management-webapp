package student_management.DAO;

import student_management.model.Student;
import student_management.service.StudentService;

import java.sql.*;
import java.util.List;

public class StudentDAO implements StudentService {
	private String jdbcURL = "jdbc:mysql://localhost:3306/student_management";
	private String jdbcUsername = "root";
	private String jdbcPassword = "123456";

	protected Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	}

	@Override
	public List<Student> findAll() {
		return null;
	}

	@Override
	public void add(Student student) {

	}

	@Override
	public Student findById(int id) {
		return null;
	}

	@Override
	public void update(int id, Student student) {

	}

	@Override
	public void remove(int id) {

	}
}
