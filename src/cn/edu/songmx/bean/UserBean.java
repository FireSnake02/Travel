package cn.edu.songmx.bean;

public class UserBean {
    // 用户ID
	private int user_id;
    // 用户名
	private String username;
    // 电子邮箱
	private String email;
    // 密码
	private String password;
    // 手机号
	private String phone_number;
	// 用户权限
	private String role;

	public UserBean() {

	}

	public UserBean(String username, String email, String password, String phone_number,String role) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone_number = phone_number;
		this.role = role;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
