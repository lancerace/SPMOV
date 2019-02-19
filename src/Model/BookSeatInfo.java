package Model;

public class BookSeatInfo {
	private String MovieName;
	private String BranchName;
	private String datetime;
	private String Value;

	public String getValue() {
		return Value;
	}

	public void setValue(String string) {
		this.Value = string;
	}

	public String getMovieName() {
		return MovieName;
	}

	public void setMovieName(String movieName) {
		MovieName = movieName;
	}

	public String getBranchName() {
		return BranchName;
	}

	public void setBranchName(String branchName) {
		BranchName = branchName;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	

}
