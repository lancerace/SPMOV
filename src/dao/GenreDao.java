package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Model.Genre;
import Model.Movie;
import net.spmov.Util.DbConn;

public class GenreDao {
	private Connection connection;

	public GenreDao() throws Exception {
		connection = DbConn.getConnection();
	}

	public List<Genre> getAllGenre() throws SQLException, ClassNotFoundException {
		List<Genre> genres = new ArrayList<Genre>();
		connection = DbConn.getConnection();

		Statement statement = connection.createStatement();

		// all data is transferred from MYSQL to variable rs.
		ResultSet rs = statement.executeQuery("Select GenreID,GenreName,Details,CreatedAt,UpdatedAt from genre");

		while (rs.next()) {
			Genre genre = new Genre();
			genre.setmGenreID(rs.getInt("GenreID"));
			genre.setmGenreName(rs.getString("GenreName"));
			genre.setmDetails(rs.getString("Details"));
			genre.setmCreatedAt(rs.getDate("CreatedAt"));
			genre.setmUpdatedAt(rs.getDate("UpdatedAt"));
			genres.add(genre);

		}
		connection.close();
		System.out.println("getAllGenre size=" + genres.size());

		return genres;

	}

	public Genre getOneGenre(String genreID) throws SQLException, ClassNotFoundException {

		Genre mGenre = new Genre();

		connection = DbConn.getConnection();

		String query = " Select GenreID,GenreName,Details,CreatedAt,UpdatedAt from genre " + " WHERE GenreID=?";

		PreparedStatement pstmt;

		pstmt = connection.prepareStatement(query);

		pstmt.setInt(1, Integer.parseInt(genreID));

		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			mGenre.setmGenreID(rs.getInt("GenreID"));
			mGenre.setmGenreName(rs.getString("GenreName"));
			mGenre.setmDetails(rs.getString("Details"));
			mGenre.setmCreatedAt(rs.getDate("CreatedAt"));
			mGenre.setmUpdatedAt(rs.getDate("UpdatedAt"));
		}
		connection.close();
		System.out.println("get One genre work");
		return mGenre;
	}

	public boolean editGenre(String genreID, String genreName, String details)
			throws SQLException, ClassNotFoundException {

		connection = DbConn.getConnection();

		String editQuery = " UPDATE Genre set GenreName=?,Details=? where GenreID=?";

		PreparedStatement pstmt;

		pstmt = connection.prepareStatement(editQuery);

		pstmt.setString(1, genreName);
		pstmt.setString(2, details);
		pstmt.setInt(3, Integer.parseInt(genreID));
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
	public boolean addGenre(String genreName, String details)
			throws SQLException, ClassNotFoundException {

		connection = DbConn.getConnection();

		String editQuery = " Insert into genre (GenreName,Details)VALUES(?,?)";

		PreparedStatement pstmt;

		pstmt = connection.prepareStatement(editQuery);

		pstmt.setString(1, genreName);
		pstmt.setString(2, details);
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
	public boolean deleteOneGenre(String genreID)
			throws SQLException, ClassNotFoundException {

		connection = DbConn.getConnection();

		String editQuery = " Delete from Genre where GenreID=?";

		PreparedStatement pstmt;

		pstmt = connection.prepareStatement(editQuery);

		pstmt.setInt(1, Integer.parseInt(genreID));
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
