package project;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider 
{
	public static Connection getConnection()
    {
   	 try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/online_Shopping_db";
			Connection conn = DriverManager.getConnection(url,"root","admin@123");
			return conn;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
   	
    }
}
