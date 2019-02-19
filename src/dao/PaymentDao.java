package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import net.spmov.Util.DbConn;

public class PaymentDao {
	private Connection connection;
	
	public int PayMovie(String userID,String theatreID,String movieID,String Theatre_movieID,String row,String column) throws Exception {
		connection=DbConn.getConnection();
		System.out.println("userID"+userID+" theatreID"+theatreID +" movieID"+movieID+" Theatre_movieID"+ Theatre_movieID +"row"+row +" column"+column);
		int count =0;
		String sql="insert into reservation (BookedBy,seatID,Theatre_movieID) values ("+userID +",(select seatID from seat where Row= "+row +" and Number= "+column +")," +Theatre_movieID+")";
		Statement pstmt = connection.createStatement();
		count = pstmt.executeUpdate(sql);
		
		return count;

		
	}
}
