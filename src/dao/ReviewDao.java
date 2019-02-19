package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import net.spmov.Util.DbConn;

public class ReviewDao {
	private Connection connection;

	public ReviewDao() throws Exception {
		connection = DbConn.getConnection();
	}
	
public boolean addOneReview(String MovieID,String Name,String Detail,String contact,String Rating)
		throws SQLException, ClassNotFoundException {

	connection = DbConn.getConnection();

	String editQuery = " Insert into review (MovieID,Detail,Name,contact,Rating)VALUES(?,?,?,?,?)";

	PreparedStatement pstmt;

	pstmt = connection.prepareStatement(editQuery);

	pstmt.setInt(1, Integer.parseInt(MovieID));
	pstmt.setString(2, Detail);
	pstmt.setString(3, Name);
	pstmt.setInt(4, Integer.parseInt(contact));
	pstmt.setInt(5, Integer.parseInt(Rating));
	int count = pstmt.executeUpdate();

	connection.close();
	if (count != 0) {
		System.out.println("Num of record: " + count);
		return true;
	} else {
		System.out.println("No Row Record Retrieved");
		return false;
	}
}
}
