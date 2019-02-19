package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.Gson;

import Model.Member;
import net.spmov.Util.DbConn;

public class MemberDao {
	private Connection connection;
	Gson gson = new Gson();

	public MemberDao() throws Exception {
		connection = DbConn.getConnection();
	}

	public boolean addOneMember(Member mMember) throws SQLException, ClassNotFoundException {

		Gson gson = new Gson();
		System.out.println("checking dao gson:" + gson.toJson(mMember));
		connection = DbConn.getConnection();

		String addQuery = " CALL AddOneMember(?,?,?,?,?,?,?,?,?,?,?,?) ";

		PreparedStatement pstmt;
		pstmt = connection.prepareStatement(addQuery);

		pstmt.setString(1, mMember.getmUserName());
		pstmt.setString(2, mMember.getmPassword());
		pstmt.setString(3, mMember.getmFirstName());
		pstmt.setString(4, mMember.getmLastName());
		pstmt.setString(5, mMember.getmNRIC());
		pstmt.setString(6, mMember.getmGender());
		pstmt.setString(7, mMember.getmEmail());
		pstmt.setString(8, mMember.getmContactNo());
		pstmt.setString(9, mMember.getmBlock());
		pstmt.setString(10, mMember.getmStreet());
		pstmt.setString(11, mMember.getmUnit());
		pstmt.setString(12, mMember.getmPostalCode());
		int count = pstmt.executeUpdate();

		connection.close();
		if (count != 0)
			return true;
		else
			return false;
	}

	public boolean updateOneMember(Member mMember) throws SQLException, ClassNotFoundException {
		System.out.println("updateOneMember method invoked..");
		System.out.println("checking dao gson:" + gson.toJson(mMember));
		connection = DbConn.getConnection();

		String updateQuery = " CALL UpdateOneMember(?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";

		PreparedStatement pstmt;
		pstmt = connection.prepareStatement(updateQuery);

		pstmt.setString(1, mMember.getmUserName());
		pstmt.setString(2, mMember.getmPassword());
		pstmt.setString(3, mMember.getmFirstName());
		pstmt.setString(4, mMember.getmLastName());
		pstmt.setString(5, mMember.getmNRIC());
		pstmt.setString(6, mMember.getmCreditCardNumber());
		pstmt.setString(7, mMember.getmGender());
		pstmt.setString(8, mMember.getmEmail());
		pstmt.setString(9, mMember.getmContactNo());
		pstmt.setString(10, mMember.getmBlock());
		pstmt.setString(11, mMember.getmStreet());
		pstmt.setString(12, mMember.getmUnit());
		pstmt.setString(13, mMember.getmPostalCode());
		pstmt.setInt(14, mMember.getmMemberID());
		int count = pstmt.executeUpdate();

		System.out.println("Checking updatOneMember object:" + mMember);
		connection.close();
		if (count != 0)
			return true;
		else
			return false;
	}

	// login account
	// return an object if success,else null
	public Member login(String username, String password) throws Exception {
		Member mMember = new Member();

		connection = DbConn.getConnection();
		// String sql = "Select Count(name)as count,userID,name from customer "
		// + "where userId='"+ username+"'and password='"+password+"'";

		String sql = "Select Count(username)as count,memberID,username from member " + "where username='" + username
				+ "' and pwd='" + password + "'";

		Statement pstmt = connection.createStatement();
		ResultSet rs = pstmt.executeQuery(sql);

		while (rs.next()) {
			int count = rs.getInt("count");
			if (count >= 1) {
				mMember.setmMemberID(rs.getInt("memberID"));
				mMember.setmUserName(rs.getString("username"));
				// System.out.println("createAccDao username
				// :"+rs.getString("userID"));
				// return mCustomer;
				return mMember;
			}
		}
		connection.close();
		// System.out.println("createAccDao username :"+rs.getString("name"));
		return null;
	}

	// if record success return true,else false
	public Member getOneMember(String classType, String mMemberID) throws ClassNotFoundException, SQLException {

		connection = DbConn.getConnection();

		String query = " CALL getAllRecordsByID(?,?) ";

		PreparedStatement pstmt;
		pstmt = connection.prepareStatement(query);
		pstmt.setString(1, classType);
		pstmt.setInt(2, Integer.parseInt(mMemberID));

		ResultSet rs = pstmt.executeQuery();

		Member mMember = new Member();
		if (rs.next()) {
			mMember.setmMemberID(rs.getInt("MemberID"));
			mMember.setmUserName(rs.getString("UserName"));
			mMember.setmPassword(rs.getString("pwd"));
			mMember.setmFirstName(rs.getString("FirstName"));
			mMember.setmLastName(rs.getString("LastName"));
			mMember.setmNRIC(rs.getString("NRIC"));
			mMember.setmCreditCardNumber(rs.getString("CreditCardNumber"));
			mMember.setmGender(rs.getString("Gender"));
			mMember.setmEmail(rs.getString("Email"));
			mMember.setmContactNo(rs.getString("ContactNo"));
			mMember.setmBlock(rs.getString("Block"));
			mMember.setmStreet(rs.getString("Street"));
			mMember.setmUnit(rs.getString("Unit"));
			mMember.setmPostalCode(rs.getString("PostalCode"));
			mMember.setmCreatedAt(rs.getDate("CreatedAt"));
			mMember.setmUpdatedAt(rs.getDate("UpdatedAt"));
		}

		connection.close();
		return mMember;
	}
}
