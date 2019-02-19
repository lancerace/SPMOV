package Controller;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.Genre;
import Model.Movie;
import dao.GenreDao;

/**
 * Servlet implementation class GenreController
 */
//@WebServlet("/GenreController")
public class GenreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GenreDao dao;
	Gson gson = new Gson();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GenreController() {
		super();
		// TODO Auto-generated constructor stub
		
		try{
			dao=new GenreDao();
			
		}catch(Exception e){
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
		if(request.getAttribute("run")=="getAllData"){
			System.out.println("do get run");
		List<Genre> mGenres;
		try {
			mGenres = dao.getAllGenre();
			request.setAttribute("mGenres", mGenres);
			RequestDispatcher Rd = request.getRequestDispatcher("ViewGenreRecord.jsp");
			System.out.println("Genre controller runned");
			Rd.forward(request, response);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("application/json; charset=UTF-8");
		System.out.print("doPost activated in genre\n");
		
		PrintWriter out = response.getWriter();
		List<Genre> mGenres;
		String command = request.getParameter("command");
		System.out.println("value is: " + command);
		try {
			if ((request.getParameter("genreID") != null) && (command.equals("get"))) {
				Genre mGenre = dao.getOneGenre(request.getParameter("genreID"));
				out.print(gson.toJson(mGenre));

			}
			else if((request.getParameter("genreID") != null) && (command.equals("update"))) {
				boolean success=dao.editGenre(request.getParameter("genreID"),request.getParameter("genreName"),request.getParameter("details"));
				out.print(gson.toJson(success));
				System.out.println("result of edeit"+success);
			}else if(command.equals("add")) {
				boolean success=dao.addGenre(request.getParameter("genreName"),request.getParameter("details"));
				out.print(gson.toJson(success));
				System.out.println("result of add"+success);
			}else if((request.getParameter("genreID") != null) && (command.equals("delete"))) {
				boolean success=dao.deleteOneGenre(request.getParameter("genreID"));
				out.print(gson.toJson(success));
				System.out.println("result of deleteGenre"+success);
			}else {

				mGenres = dao.getAllGenre();
				String mJGenres = gson.toJson(mGenres);
				out.write(mJGenres);
			}

			// best practice
			out.flush();
			out.close();

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}