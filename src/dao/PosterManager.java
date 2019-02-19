package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import net.spmov.Util.DbConn;

public class PosterManager {

	private Connection conn;

	public byte[] getPhoto(int iNumPhoto) throws Exception, SQLException {
		String req = "";
		Blob img;
		byte[] imgData = null;
		conn = DbConn.getConnection();
		Statement stmt = conn.createStatement();

		// Query
		req = "Select Byte From moviephoto Where PhotoID = " + iNumPhoto;

		ResultSet rset = stmt.executeQuery(req);

		while (rset.next()) {
			img = rset.getBlob("Byte");
			imgData = img.getBytes(1, (int) img.length());
		}

		rset.close();
		stmt.close();
		conn.close();
		return imgData;
	}

	public byte[] getBanner(int iNumPhoto) throws Exception, SQLException {
		String req = "";
		Blob img;
		byte[] imgData = null;
		conn = DbConn.getConnection();
		Statement stmt = conn.createStatement();

		// Query
		req = "select image from moviebanner where movieBannerID =" + iNumPhoto;

		ResultSet rset = stmt.executeQuery(req);

		while (rset.next()) {
			img = rset.getBlob("image");
			imgData = img.getBytes(1, (int) img.length());
		}

		rset.close();
		stmt.close();
		conn.close();
		return imgData;
	}

}
