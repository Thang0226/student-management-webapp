package student_management.model;

public class Student {
	private int id;
	private String name;
	private int score;
	private int class_id;

	public Student(int id, String name, int score, int class_id) {
		this.id = id;
		this.name = name;
		this.score = score;
		this.class_id = class_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getClass_id() {
		return class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
}


