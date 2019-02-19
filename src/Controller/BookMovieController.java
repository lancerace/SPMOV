package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Model.BookSeatInfo;
import Model.BookedSeat;
import Model.Theatre;
import dao.BookMovieDao;
import dao.CastDao;
import dao.MovieDao;

/**
 * Servlet implementation class BookMovieController
 */
@WebServlet("/BookMovieController")
public class BookMovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookMovieDao dao;
	Gson gson = new Gson();

	public BookMovieController() {
		super();
		// TODO Auto-generated constructor stub
		try {
			dao = new BookMovieDao();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String movieID = (String) request.getParameter("movieName");
		String cinemaID = (String) request.getParameter("cinemaName");
		String Theatre_movieId = (String) request.getParameter("dateTime");
		System.out.println("movieID=" + movieID + "cinemaID=" + cinemaID + "Theatre_movieId="+Theatre_movieId );
		String theatreID = "";
		ArrayList<Theatre> theatreList;
		try {
			System.out.println("run try");
			theatreID = dao.getTheatre(cinemaID, movieID);
			System.out.println("theatreID" + theatreID);
			theatreList = dao.getTheatreSeatingByID(theatreID);
			request.setAttribute("theatreID", (String) theatreID);
			request.setAttribute("mtheatreList", (Object) theatreList);
			request.setAttribute("movieID", (String) movieID);
			request.setAttribute("cinemaID", (String) cinemaID);
			//to get theatre_movieID 
			request.setAttribute("Theatre_movieId", (String) Theatre_movieId);

			// get movieName

			BookSeatInfo mBookSeatInfo = new BookSeatInfo();
			mBookSeatInfo = dao.getBookSeatInfomation(cinemaID, movieID);
			request.setAttribute("MovieName", mBookSeatInfo.getMovieName());
			request.setAttribute("BranchName", mBookSeatInfo.getBranchName());
			request.setAttribute("DateTime", mBookSeatInfo.getDatetime());
			request.setAttribute("Value", mBookSeatInfo.getValue());
			System.out.println("movieName is :" + mBookSeatInfo.getMovieName());
			
			//get booked seat out
			ArrayList<BookedSeat> bookedSeatList = new ArrayList<BookedSeat>();
			bookedSeatList= dao.getBookedSeat(Theatre_movieId);
			request.setAttribute("bookedSeatList", (Object) bookedSeatList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher Rd = request.getRequestDispatcher("BookSeat.jsp");
		Rd.forward(request, response);

		doGet(request, response);

	}

}
