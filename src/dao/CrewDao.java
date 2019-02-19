package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Crew;
import net.spmov.Util.DbConn;

public class CrewDao {

	private Connection connection;

	public CrewDao() throws Exception {
		connection = DbConn.getConnection();

	}

	public List<Crew> getAllCrewsByMovieID(int movieID) throws ClassNotFoundException, SQLException {

		List<Crew> mCrewList = new ArrayList<Crew>();

		connection = DbConn.getConnection();
		PreparedStatement pstmt;
		ResultSet rs = null;
		pstmt = connection.prepareStatement(" CALL getCrewsFromMovieID (?); ");

		pstmt.setInt(1, movieID);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			Crew mCrew = new Crew();
			mCrew.setmCrewID(rs.getInt("CrewID"));
			mCrew.setmRole(rs.getString("Role"));
			mCrew.setmName(rs.getString("Name"));
			mCrewList.add(mCrew);
		}

		connection.close();
		return mCrewList;

	}

}
