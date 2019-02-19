package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.TheatreMovie;
import Model.Threatre;
import dao.ThreatreDao;

/**
 * Servlet implementation class ThreatreController
 */
// @WebServlet("/ThreatreController")
public class ThreatreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ThreatreDao dao;
	private Gson gson;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThreatreController() {
		super();

		try {
			dao = new ThreatreDao();
			gson = new Gson();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("TheatreController doGet activated");
		// response.getWriter().append("Served at:
		// ThreatreController").append(request.getContextPath());
		List<Threatre> mTheatreList;
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			// for viewTheatre_Movie.jsp
			System.out.println("ThreateController Attribute Value..:" + request.getAttribute("command"));

			if (request.getAttribute("command").equals("Theatre_Movie")) {
				System.out.println("if condition,attempting.. to getalltheatre");
				mTheatreList = dao.getAllThreatre("theatre");
				request.setAttribute("mThreatreList", mTheatreList);
				if (mTheatreList.size() != 0) {
					RequestDispatcher Rd = request.getRequestDispatcher("/ViewTheatre_Movie.jsp");
					Rd.forward(request, response);
				}
				response.getWriter().flush();
				response.getWriter().close();
				// } // end else
			} else if (request.getAttribute("command").equals("gettheatres")) {
				System.out.println("else condition,attempting.. to getalltheatre");
				mTheatreList = dao.getAllThreatre("theatre");
				request.setAttribute("mThreatreList", mTheatreList);
				if (mTheatreList.size() != 0) {
					RequestDispatcher Rd = request.getRequestDispatcher("/ViewThreatreRecord.jsp");
					Rd.forward(request, response);
				}
				response.getWriter().flush();
				response.getWriter().close();

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
		response.setContentType("application/json; charset=UTF-8");
		System.out.println("TheatreController dopost activated");
		// doGet(request, response);
		PrintWriter out = response.getWriter();
		try {
			if (request.getParameter("command").equals("addTheatreMovieRecord")) {
				String theatreMovieArrayString = request.getParameter("theatre_MovieArray");
				System.out.println("MovieArray is:" + theatreMovieArrayString);

				System.out.println("After parse is:" + theatreMovieArrayString);
				TheatreMovie[] theatreMovieArray = gson.fromJson(theatreMovieArrayString, TheatreMovie[].class);
				System.out.println("check retrieval..:" + theatreMovieArrayString);
				System.out.println("check retrieval..fromJSON:" + theatreMovieArray);
				System.out.println(theatreMovieArray);
				dao.assignMovieToTheatre(theatreMovieArray);

				out.write(gson.toJson("success"));

				// add one theatre for theatreRecord.jsp
			} else if (request.getParameter("command").equals("add")) {
				Threatre mTheatre = gson.fromJson(request.getParameter("mTheatre"), Threatre.class);
				System.out.println("TheatreController checking mTheatre from ajax call.." + gson.toJson(mTheatre));

				boolean check = dao.addOneTheatre(mTheatre.getmTheatreName(), mTheatre.getmRow(), mTheatre.getmColumn(),
						mTheatre.getmCreatedBy());

				if (check == true) {
					out.write(gson.toJson("success"));
				}
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

} // end dopost
