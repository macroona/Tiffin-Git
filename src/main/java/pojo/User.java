package pojo;

public class User {
	int userid;
	String username;
	String userpassword;
	String usertype;
	String useremail;
	String user_address;
	String user_gender;
	String user_phonenumber;
	
	public User() {
		super();
	}

	public User(int userid, String username, String userpassword, String usertype, String useremail,
			String user_address, String user_gender, String user_phonenumber) {
		super();
		this.userid = userid;
		this.username = username;
		this.userpassword = userpassword;
		this.usertype = usertype;
		this.useremail = useremail;
		this.user_address = user_address;
		this.user_gender = user_gender;
		this.user_phonenumber=user_phonenumber;
	}

	public String getUser_address() {
		return user_address;
	}

	public String getUser_phonenumber() {
		return user_phonenumber;
	}

	public void setUser_phonenumber(String user_phonenumber) {
		this.user_phonenumber = user_phonenumber;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	

}
