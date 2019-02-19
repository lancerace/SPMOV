package Model;

import java.sql.Date;

public class Cast {

	private int mCastID;
	private String mName;
	private String mAge;
	private Date mCreatedAt;
	private Date mUpdatedAt;

	public int getmCastID() {
		return mCastID;
	}

	public void setmCastID(int mCastID) {
		this.mCastID = mCastID;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmAge() {
		return mAge;
	}

	public void setmAge(String mAge) {
		this.mAge = mAge;
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
