package member;


import java.sql.*;

public class DBConnection {

	public static Connection getConnection() {
	 
		 Connection con = null;
		 PreparedStatement stmt = null;
		 ResultSet rs = null;

		 try {
		  String DB_SERVER = "203.229.204.85:3306";
		  String DB_USERNAME = "root";
		  String DB_PASSWORD = "1111";
		  String DB_DATABASE = "greenlight";
		  String DB_TABLE = "member";
		
		  String jdbcUrl = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE;

		  Class.forName("com.mysql.jdbc.Driver");
		  con = DriverManager.getConnection(jdbcUrl+"?useSSL=false", DB_USERNAME, DB_PASSWORD);
		  System.out.println("god");
		  /*
		  String query = "select * from "+ DB_TABLE;
		  stmt=con.prepareStatement(query);
		  rs=stmt.executeQuery();
		  
		  while(rs.next()) {
			   String number = rs.getString("name");
			   String name = rs.getString("classof");
			  }*/
		}
		
		catch(Exception e) {
			//System.out.println(e.toString());
		}
		
		return con;
		 
	}
}