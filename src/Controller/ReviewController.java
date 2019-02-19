package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.Genre;
import Model.Review;
import dao.GenreDao;
import dao.ReviewDao;

/**
 * Servlet implementation class ReviewController
 */
@WebServlet("/ReviewController")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewDao dao;
	Gson gson = new Gson();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewController() {
        super();
        try{
			dao=new ReviewDao();
			
		}catch(Exception e){
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("application/json; charset=UTF-8");
		System.out.print("doPost activated in Review\n");
		
		PrintWriter out = response.getWriter();
		List<Review> mReview;
		String command = request.getParameter("command");
		
		try {
			if (command.equals("add")) {
				String movieID=request.getParameter("movieID");
				String name=request.getParameter("name");
				String contact=request.getParameter("contact");
				String detail=request.getParameter("detail");
				String rating=request.getParameter("rating");
				boolean result = dao.addOneReview(movieID,name,detail,contact,rating);
				out.print(gson.toJson(result));

			}
			out.flush();
			out.close();

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
