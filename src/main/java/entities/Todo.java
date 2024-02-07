package entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Todo {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int todo_id;
	private String todo_headline;
	private String todo_date;
	private String todo_time;
	private String todo_details;
	public int getTodo_id() {
		return todo_id;
	}
	public void setTodo_id(int todo_id) {
		this.todo_id = todo_id;
	}
	public String getTodo_headline() {
		return todo_headline;
	}
	public void setTodo_headline(String todo_headline) {
		this.todo_headline = todo_headline;
	}
	public String getTodo_date() {
		return todo_date;
	}
	public void setTodo_date(String todo_date) {
		this.todo_date = todo_date;
	}
	public String getTodo_time() {
		return todo_time;
	}
	public void setTodo_time(String todo_time) {
		this.todo_time = todo_time;
	}
	public String getTodo_details() {
		return todo_details;
	}
	public void setTodo_details(String todo_details) {
		this.todo_details = todo_details;
	}
	@Override
	public String toString() {
		return "Todo [todo_id=" + todo_id + ", todo_headline=" + todo_headline + ", todo_date=" + todo_date
				+ ", todo_time=" + todo_time + ", todo_details=" + todo_details + "]";
	}
	
	
}
