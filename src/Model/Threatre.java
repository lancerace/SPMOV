package Model;

import java.util.ArrayList;
import java.util.Date;

//facade class 
public class Threatre {
	ArrayList<Movie> mMovies;
	ArrayList<Date> mTimeSlots;
	String mCreatedUserName;
	String mTheatreName;
	int mThreatreID;
	// from rows and column attribute from database column
	int mRow;
	int mColumn;
	int mCreatedBy;
	int mUpdatedBy;
	int mTotalSeat;
	Date mCreatedAt;
	Date mUpdatedAt;
	Date mDeletedAt;

	public String getmTheatreName() {
		return mTheatreName;
	}

	public void setmTheatreName(String mTheatreName) {
		this.mTheatreName = mTheatreName;
	}

	public ArrayList<Movie> getmMovies() {
		return mMovies;
	}

	public void setmMovies(ArrayList<Movie> mMovies) {
		this.mMovies = mMovies;
	}

	public ArrayList<Date> getmTimeSlots() {
		return mTimeSlots;
	}

	public void setmTimeSlots(ArrayList<Date> mTimeSlots) {
		this.mTimeSlots = mTimeSlots;
	}

	public String getmCreatedUserName() {
		return mCreatedUserName;
	}

	public void setmCreatedUserName(String mCreatedUserName) {
		this.mCreatedUserName = mCreatedUserName;
	}

	public int getmTotalSeat() {

		return mRow * mColumn;

	}

	public int getmRow() {
		return mRow;
	}

	public void setmRow(int mRow) {
		this.mRow = mRow;
	}

	public int getmColumn() {
		return mColumn;
	}

	public void setmColumn(int mColumn) {
		this.mColumn = mColumn;
	}

	public Date getmDeletedAt() {
		return mDeletedAt;
	}

	public void setmDeletedAt(Date mDeletedAt) {
		this.mDeletedAt = mDeletedAt;
	}

	public int getmThreatreID() {
		return mThreatreID;
	}

	public void setmThreatreID(int mThreatreID) {
		this.mThreatreID = mThreatreID;
	}

	public int getmCreatedBy() {
		return mCreatedBy;
	}

	public void setmCreatedBy(int mCreatedBy) {
		this.mCreatedBy = mCreatedBy;
	}

	public int getmUpdatedBy() {
		return mUpdatedBy;
	}

	public void setmUpdatedBy(int mUpdatedBy) {
		this.mUpdatedBy = mUpdatedBy;
	}

	public Date getmCreatedAt() {
		return mCreatedAt;
	}

	public void setmCreatedAt(Date mCreatedAt) {
		this.mCreatedAt = mCreatedAt;
	}

	public Date getmUpdatedAt() {
		return mUpdatedAt;
	}

	public void setmUpdatedAt(Date mUpdatedAt) {
		this.mUpdatedAt = mUpdatedAt;
	}

}
