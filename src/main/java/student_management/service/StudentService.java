package student_management.service;

import student_management.model.Student;

import java.util.List;

public interface StudentService {
	List<Student> findAll();

	void add(Student student);

	Student findById(int id);

	void update(int id, Student student);

	void remove(int id);
}
