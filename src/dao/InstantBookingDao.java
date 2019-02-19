package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.Cinema;
import Model.Movie;
import Model.Timeslot;
import net.spmov.Util.DbConn;

public class InstantBookingDao {
	private Connection connection;

	public List<Cinema> getAllCinemaByMovie(String movieID) throws Exception {
		List<Cinema> mCinemaList = new ArrayList<Cinema>();
		connection = DbConn.getConnection();
		String sql = "select branchmovie.branchID,branchName from branchMovie,branch where branchmovie.MovieID="
				+ movieID + " and branch.branchId= branchmovie.branchID";
		Statement pstmt = connection.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Cinema cinema = new Cinema();
			cinema.setCinemaID(rs.getInt("branchID"));
			cinema.setCinemaName(rs.getString("branchName"));
			mCinemaList.add(cinema);
		}
		System.out.println("size of cinema is" + mCinemaList.size());
		return mCinemaList;

	}

	public List<Movie> getAllMovieByCinema(String cinemaID) throws Exception {
		List<Movie> mMovieList = new ArrayList<Movie>();
		connection = DbConn.getConnection();
		String sql = "select branchmovie.movieID,title from branchMovie,movie where branchmovie.branchID=" + cinemaID
				+ " and movie.movieID = branchmovie.movieID";
		Statement pstmt = connection.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Movie movie = new Movie();
			movie.setmMovieID(rs.getInt("MovieID"));
			movie.setmTitle(rs.getString("Title"));
			mMovieList.add(movie);
		}
		return mMovieList;

	}

	public List<Movie> getAllMovie() throws Exception {
		List<Movie> mMovieList = new ArrayList<Movie>();
		connection = DbConn.getConnection();
		String sql = "select movieID,title from movie";
		Statement pstmt = connection.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Movie movie = new Movie();
			movie.setmMovieID(rs.getInt("MovieID"));
			movie.setmTitle(rs.getString("Title"));
			mMovieList.add(movie);
		}
		return mMovieList;

	}

	public List<Cinema> getAllCinema() throws Exception {
		List<Cinema> mCinemaList = new ArrayList<Cinema>();
		connection = DbConn.getConnection();
		String sql = "select branchID,branchName from branch";
		Statement pstmt = connection.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Cinema cinema = new Cinema();
			cinema.setCinemaID(rs.getInt("branchID"));
			cinema.setCinemaName(rs.getString("branchName"));
			mCinemaList.add(cinema);
		}
		System.out.println("size of cinema is" + mCinemaList.size());
		return mCinemaList;

	}

	public List<Timeslot> getAllTimeslotByBranchIDAndMovieID(String cinemaID, String movieID) throws Exception {
		ArrayList<Timeslot> timeslotList = new ArrayList<Timeslot>();
		connection = DbConn.getConnection();
		String sql = "SELECT theatre_movieID,Timeslot FROM theatre_movie INNER JOIN branch_theatre ON theatre_movie.TheatreId = branch_theatre.theatreID INNER JOIN branch ON branch_theatre.branchID = branch.BranchID where branch_theatre.branchID = ? AND MovieID = ?";
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, cinemaID);
		pstmt.setString(2, movieID);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Timeslot t = new Timeslot();
			t.setTheatre_movieID(rs.getString("Theatre_movieID"));
			t.setDateTime(rs.getString("Timeslot"));
			timeslotList.add(t);
		}
		return timeslotList;

	}
}
