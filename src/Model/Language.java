package Model;

import java.util.Date;

public class Language {

	int mLanguageID;
	String mLanguageName;
	int mCreatedBy;
	int mUpdatedBy;
	Date mCreatedAt;
	Date mUpdatedAt;
	Date mDeletedAt;

	public int getmLanguageID() {
		return mLanguageID;
	}

	public void setmLanguageID(int mLanguageID) {
		this.mLanguageID = mLanguageID;
	}

	public String getmLanguageName() {
		return mLanguageName;
	}

	public void setmLanguageName(String mLanguageName) {
		this.mLanguageName = mLanguageName;
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

	public Date getmDeletedAt() {
		return mDeletedAt;
	}

	public void setmDeletedAt(Date mDeletedAt) {
		this.mDeletedAt = mDeletedAt;
	}

}
