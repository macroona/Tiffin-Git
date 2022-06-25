package pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Userservice {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	
	public Userservice(Connection con) {
		this.con=con;
	}
	
	public User userlogin(String email,String password) {
		User user=null;
		try {
			query="select * from user where useremail=? and userpassword=?";
			pst=this.con.prepareStatement(query);
			 pst.setString(1, email);
			 pst.setString(2, password);
			 
			rs= pst.executeQuery();
			 if(rs.next()) {
				 user=new User();
				 user.setUserid(rs.getInt("userid"));
				 user.setUsername(rs.getString("username"));
				 user.setUseremail(rs.getString("useremail"));
				 user.setUser_gender(rs.getString("user_gender"));
				 
			 }
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}
}
