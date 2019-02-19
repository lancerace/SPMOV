package Model;

import java.sql.Date;

public class Review {
	int ReviewID;
	String Name;
	String Detail;
	int Contact;
	int Rating;
	boolean PublishToView;
	Date PublishToViewAt;
	Date CreatedAt;
	Date DeletedAt;

	public int getReviewID() {
		return ReviewID;
	}

	public void setReviewID(int reviewID) {
		ReviewID = reviewID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getDetails() {
		return Detail;
	}

	public void setDetails(String detail) {
		Detail = detail;
	}

	public int getContact() {
		return Contact;
	}

	public void setContact(int contact) {
		Contact = contact;
	}

	public int getRating() {
		return Rating;
	}

	public void setRating(int rating) {
		Rating = rating;
	}

	public boolean isPublishToView() {
		return PublishToView;
	}

	public void setPublishToView(boolean publishToView) {
		PublishToView = publishToView;
	}

	public Date getPublishToViewAt() {
		return PublishToViewAt;
	}

	public void setPublishToViewAt(Date publishToViewAt) {
		PublishToViewAt = publishToViewAt;
	}

	public Date getCreatedAt() {
		return CreatedAt;
	}

	public void setCreatedAt(Date createdAt) {
		CreatedAt = createdAt;
	}

	public Date getDeletedAt() {
		return DeletedAt;
	}

	public void setDeletedAt(Date deletedAt) {
		DeletedAt = deletedAt;
	}

	public int getMovieID() {
		return MovieID;
	}

	public void setMovieID(int movieID) {
		MovieID = movieID;
	}

	int MovieID;
}
