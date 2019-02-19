package Model;

import java.sql.Date;

public class Member {
	int mMemberID;
	String mUserName;
	String mPwd;
	String mFirstName;
	String mLastName;
	String mNRIC;
	String mCreditCardNumber;
	String mGender;
	String mEmail;
	String mContactNo;
	String mBlock;
	String mStreet;
	String mUnit;
	String mPostalCode;
	Date mCreatedAt;
	Date mUpdatedAt;

	public String getmCreditCardNumber() {
		return mCreditCardNumber;
	}

	public void setmCreditCardNumber(String mCreditCardNumber) {
		this.mCreditCardNumber = mCreditCardNumber;
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

	public String getmUserName() {
		return mUserName;
	}

	public void setmUserName(String mUserName) {
		this.mUserName = mUserName;
	}

	public int getmMemberID() {
		return mMemberID;
	}

	public void setmMemberID(int mMemberID) {
		this.mMemberID = mMemberID;
	}

	public String getmPassword() {
		return mPwd;
	}

	public void setmPassword(String mPassword) {
		this.mPwd = mPassword;
	}

	public String getmFirstName() {
		return mFirstName;
	}

	public void setmFirstName(String mFirstName) {
		this.mFirstName = mFirstName;
	}

	public String getmLastName() {
		return mLastName;
	}

	public void setmLastName(String mLastName) {
		this.mLastName = mLastName;
	}

	public String getmNRIC() {
		return mNRIC;
	}

	public void setmNRIC(String mNRIC) {
		this.mNRIC = mNRIC;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmContactNo() {
		return mContactNo;
	}

	public void setmContactNo(String mContactNo) {
		this.mContactNo = mContactNo;
	}

	public String getmBlock() {
		return mBlock;
	}

	public void setmBlock(String mBlock) {
		this.mBlock = mBlock;
	}

	public String getmStreet() {
		return mStreet;
	}

	public void setmStreet(String mStreet) {
		this.mStreet = mStreet;
	}

	public String getmUnit() {
		return mUnit;
	}

	public void setmUnit(String mUnit) {
		this.mUnit = mUnit;
	}

	public String getmPostalCode() {
		return mPostalCode;
	}

	public void setmPostalCode(String mPostalCode) {
		this.mPostalCode = mPostalCode;
	}
}
