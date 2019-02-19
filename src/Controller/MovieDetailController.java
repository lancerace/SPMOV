package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;

import Model.Cast;
import dao.CastDao;
import dao.CrewDao;
import dao.LanguageDao;
import dao.MovieDao;

/**
 * Servlet implementation class MovieDetail
 */
// @WebServlet("/MovieDetail")
public class MovieDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDao dao;
	private CastDao cDao;
	private LanguageDao lDao;
	private CrewDao crewDao;
	Gson gson = new Gson();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MovieDetailController() {
		super();
		// TODO Auto-generated constructor stub
		try {
			dao = new MovieDao();
			cDao = new CastDao();
			lDao = new LanguageDao();
			crewDao = new CrewDao();
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
		response.getWriter().append("Served at: Yoyo").append(request.getContextPath());

		try {

			int mMovieID = Integer.parseInt(request.getParameter("movie"));

			JSONArray jArray = dao.getGenresFromMovieID(mMovieID);
			List<Cast> mCastList = cDao.getAllCastByMovieID(mMovieID);

			// send movie Object
			request.setAttribute("mMovie", dao.getOneMovie(mMovieID + ""));
			// send all genres based from MovieID
			request.setAttribute("outjArray", jArray);
			// send all Cast based on MovieID
			request.setAttribute("mCastList", mCastList);

			request.setAttribute("mLanguage", lDao.getLanguageFromMovieID(mMovieID));

			request.setAttribute("mCrews", crewDao.getAllCrewsByMovieID(mMovieID));

			request.setAttribute("mMoviePhotoID", dao.getMoviePhotoIDFromMovieID(mMovieID));

			RequestDispatcher Rd = request.getRequestDispatcher("/movies");
			Rd.forward(request, response);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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
	}

}
