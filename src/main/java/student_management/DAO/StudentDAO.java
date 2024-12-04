package student_management.DAO;

import student_management.model.Student;
import student_management.service.StudentService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO implements StudentService {
	private String jdbcURL = "jdbc:mysql://localhost:3306/student_management";
	private String jdbcUsername = "root";
	private String jdbcPassword = "123456";

	protected Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	}

	@Override
	public List<Student> findAll() {
		List<Student> students = new ArrayList<>();
		try (
				Connection conn = getConnection();
				CallableStatement cstmt = conn.prepareCall("{call list_students()}")
		) {
			ResultSet rs = cstmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int score = rs.getInt("score");
				int class_id = rs.getInt("class_id");
				Student student = new Student(id, name, score, class_id);
				students.add(student);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return students;
	}

	@Override
	public void add(Student student) {

	}

	@Override
	public Student findById(int id) {
		Student student = null;
		try (
				Connection conn = getConnection();
				CallableStatement cstmt = conn.prepareCall("{call find_student(?)}")
		) {
			cstmt.setInt(1, id);
			ResultSet rs = cstmt.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				int score = rs.getInt("score");
				int class_id = rs.getInt("class_id");
				student = new Student(id, name, score, class_id);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return student;
	}

	@Override
	public void update(int id, Student student) {

	}

	@Override
	public void remove(int id) {
		try (
				Connection conn = getConnection();
				CallableStatement cstmt = conn.prepareCall("{call delete_student(?)}")
		) {
			cstmt.setInt(1, id);
			int rowAffected = cstmt.executeUpdate();
			if (rowAffected == 0) {
				throw new SQLException("Student with id " + id + " not found");
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
