package Model;

import java.sql.Date;

public class Genre {
	int mGenreID;
	String mGenreName;
	String mDetails;
	Date mCreatedAt;
	Date mUpdatedAt;

	public int getmGenreID() {
		return mGenreID;
	}

	public void setmGenreID(int mGenreID) {
		this.mGenreID = mGenreID;
	}

	public String getmGenreName() {
		return mGenreName;
	}

	public void setmGenreName(String mGenreName) {
		this.mGenreName = mGenreName;
	}

	public String getmDetails() {
		return mDetails;
	}

	public void setmDetails(String mDetails) {
		this.mDetails = mDetails;
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
