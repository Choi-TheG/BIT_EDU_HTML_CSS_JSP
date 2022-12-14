package lesson.gntp.vo;

public class ValueObject {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String joinDate;
	
	public ValueObject(String id, String pw, String name, String email, String joinDate) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.joinDate = joinDate;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id=id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
}
