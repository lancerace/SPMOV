package Model;

import java.util.*;

public class Banner {
int movieBannerID;
String movieBannerName;
Date releaseAt;
int createdBy;
int updatedBy;
String createdAt;
String updatedAt;
String DeletedAt;
public int getMovieBannerID() {
	return movieBannerID;
}
public void setMovieBannerID(int movieBannerID) {
	this.movieBannerID = movieBannerID;
}
public String getMovieBannerName() {
	return movieBannerName;
}
public void setMovieBannerName(String movieBannerName) {
	this.movieBannerName = movieBannerName;
}
public Date getReleaseAt() {
	return releaseAt;
}
public void setReleaseAt(Date releaseAt) {
	this.releaseAt = releaseAt;
}
public int getCreatedBy() {
	return createdBy;
}
public void setCreatedBy(int createdBy) {
	this.createdBy = createdBy;
}
public int getUpdatedBy() {
	return updatedBy;
}
public void setUpdatedBy(int updatedBy) {
	this.updatedBy = updatedBy;
}
public String getCreatedAt() {
	return createdAt;
}
public void setCreatedAt(String createdAt) {
	this.createdAt = createdAt;
}
public String getUpdatedAt() {
	return updatedAt;
}
public void setUpdatedAt(String updatedAt) {
	this.updatedAt = updatedAt;
}
public String getDeletedAt() {
	return DeletedAt;
}
public void setDeletedAt(String deletedAt) {
	DeletedAt = deletedAt;
}
}
