package Model;

public class Ticket {
	private String movieID;
	private String title;
	private String cinemaID;
	private String theatreID;
	private String cinemaName;
	private String timeslotID;
	private String time;
	private String value;
	private String Theatre_movieID;
	
	public String getTheatre_movieID() {
		return Theatre_movieID;
	}

	public void setTheatre_movieID(String theatre_movieID) {
		Theatre_movieID = theatre_movieID;
	}

	public String getTheatreID() {
		return theatreID;
	}

	public void setTheatreID(String theatreID) {
		this.theatreID = theatreID;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	private String row;
	private String column;

	public String getMovieID() {
		return movieID;
	}

	public void setMovieID(String movieID) {
		this.movieID = movieID;
	}

	public String getCinemaID() {
		return cinemaID;
	}

	public void setCinemaID(String cinemaID) {
		this.cinemaID = cinemaID;
	}

	public String getTimeslotID() {
		return timeslotID;
	}

	public void setTimeslotID(String timeslotID) {
		this.timeslotID = timeslotID;
	}

	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}
}
