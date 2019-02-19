package Model;

import java.util.Date;

public class Movie {

	private int mMovieID;
	private String mTitle;
	private String mSynopsis;
	private String mReleaseDate;
	private int mDuration;
	private Date mCreatedAt;
	private Date mUpdatedAt;
	private int mLanguageID;

	public int getmLanguageID() {
		return mLanguageID;
	}

	public void setmLanguageID(int mLanguageID) {
		this.mLanguageID = mLanguageID;
	}

	public int getmMovieID() {
		return mMovieID;
	}

	public void setmMovieID(int mMovieID) {
		this.mMovieID = mMovieID;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public String getmSynopsis() {
		return mSynopsis;
	}

	public void setmSynopsis(String mSynopsis) {
		this.mSynopsis = mSynopsis;
	}

	public String getmReleaseDate() {
		return mReleaseDate;
	}

	public void setmReleaseDate(String mReleaseDate) {
		this.mReleaseDate = mReleaseDate;
	}

	public int getmDuration() {
		return mDuration;
	}

	public void setmDuration(int mDuration) {
		this.mDuration = mDuration;
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
