package net.spmov.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConn {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {

		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");
		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/spmov?user=root&password=1234";
		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);
		return conn;

	}

}