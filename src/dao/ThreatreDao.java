package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import Model.TheatreMovie;
import Model.Threatre;
import net.spmov.Util.DbConn;

public class ThreatreDao {
	private Connection connection;

	public ThreatreDao() throws Exception {
		connection = DbConn.getConnection();

	}

	public ArrayList<Threatre> getAllThreatre(String classType) throws ClassNotFoundException, SQLException {

		connection = DbConn.getConnection();
		Statement statement = connection.createStatement();
		ArrayList<Threatre> mThreatres = new ArrayList<Threatre>();
		// all data is transferred from MYSQL to variable rs.

		PreparedStatement pstmt;
		pstmt = connection.prepareStatement(" call getAllRecords(?) ");
		pstmt.setString(1, classType);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			Threatre threatre = new Threatre();
			threatre.setmThreatreID(rs.getInt("TheatreID"));
			threatre.setmTheatreName(rs.getString("TheatreName"));
			threatre.setmRow(rs.getInt("Row"));
			threatre.setmColumn(rs.getInt("Column"));
			threatre.setmCreatedUserName(rs.getString("username"));
			threatre.setmCreatedAt(rs.getDate("CreatedAt"));
			threatre.setmUpdatedAt(rs.getDate("UpdatedAt"));

			mThreatres.add(threatre);
		}
		connection.close();
		return mThreatres;

	}

	public ArrayList<Threatre> getAllMoviesByThreatreID(String classType, int ID)
			throws ClassNotFoundException, SQLException {

		connection = DbConn.getConnection();

		ArrayList<Threatre> mThreatres = new ArrayList<Threatre>();
		// all data is transferred from MYSQL to variable rs.

		PreparedStatement pstmt;

		pstmt = connection.prepareStatement("getAllRecordsByID(?,?)");
		pstmt.setString(1, classType);
		pstmt.setInt(2, ID);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			Threatre threatre = new Threatre();
			threatre.setmThreatreID(rs.getInt("ThreatreID"));
			threatre.setmTheatreName(rs.getString("TheatreName"));
			threatre.setmCreatedBy(rs.getInt("CreatedBy"));
			threatre.setmUpdatedBy(rs.getInt("UpdatedBy"));
			threatre.setmCreatedAt(rs.getDate("CreatedAt"));
			threatre.setmUpdatedAt(rs.getDate("UpdatedAt"));
			mThreatres.add(threatre);
		}
		connection.close();
		return mThreatres;

	}

	// generic object(JSONFormat) as parameter
	public void assignMovieToTheatre(TheatreMovie[] theatreMovieArray)
			throws ClassNotFoundException, SQLException, ParseException {
		connection = DbConn.getConnection();
		Statement statement = connection.createStatement();
		PreparedStatement pstmt;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		for (int i = 0; i < theatreMovieArray.length; i++) {
			pstmt = connection.prepareStatement(" call addTheatreMovie(?,?,?) ");
			pstmt.setInt(1, theatreMovieArray[i].getmTheatreID());
			pstmt.setInt(2, theatreMovieArray[i].getmMovieID());
			// 1*****
			// java.sql.date does not insert time to sql after hours of
			// research..
			// lots of problems posted such as util.Date to sq.Date conversion.
			// imposing error several times.
			// solution = correct indication for new SimpleDateFormat();
			// 2*****
			// Adding date and time to sql use java.Sql.TimeStamp Object rather
			// than java.sql.Date
			String mTimeSlot = theatreMovieArray[i].getmTimeSlot();
			java.util.Date date = sdf.parse(mTimeSlot);
			java.sql.Timestamp mTimeStamp = new Timestamp(date.getTime());
			System.out.println("Timestamp...:" + mTimeStamp);
			pstmt.setTimestamp(3, mTimeStamp);
			pstmt.executeUpdate();
		}

		connection.close();

	}

	public boolean addOneTheatre(String inTheatreName, int inRow, int inColumn, int inCreatedBy)
			throws SQLException, ClassNotFoundException {

		connection = DbConn.getConnection();

		String editQuery = " call addOneTheatre(?,?,?,?); ";
		PreparedStatement pstmt;
		ResultSet rs = null;

		pstmt = connection.prepareStatement(editQuery);
		pstmt.setString(1, inTheatreName);
		pstmt.setInt(2, inRow);
		pstmt.setInt(3, inColumn);
		pstmt.setInt(4, inCreatedBy);

		int rowAffected = pstmt.executeUpdate();

		connection.close();

		if (rowAffected != 0)
			return true;
		else
			return false;

	}

}
