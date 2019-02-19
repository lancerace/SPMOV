package dao;

import java.sql.Connection;

import net.spmov.Util.DbConn;

public class TimeSlotDao {
	private Connection connection;

	public TimeSlotDao() throws Exception {
		connection = DbConn.getConnection();
	}

	// public ArrayList<TimeSlot> getAllTimeSlot(String classType) throws
	// SQLException, ClassNotFoundException {
	// ArrayList<TimeSlot> mTimeSlots = new ArrayList<TimeSlot>();
	// connection = DbConn.getConnection();
	// PreparedStatement pstmt;
	// pstmt = connection.prepareStatement(" call getAllRecords(?) ");
	// pstmt.setString(1, classType);
	// ResultSet rs = pstmt.executeQuery();
	//
	// while (rs.next()) {
	// TimeSlot mTimeSlot = new TimeSlot();
	// mTimeSlot.setmTimeSlotID(rs.getInt("TimeSlotID"));
	// mTimeSlot.setmDate(rs.getDate("Date"));
	// mTimeSlot.setmTime(rs.getTime("Time"));
	// mTimeSlot.setmCreatedBy(rs.getInt("CreatedBy"));
	// mTimeSlot.setmUpdatedBy(rs.getInt("UpdatedBy"));
	// mTimeSlot.setmCreatedAt(rs.getDate("CreatedAt"));
	// mTimeSlot.setmUpdatedAt(rs.getDate("UpdatedAt"));
	//
	// mTimeSlots.add(mTimeSlot);
	// }
	// connection.close();
	// return mTimeSlots;
	//
	// }
}
