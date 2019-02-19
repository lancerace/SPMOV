package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.Cast;
import net.spmov.Util.DbConn;

public class CastDao {
	private Connection connection;

	public CastDao() throws Exception {
		connection = DbConn.getConnection();

	}

	public void deleteAllCastsFromMovie(int movieID) throws ClassNotFoundException, SQLException {

		connection = DbConn.getConnection();
		PreparedStatement pstmt;
		pstmt = connection.prepareStatement("DELETE from moviecast WHERE movieID= ? ");
		pstmt.setInt(1, movieID);
		int count = pstmt.executeUpdate();

		connection.close();

		if (count != 0)
			System.out.println("Num of record: " + count);
		else
			System.out.println("No Row Record Retrieved");
	}

	public List<Cast> getAllCast() throws ClassNotFoundException, SQLException {

		List<Cast> mCastList = new ArrayList<Cast>();

		connection = DbConn.getConnection();
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("Select CastID,Name,Age,CreatedAt,UpdatedAt from Cast");

		while (rs.next()) {
			Cast mCast = new Cast();
			mCast.setmCastID(rs.getInt("CastID"));
			mCast.setmName(rs.getString("Name"));
			mCast.setmAge(rs.getString("Age"));
			mCast.setmCreatedAt(rs.getDate("CreatedAt"));
			mCast.setmUpdatedAt(rs.getDate("UpdatedAt"));
			mCastList.add(mCast);
		}
		connection.close();
		return mCastList;

	}
	// end getAllCast()

	public List<Cast> getAllCastByMovieID(int movieID) throws ClassNotFoundException, SQLException {

		List<Cast> mCastList = new ArrayList<Cast>();

		connection = DbConn.getConnection();
		PreparedStatement pstmt;
		ResultSet rs = null;
		pstmt = connection.prepareStatement(" CALL getAllCastByMovieID (?); ");

		pstmt.setInt(1, movieID);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			Cast mCast = new Cast();
			mCast.setmCastID(rs.getInt("CastID"));
			mCast.setmName(rs.getString("Name"));
			mCast.setmAge(rs.getString("Age"));
			mCast.setmCreatedAt(rs.getDate("CreatedAt"));
			mCast.setmUpdatedAt(rs.getDate("UpdatedAt"));
			mCastList.add(mCast);
		}

		connection.close();
		return mCastList;

	}

}
