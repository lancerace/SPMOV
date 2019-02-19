package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.User;
import net.spmov.Util.DbConn;

public class UserDao {
	private Connection connection;

	public UserDao() throws ClassNotFoundException, SQLException {
		connection = DbConn.getConnection();

	}

	public User getOneUser(String username, String password) throws ClassNotFoundException, SQLException {

		connection = DbConn.getConnection();
		User mUser = new User();
		String query = " SELECT USERID,UserName,pwd from user where UserName=? and pwd=? ";

		PreparedStatement pstmt;

		pstmt = connection.prepareStatement(query);
		System.out.println("DB START HERE!!");
		System.out.println("DB: " + username + password);
		pstmt.setString(1, username);
		pstmt.setString(2, password);

		ResultSet rs = pstmt.executeQuery();
		System.out.println("Row is: " + rs.getRow());
		if (rs.next()) {
			mUser.setmUserID(rs.getInt("UserID"));
			mUser.setmUsername(rs.getString("UserName"));
			mUser.setmPassword(rs.getString("pwd"));
		}

		connection.close();
		return mUser;
	}
	// end GetOneUser

}
