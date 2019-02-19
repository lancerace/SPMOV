package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import Model.Movie;
import net.spmov.Util.DbConn;

public class MovieDao {

	private Connection connection;
	private Gson gson;

	public MovieDao() throws Exception {
		connection = DbConn.getConnection();
		gson = new Gson();
	}

	public List<Movie> getAllMovie() throws SQLException, ClassNotFoundException {
		List<Movie> movies = new ArrayList<Movie>();

		connection = DbConn.getConnection();

		Statement statement = connection.createStatement();

		// all data is transferred from MYSQL to variable rs.
		ResultSet rs = statement
				.executeQuery("Select MovieID,Title,Synopsis,ReleaseDate,Duration,CreatedAt,UpdatedAt from movie");

		while (rs.next()) {
			Movie movie = new Movie();
			movie.setmMovieID(rs.getInt("MovieID"));
			movie.setmTitle(rs.getString("Title"));
			movie.setmSynopsis(rs.getString("Synopsis"));
			movie.setmReleaseDate(rs.getString("ReleaseDate"));
			movie.setmDuration(rs.getInt("Duration"));
			movie.setmCreatedAt(rs.getDate("CreatedAt"));
			movie.setmUpdatedAt(rs.getDate("UpdatedAt"));
			movies.add(movie);

		}
		connection.close();
		return movies;
	}

	public void updateOneMovie(String title, String synopsis, String releaseDate, int duration, int languageID,
			int movieID) throws SQLException, ClassNotFoundException {

		connection = DbConn.getConnection();

		String editQuery = " CALL UpdateOneMovie(?,?,?,?,?,?) ";

		PreparedStatement pstmt;

		pstmt = connection.prepareStatement(editQuery);

		pstmt.setString(1, title);
		pstmt.setString(2, synopsis);
		pstmt.setDate(3, java.sql.Date.valueOf(releaseDate));
		pstmt.setInt(4, duration);
		pstmt.setInt(5, languageID);
		pstmt.setInt(6, movieID);
		int count = pstmt.executeUpdate();

		connection.close();
		if (count != 0)
			System.out.println("Num of record: " + count);
		else
			System.out.println("No Row Record Retrieved");

	}

	public Movie getOneMovie(String movieID) throws SQLException, ClassNotFoundException {

		Movie mMovie = new Movie();

		connection = DbConn.getConnection();

		String query = " Select MovieID,Title,Synopsis,ReleaseDate,Duration,CreatedAt,UpdatedAt,LanguageID FROM MOVIE "
				+ " WHERE MovieID=?";

		PreparedStatement pstmt;

		pstmt = connection.prepareStatement(query);

		pstmt.setInt(1, Integer.parseInt(movieID));

		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			mMovie.setmMovieID(rs.getInt("MovieID"));
			mMovie.setmTitle(rs.getString("Title"));
			mMovie.setmSynopsis(rs.getString("Synopsis"));
			mMovie.setmReleaseDate(rs.getString("ReleaseDate"));
			mMovie.setmDuration(rs.getInt("Duration"));
			mMovie.setmCreatedAt(rs.getDate("CreatedAt"));
			mMovie.setmUpdatedAt(rs.getDate("UpdatedAt"));
			mMovie.setmLanguageID(rs.getInt("LanguageID"));
		}

