package myconnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class MyconnectionCheck {
	   public static Connection getConnection(){
			Connection con = null;   
			try {
				//Registering the driver.
				Class.forName("com.mysql.cj.jdbc.Driver");
				//Getting the connection.
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiffin?allowPublicKeyRetrieval=true&useSSL=false", "root","dhanraj");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return con;
		}

	}