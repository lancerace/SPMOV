package Model;

public class Theatre {
	
	private int TheatreID;
	private String TheatreName;
	private int Row;
	private int Column;

	public int getTheatreID() {
		return TheatreID;
	}

	public void setTheatreID(int theatreID) {
		TheatreID = theatreID;
	}

	public String getTheatreName() {
		return TheatreName;
	}

	public void setTheatreName(String theatreName) {
		TheatreName = theatreName;
	}

	public int getRow() {
		return Row;
	}

	public void setRow(int row) {
		Row = row;
	}

	public int getColumn() {
		return Column;
	}

	public void setColumn(int column) {
		Column = column;
	}
}
