package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Model.Movie;
import dao.MovieDao;

/**
 * Servlet implementation class AdminIndexController
 */
@WebServlet("/AdminIndexController")
public class AdminIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MovieDao dao;
	Gson gson = new Gson();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminIndexController() {
		super();
		// TODO Auto-generated constructor stub

		try {
			dao = new MovieDao();
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
		System.out.println("AdminIndexController doGet invoked");
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		response.setContentType("application/json; charset=UTF-8");

		List<Movie> mMovies;

		try {

			if (request.getAttribute("command").equals("getAllMovies")) {
				System.out.println("AdminIndexController getAllMovies invoked");
				mMovies = dao.getAllMovie();
				request.setAttribute("mMovies", mMovies);
				request.getRequestDispatcher("/ViewMovieRecord.jsp").forward(request, response);
			}
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
		List<Movie> mMovies;
		response.setContentType("application/json; charset=UTF-8");
		System.out.println("AdminIndexController doPost");
		System.out.println("AdminIndexController check getParameter:" + request.getParameter("command"));

		// set command key with something to avoid nullpointerexception
		if (request.getAttribute("command") == null)
			request.setAttribute("command", "a");

		System.out.println("AdminIndexController check getAttribute:" + request.getAttribute("command"));
		HttpSession mSession;
		try {
			// if user click logout button,run this for session protection
			// not ajax call, comparison with moviecontroller "getAllMovies"
			if (request.getParameter("command").equals("SessionProtection")) {
				System.out.println("SessionProtection invoked");
				// get existing session.
				mSession = request.getSession(false);
				System.out.println("Session Id is:" + mSession.getId());
				if (request.getSession(false) != null) {
					// invalidate session so that user will need to login to
					// SPMOV
					// again
					System.out.println("AdminIndexController if (request.getSession(false) != null) ");
					mSession.removeAttribute("USER");
					mSession.invalidate();

					response.getWriter().write(gson.toJson("success"));
					System.out.println("Forward dispatcher is done ");
				} // end if .getSession !=null
			} // end if
		} catch (NullPointerException e) {
			if (e instanceof NullPointerException) {
				System.out.println("Null appeared.Handled nullpointer exception. Ignore it");

			} else
				e.printStackTrace();
		} // end of try catch
		response.getWriter().flush();
		response.getWriter().close();
	}// end post

}
