package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;

import Model.Cast;
import Model.Movie;
import dao.CastDao;
import dao.MovieDao;
import dao.TimeSlotDao;

/**
 * Servlet implementation class MovieController
 */
// @WebServlet("/MovieController")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDao dao;
	private CastDao cDao;
	private TimeSlotDao tDao;
	Gson gson = new Gson();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MovieController() {
		super();
		// TODO Auto-generated constructor stub

		try {
			dao = new MovieDao();
			cDao = new CastDao();
			tDao = new TimeSlotDao();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("Movie servlet doGet Invoked!\n");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();

		System.out.print("doget activated\n");
		Movie mMovie;
		try {

			if ((request.getParameter("command").equals("get"))) {
				System.out.print("get activated!\n");
				mMovie = dao.getOneMovie(request.getParameter("movieID"));

				List<Cast> mCastList = cDao.getAllCastByMovieID(Integer.parseInt(request.getParameter("movieID")));

				JSONArray jsonObj = new JSONArray();
				jsonObj.add(mMovie);
				jsonObj.add(mCastList);

				// first container is object,2nd container is array.
				System.out.print("gsonObject is: " + gson.toJson(jsonObj));
				out.write(gson.toJson(jsonObj));

			} else if (request.getParameter("command").equals("update")) {
				System.out.print("update activated!\n");
				// get json string from ajax request and parse as
				// JsonObject
				// to mMovie variable
				System.out.print("update activated!\n");
				mMovie = gson.fromJson(request.getParameter("mMovie"), Movie.class);
				System.out.print(gson.toJson(mMovie));
				// proceed with updating..
				dao.updateOneMovie(mMovie.getmTitle(), mMovie.getmSynopsis(), mMovie.getmReleaseDate(),
						mMovie.getmDuration(), mMovie.getmLanguageID(), mMovie.getmMovieID());
				Cast[] castList = gson.fromJson(request.getParameter("mCasts"), Cast[].class);

				// updateCastsToMovie
				cDao.deleteAllCastsFromMovie(mMovie.getmMovieID());
				for (int i = 0; i < castList.length; i++) {
					System.out.print("CastID is: " + castList[i].getmCastID());
					dao.addActorToMovie(mMovie.getmMovieID(), castList[i].getmCastID());
				}

			} else if (request.getParameter("command").equals("add")) {
				System.out.print("add activated!\n");
				// addMovie if no MovieID in getParameter
				mMovie = gson.fromJson(request.getParameter("mMovie"), Movie.class);
				int id = dao.addOneMovie(mMovie.getmTitle(), mMovie.getmSynopsis(), mMovie.getmReleaseDate(),
						mMovie.getmDuration(), mMovie.getmLanguageID());

				// List<Cast> castList =
				// gson.fromJson(request.getParameter("mCasts"), Cast.class);

				System.out.print("Json here: \n" + request.getParameter("mCasts"));

				Cast[] castList = gson.fromJson(request.getParameter("mCasts"), Cast[].class);

				System.out.print("\nCast here: \n" + gson.toJson(castList));

				System.out.print("\n ID is: " + id);
				// every cast selected from magicsuggest, execute
				// addActorToMovie()
				for (int i = 0; i < castList.length; i++) {
					System.out.print("CastID is: " + castList[i].getmCastID());
					dao.addActorToMovie(id, castList[i].getmCastID());
				}

			}
			// for populating modal popup in theatre_movie.jsp for admin to
			// assign movie to theatre
			// ajax call
			else if (request.getParameter("command").equals("getAllMovies")) {
				System.out.println("getAllMovies invoked from MovieController..");
				List<Movie> mMovieList = dao.getAllMovie();
				// List<TimeSlot> mTimeSlotList =
				// tDao.getAllTimeSlot("timeslot");
				JSONArray jsonArray = new JSONArray();

				jsonArray.add(mMovieList);
				// jsonArray.add(mTimeSlotList);
				// for (Movie movie : mMovieList) {
				// jsonArray.add(movie);
				// }

				System.out.print("gsonObject is: " + gson.toJson(jsonArray));
				out.write(gson.toJson(jsonArray));
			}

			else if (request.getParameter("command").equals("delete")) {
				boolean success = dao.deleteOneMovie(request.getParameter("movieID"));
				out.print(gson.toJson(success));
				System.out.println("result of deleteGenre" + success);

			}

			else if (request.getParameter("command").equals("getTop10")) {

				System.out.println("getTop10 invoked");
				JSONArray mMovieMonthlySale = new JSONArray();
				// check from current year JAN to DEC
				for (int i = 1; i < 13; i++) {
					// get top 1 monthly movie sale. retrieve only current year

					mMovieMonthlySale.add(dao.getTop10MonthlyMovieSale(i));
				}
				// send data back to ajax caller
				System.out.println("Checking MovieController getTop10:" + gson.toJson(mMovieMonthlySale));
				out.print(gson.toJson(mMovieMonthlySale));
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