		connection.close();
		return mMovie;

	}

	//
	public int addOneMovie(String title, String synopsis, String releaseDate, int duration, int languageID)
			throws SQLException, ClassNotFoundException {

		connection = DbConn.getConnection();
		System.out.print(
				"\nstart here: " + title + "\n" + synopsis + "\n" + releaseDate + "\n" + duration + "\n" + languageID);
		String editQuery = " CALL AddOneMovie(?,?,?,?,?,@outMovieID); ";
		PreparedStatement pstmt;
		ResultSet rs = null;

		pstmt = connection.prepareStatement(editQuery);
		pstmt.setString(1, title);
		pstmt.setString(2, synopsis);
		pstmt.setDate(3, java.sql.Date.valueOf(releaseDate));
		pstmt.setInt(4, duration);
		pstmt.setInt(5, languageID);

		pstmt.executeUpdate();

		pstmt = connection.prepareStatement("Select @outMovieID ");
		rs = pstmt.executeQuery();
		int movieID = 0;
		if (rs.next()) {
			// get movieId at first column ( retrieved scalar from database )
			movieID = rs.getInt(1);
		}
		connection.close();

		return movieID;
	}

	public void addActorToMovie(int movieID, int actorID) throws ClassNotFoundException, SQLException {

		connection = DbConn.getConnection();
		PreparedStatement pstmt;
		//

		//
		pstmt = connection.prepareStatement(" CALL AddActorToMovie(?,?); ");
		pstmt.setInt(1, movieID);
		pstmt.setInt(2, actorID);
		int count = pstmt.executeUpdate();

		connection.close();

		if (count != 0)
			System.out.println("Num of record: " + count);
		else
			System.out.println("No Row Record Retrieved");
	}

	public JSONArray getGenresFromMovieID(int movieID) throws ClassNotFoundException, SQLException {

		connection = DbConn.getConnection();
		PreparedStatement pstmt;
		JSONArray jArray = new JSONArray();

		pstmt = connection.prepareStatement(" CALL getGenresFromMovieID(?) ");
		pstmt.setInt(1, movieID);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("genreid", rs.getInt("genreid"));
			obj.put("genrename", rs.getString("genrename"));
			obj.put("details", rs.getString("details"));
			jArray.add(obj);
		}

		connection.close();
		return jArray;
	}

	public JSONArray getMovieDetailByMovieID(int movieID) throws ClassNotFoundException, SQLException {

		connection = DbConn.getConnection();
		PreparedStatement pstmt;
		JSONArray jArray = new JSONArray();

		pstmt = connection.prepareStatement(" CALL getLanguageFromMovieID(?) ");
		pstmt.setInt(1, movieID);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("language", rs.getString("language"));
			jArray.add(obj);
		}
		connection.close();
		return jArray;
	}

	// main photos
	public int getMoviePhotoIDFromMovieID(int movieID) throws ClassNotFoundException, SQLException {
		connection = DbConn.getConnection();
		int moviePhotoID = 0;
		PreparedStatement pstmt;

		pstmt = connection.prepareStatement(" CALL getMoviePhotoIDFromMovieID(?) ");
		pstmt.setInt(1, movieID);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			moviePhotoID = rs.getInt("PhotoID");
		}

		connection.close();
		return moviePhotoID;
	}

	public boolean deleteOneMovie(String movieID) throws SQLException, ClassNotFoundException {
		{
			connection = DbConn.getConnection();

			String editQuery = " Delete from Movie where MovieID=?";

			PreparedStatement pstmt;

			pstmt = connection.prepareStatement(editQuery);

			pstmt.setInt(1, Integer.parseInt(movieID));
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

	public JSONArray getTop10MonthlyMovieSale(int mMonth) throws ClassNotFoundException, SQLException {
		JSONArray jArray = new JSONArray();
		connection = DbConn.getConnection();

		PreparedStatement pstmt;

		pstmt = connection.prepareStatement(" CALL movieTop10MonthlySale(?) ");
		pstmt.setInt(1, mMonth);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("MovieID", rs.getInt("MovieID"));
			jsonObject.put("Title", rs.getString("Title"));
			jsonObject.put("TotalRevenue", rs.getBigDecimal("TotalRevenue"));

			jsonObject.put("Month", new SimpleDateFormat("MMMM").format(rs.getDate("releasedate")));

			jsonObject.put("releasedate", rs.getDate("releasedate"));
			System.out.println("MovieDao.java checking jsonObject:" + gson.toJson(jsonObject));
			jArray.add(jsonObject);
		}
		connection.close();
		return jArray;

	}

}
