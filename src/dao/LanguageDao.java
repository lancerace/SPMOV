package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Language;
import net.spmov.Util.DbConn;

public class LanguageDao {
	private Connection connection;

	public LanguageDao() throws Exception {
		connection = DbConn.getConnection();

	}

	public Language getLanguageFromMovieID(int movieID) throws ClassNotFoundException, SQLException {

		Language mLanguage = new Language();

		connection = DbConn.getConnection();
		PreparedStatement pstmt;
		ResultSet rs = null;
		pstmt = connection.prepareStatement(" CALL getLanguageFromMovieID(?); ");

		pstmt.setInt(1, movieID);
		rs = pstmt.executeQuery();

		while (rs.next()) {

			mLanguage.setmLanguageID(rs.getInt("LanguageID"));
			mLanguage.setmLanguageName(rs.getString("LanguageName"));
			mLanguage.setmCreatedBy(rs.getInt("CreatedBy"));
			mLanguage.setmUpdatedBy(rs.getInt("UpdatedBy"));
			mLanguage.setmCreatedAt(rs.getDate("CreatedAt"));
			mLanguage.setmUpdatedAt(rs.getDate("UpdatedAt"));

		}

		connection.close();
		return mLanguage;

	}

}
