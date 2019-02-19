package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.Cinema;
import Model.Movie;
import Model.Timeslot;
import dao.InstantBookingDao;

/**
 * Servlet implementation class InstantBookingController
 */
@WebServlet("/InstantBookingController")
public class InstantBookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InstantBookingDao dao;
	Gson gson = new Gson();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InstantBookingController() {
		super();
		// TODO Auto-generated constructor stub

		try {
			dao = new InstantBookingDao();
		} catch (Exception e) {
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
		response.setContentType("application/json; charset=UTF-8");
		String command = request.getParameter("command");
		if (command.equals("getCinema")) {
			List<Cinema> mCinema;
			try {
				String movieID = request.getParameter("movieID");
				mCinema = dao.getAllCinemaByMovie(movieID);
				System.out.println("working");
				PrintWriter out = response.getWriter();
				out.print(gson.toJson(mCinema));
			} catch (Exception e) {

				System.out.println("not working");
				e.printStackTrace();
			}

		} else if (command.equals("getMovie")) {
			List<Movie> mMovie;
			try {
				String cinemaID = request.getParameter("cinemaID");
				mMovie = dao.getAllMovieByCinema(cinemaID);
				PrintWriter out = response.getWriter();
				out.print(gson.toJson(mMovie));
			} catch (Exception e) {

				System.out.println("not working");
				e.printStackTrace();
			}
		}else if (command.equals("resetMovie")) {
			List<Movie> mMovie;
			try {
				mMovie = dao.getAllMovie();
				PrintWriter out = response.getWriter();
				out.print(gson.toJson(mMovie));
			} catch (Exception e) {

				System.out.println("not working");
				e.printStackTrace();
			}
		} else if (command.equals("resetCinema")) {
			List<Cinema> mCinema;
			try {
				mCinema = dao.getAllCinema();
				PrintWriter out = response.getWriter();
				out.print(gson.toJson(mCinema));
			} catch (Exception e) {

				System.out.println("not working");
				e.printStackTrace();
			}

		}
		
		else if (command.equals("getDateTime")) {
			List<Timeslot> mTimeslot;
			try {
				String cinemaID = request.getParameter("cinemaID");
				String movieID = request.getParameter("movieID");
				mTimeslot = dao.getAllTimeslotByBranchIDAndMovieID(cinemaID,movieID);
				PrintWriter out = response.getWriter();
				out.print(gson.toJson(mTimeslot));
			} catch (Exception e) {

				System.out.println("not working");
				e.printStackTrace();
			}

		}
		else {
			System.out.println("cinema not launched");
		}
		doGet(request, response);
	}

}
