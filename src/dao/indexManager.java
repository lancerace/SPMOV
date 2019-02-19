package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.Banner;
import Model.Branch;
import Model.Genre;
import Model.ImagePoster;
import Model.Movie;
import Model.SlideShowImage;
import net.spmov.Util.DbConn;

public class indexManager {
	private Connection conn;

	public List<Movie> getMovieName() throws Exception {
		conn = DbConn.getConnection();
		ArrayList<Movie> movieList = new ArrayList<Movie>();
		String sql = "select MovieID,Title,Duration,releaseDate,CreatedAt,UpdatedAt from movie";
		Statement pstmt = conn.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Movie movie = new Movie();
			movie.setmMovieID(rs.getInt("MovieID"));
			movie.setmTitle(rs.getString("Title"));
			movie.setmDuration(rs.getInt("Duration"));
			movie.setmReleaseDate(rs.getString("releaseDate"));
			movie.setmCreatedAt(rs.getDate("CreatedAt"));
			movie.setmUpdatedAt(rs.getDate("UpdatedAt"));
			movieList.add(movie);

		}

		return movieList;

	}

	public List<Branch> getBranchName() throws Exception {
		conn = DbConn.getConnection();
		ArrayList<Branch> branchList = new ArrayList<Branch>();
		String sql = "select BranchId,BranchName,CreatedAt,UpdatedAt from branch";
		Statement pstmt = conn.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Branch branch = new Branch();
			branch.setBranchID(rs.getInt("BranchID"));
			branch.setBranchName(rs.getString("BranchName"));
			branch.setCreatedAt(rs.getString("CreatedAt"));
			branch.setUpdatedAt(rs.getString("UpdatedAt"));
			branchList.add(branch);

		}
		return branchList;
	}

	public List<ImagePoster> getPhotoID() throws Exception {
		ArrayList<ImagePoster> photoList = new ArrayList<ImagePoster>();
		conn = DbConn.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "Select PhotoID,ContentLength,ContentType,MovieID,CreatedAt,UpdatedAt From moviephoto";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			ImagePoster ip = new ImagePoster();
			ip.setPhotoID(rs.getInt("PhotoID"));
			ip.setContentLength(rs.getInt("ContentLength"));
			ip.setContentType(rs.getString("ContentType"));
			ip.setMovieID(rs.getInt("MovieID"));
			ip.setCreatedAt(rs.getString("CreatedAt"));
			ip.setUpdatedAt(rs.getString("UpdatedAt"));
			photoList.add(ip);
		}
		System.out.println("the size of photolist" + photoList.size());
		return photoList;

	}

	public List<Banner> getBannerID() throws Exception {
		ArrayList<Banner> bannerList = new ArrayList<Banner>();
		conn = DbConn.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select movieBannerID ,movieBannerName,releaseAt from moviebanner";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			Banner banner = new Banner();
			banner.setMovieBannerID(rs.getInt("movieBannerID"));
			banner.setMovieBannerName(rs.getString("movieBannerName"));
			banner.setReleaseAt(rs.getDate("releaseAt"));
			bannerList.add(banner);
		}
		System.out.println("the size of banner" + bannerList.size());
		return bannerList;

	}

	public List<ImagePoster> getNowPlayingMovie() throws Exception {
		conn = DbConn.getConnection();
		ArrayList<ImagePoster> movieList = new ArrayList<ImagePoster>();
		String sql = "select photoID , MovieID from moviephoto where MovieID in(select MovieID from movie where ReleaseDate<CURRENT_TIMESTAMP) ";
		Statement pstmt = conn.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			ImagePoster ip = new ImagePoster();
			ip.setPhotoID(rs.getInt("photoID"));
			ip.setMovieID(rs.getInt("MovieID"));
			movieList.add(ip);
		}
		System.out.println("the size of now Playing " + movieList.size());
		return movieList;

	}

	public List<ImagePoster> getOpeningThisWeek() throws Exception {
		conn = DbConn.getConnection();
		ArrayList<ImagePoster> movieList = new ArrayList<ImagePoster>();
		String sql = "select photoID , MovieID from moviephoto where MovieID in(select MovieID from movie where ReleaseDate>CURRENT_TIMESTAMP and (TIME_TO_SEC(timediff(releaseDate,current_timestamp()))<'604800'))";
		Statement pstmt = conn.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			ImagePoster ip = new ImagePoster();
			ip.setPhotoID(rs.getInt("photoID"));
			ip.setMovieID(rs.getInt("MovieID"));
			movieList.add(ip);
		}
		System.out.println("the size of now Opening This Week " + movieList.size());
		return movieList;

	}

	public List<ImagePoster> getComingSoon() throws Exception {
		conn = DbConn.getConnection();
		ArrayList<ImagePoster> movieList = new ArrayList<ImagePoster>();
		String sql = "select photoID,movieID from moviephoto where MovieID in(select MovieID from movie where ReleaseDate>CURRENT_TIMESTAMP and (TIME_TO_SEC(timediff(releaseDate,current_timestamp()))>'604800'))";
		Statement pstmt = conn.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			ImagePoster ip = new ImagePoster();
			ip.setPhotoID(rs.getInt("photoID"));
			ip.setMovieID(rs.getInt("MovieID"));
			movieList.add(ip);
		}
		System.out.println("the size of now Coming Soon " + movieList.size());
		return movieList;

	}

	public List<Movie> getFeatured() throws Exception {
		conn = DbConn.getConnection();
		ArrayList<Movie> movieList = new ArrayList<Movie>();
		String sql = "select MovieID,Title,Duration,releaseDate from movie";// nid
																			// get
																			// voting
																			// data
																			// above
																			// 80%
																			// to
																			// display
		Statement pstmt = conn.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Movie movie = new Movie();
			movie.setmMovieID(rs.getInt("MovieID"));
			movie.setmTitle(rs.getString("Title"));
			movie.setmDuration(rs.getInt("Duration"));
			movie.setmReleaseDate(rs.getString("releaseDate"));
			movieList.add(movie);
		}
		System.out.println("the size of now featured " + movieList.size());
		return movieList;

	}

	public List<SlideShowImage> getMovieSlideShow() throws Exception {
		conn = DbConn.getConnection();
		ArrayList<SlideShowImage> movieList = new ArrayList<SlideShowImage>();
		String sql = "select movie.MovieID, Title, date_format(ReleaseDate, '%b %e-%c')as'ReleaseDate',PhotoID from movie,moviephoto where movie.MovieID=moviephoto.PhotoID ";
		Statement pstmt = conn.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			SlideShowImage movie = new SlideShowImage();
			movie.setMovieID(rs.getInt("MovieID"));
			movie.setTitle(rs.getString("Title"));
			movie.setReleaseDate(rs.getString("releaseDate"));
			movie.setPhotoID(rs.getInt("photoID"));
			movieList.add(movie);
		}
		System.out.println("the size of now featured " + movieList.size());
		return movieList;
	}

	public List<Genre> getGenre() throws Exception {

		conn = DbConn.getConnection();
		ArrayList<Genre> genreList = new ArrayList<Genre>();
		String sql = "select GenreName,GenreID from Genre";
		Statement pstmt = conn.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			Genre genre = new Genre();
			genre.setmGenreID(rs.getInt("GenreID"));
			genre.setmGenreName(rs.getString("GenreName"));
			genreList.add(genre);
		}
		System.out.println("the size of now featured " + genreList.size());
		return genreList;
	}

	public List<ImagePoster> getFiltered(int genreID) throws Exception {
		conn = DbConn.getConnection();
		ArrayList<ImagePoster> movieList = new ArrayList<ImagePoster>();
		String sql = "select PhotoID,movieID from moviephoto where movieid in("
				+ "select movieID from genremovie where GenreID=" + genreID + ")";
		Statement pstmt = conn.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			ImagePoster ip = new ImagePoster();
			ip.setPhotoID(rs.getInt("photoID"));
			ip.setMovieID(rs.getInt("movieID"));
			movieList.add(ip);
		}
		System.out.println("the size of filtered" + movieList.size());
		return movieList;

	}
}
