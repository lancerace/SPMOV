package Model;

import java.util.Date;

public class Crew {
	int mCrewID;
	String mRole;
	String mName;
	Date mCreatedAt;
	Date mUpdatedAt;
	Date mDeletedAt;

	public int getmCrewID() {
		return mCrewID;
	}

	public void setmCrewID(int mCrewID) {
		this.mCrewID = mCrewID;
	}

	public String getmRole() {
		return mRole;
	}

	public void setmRole(String mRole) {
		this.mRole = mRole;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
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

	public Date getmDeletedAt() {
		return mDeletedAt;
	}

	public void setmDeletedAt(Date mDeletedAt) {
		this.mDeletedAt = mDeletedAt;
	}

}
