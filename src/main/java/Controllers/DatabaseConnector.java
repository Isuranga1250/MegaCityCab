package Controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
	public static Connection getConnection() throws ClassNotFoundException,SQLException {
		String username = "user1";
		String password =  "12345678";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", username, password);
		return connection;
	}
	
	public static void main(String[] args) {
	    try {
	        Connection conn = DatabaseConnector.getConnection();
	        if (conn != null) {
	            System.out.println("Database connected successfully!");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}