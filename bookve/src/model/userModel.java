package model;

public class userModel {
	private int iduser;
	private String lastname;
	private String name;
	private String phone;
	private String email;
	private String password;
	private String area;
	private String role;
	public int getIduser() {
		return iduser;
	}
	public void setIduser(int iduser) {
		this.iduser = iduser;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public userModel(int iduser, String lastname, String name, String phone, String email, String password, String area,
			String role) {
		super();
		this.iduser = iduser;
		this.lastname = lastname;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.area = area;
		this.role = role;
	}
	public userModel() {
		super();
	}
	

	
}
