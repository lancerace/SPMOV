package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Model.History;
import net.spmov.Util.DbConn;

public class HistoryDao {
	private Connection connection;

	public ArrayList<History> getHistory(String customerId) throws Exception  {
		System.out.println("customerId"+customerId);
		ArrayList<History> historyList = new ArrayList<History>();
		String sql = "select title,branch.branchname,timeslot, value from reservation "
				+ "inner join theatre_movie on theatre_movie.theatre_movieID= reservation.theatre_movieID "
				+ "inner join movie on movie.movieID =theatre_movie.movieID "
				+ "inner join price on theatre_movie.priceID = price.priceID "
				+ "inner join branch_theatre on theatre_movie.theatreID = branch_theatre.theatreID "
				+ "inner join branch on branch_theatre.branchID = branch.branchID "
				+ "inner join theatre on theatre_movie.theatreID = theatre.theatreID "
				+ "where bookedBy = ?";
		connection = DbConn.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(customerId));
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			History h = new History();
			h.setCinema(rs.getString("branchName"));
			h.setTimeslot(rs.getString("timeslot"));
			h.setTitle(rs.getString("title"));
			h.setValue(rs.getString("value"));
			historyList.add(h);
		}
		System.out.println("historyListsize"+historyList.size());
		return historyList;

	}
}
