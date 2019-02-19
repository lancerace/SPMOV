package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Model.BookSeatInfo;
import Model.BookedSeat;
import Model.Theatre;
import net.spmov.Util.DbConn;

public class BookMovieDao {
	private Connection connection;

	public String getTheatre(String branchID, String movieID) throws Exception {
		System.out.println("branchID=" + branchID);
		String mtheatre = "";
		connection = DbConn.getConnection();
		String sql = "select theatre.theatreID from theatre_movie "
				+ "inner join branch_theatre on theatre_movie.theatreID = branch_theatre.theatreID "
				+ "inner join branch on branch_theatre.branchID = branch.branchID "
				+ "inner join theatre on theatre_movie.theatreID = theatre.theatreID "
				+ "inner join movie on theatre_movie.movieID = movie.movieID "
				+ "where branch.branchID=? and movie.movieID=? " + "group by title,timeslot,theatrename "
				+ "order by branchname desc";
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, branchID);
		pstmt.setString(2, movieID);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			mtheatre = rs.getString("TheatreID");
		}
		return mtheatre;

	}

	public ArrayList<BookedSeat> getBookedSeat(String theatre_movieID) throws Exception {
		ArrayList<BookedSeat> mBookedSeatList = new ArrayList<BookedSeat>();
		connection = DbConn.getConnection();
		String sql = "select row ,number from seat where seatid in(select seatid from reservation where theatre_movieID=?)";
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(theatre_movieID));
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			BookedSeat bs = new BookedSeat();
			bs.setRow(rs.getString("Row"));
			bs.setNumber(rs.getString("Number"));
			mBookedSeatList.add(bs);
		}
		System.out.println("bookedSeat size is" + mBookedSeatList.size());
		return mBookedSeatList;

	}

	public ArrayList<Theatre> getTheatreSeatingByID(String theatreID) throws Exception {
		ArrayList<Theatre> mTheatreList = new ArrayList<Theatre>();
		connection = DbConn.getConnection();
		String sql = "SELECT TheatreName,Theatre.Row,Theatre.Column FROM Theatre where theatreId=" + theatreID + "";
		Statement pstmt = connection.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Theatre theatre = new Theatre();
			theatre.setColumn(rs.getInt("Column"));
			theatre.setRow(rs.getInt("Row"));
			theatre.setTheatreName(rs.getString("TheatreName"));

			mTheatreList.add(theatre);
		}
		return mTheatreList;

	}

	public String getMovieName(String movieId) throws ClassNotFoundException, SQLException {
		String movieName = "";
		String sql = "select Title from movie where movieID=" + movieId;
		connection = DbConn.getConnection();
		Statement pstmt = connection.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			movieName = rs.getString("Title");
			System.out.println("Movie Name is :" + movieName);
		}
		return movieName;
	}

	public BookSeatInfo getBookSeatInfomation(String branchID, String movieID)
			throws ClassNotFoundException, SQLException {
		BookSeatInfo bookSeatInfo = new BookSeatInfo();
		String sql = "select branch.branchname,title,timeslot,value from theatre_movie "
				+ "inner join branch_theatre on theatre_movie.theatreID = branch_theatre.theatreID "
				+ "inner join branch on branch_theatre.branchID = branch.branchID "
				+ "inner join theatre on theatre_movie.theatreID = theatre.theatreID "
				+ "inner join movie on theatre_movie.movieID = movie.movieID "
				+ "inner join price on theatre_movie.priceID = price.priceID "
				+ "where branch.branchID=? and movie.movieID=? " + "group by title,timeslot,theatrename "
				+ "order by branchname desc";

		connection = DbConn.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, branchID);
		pstmt.setString(2, movieID);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			bookSeatInfo.setBranchName(rs.getString("branchName"));
			bookSeatInfo.setDatetime(rs.getString("timeslot"));
			bookSeatInfo.setMovieName(rs.getString("title"));
			bookSeatInfo.setValue(rs.getString("value"));
		}
		return bookSeatInfo;

	}

}