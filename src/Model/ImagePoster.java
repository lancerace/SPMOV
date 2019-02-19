package Model;

public class ImagePoster {
int PhotoID;
String ContentType;
int ContentLength;
int MovieID;
public int getMovieID() {
	return MovieID;
}
public void setMovieID(int movieID) {
	MovieID = movieID;
}
String CreatedAt;
String UpdatedAt;

public int getPhotoID() {
	return PhotoID;
}
public void setPhotoID(int photoID) {
	PhotoID = photoID;
}

public String getContentType() {
	return ContentType;
}
public void setContentType(String contentType) {
	ContentType = contentType;
}
public int getContentLength() {
	return ContentLength;
}
public void setContentLength(int contentLength) {
	ContentLength = contentLength;
}
public String getCreatedAt() {
	return CreatedAt;
}
public void setCreatedAt(String createdAt) {
	CreatedAt = createdAt;
}
public String getUpdatedAt() {
	return UpdatedAt;
}
public void setUpdatedAt(String updatedAt) {
	UpdatedAt = updatedAt;
}
}
