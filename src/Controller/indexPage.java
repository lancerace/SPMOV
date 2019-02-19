package Controller;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.*;
import dao.*;

import java.util.*;


/**
 * Servlet implementation class indexPage
 */
@WebServlet("/indexPage")
public class indexPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public indexPage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		indexManager im = new indexManager();
		List<Movie> movieNameList;
		List<Branch>branchNameList;
		List<ImagePoster> posterList;
		List<Banner>bannerList;
		List<ImagePoster>nowPlayingList;
		List<ImagePoster>openingThisWeekList;
		List<ImagePoster>comingSoonList;
		List<Movie>featuredList;
		List<SlideShowImage>movieSlideShowList;
		List<Genre>genreList;
		
		try {
			movieNameList = im.getMovieName();
			branchNameList=im.getBranchName();
			posterList =im.getPhotoID();
			bannerList =im.getBannerID();
			nowPlayingList =im.getNowPlayingMovie();
			openingThisWeekList=im.getOpeningThisWeek();
			comingSoonList=im.getComingSoon();
			featuredList=im.getFeatured();
			movieSlideShowList=im.getMovieSlideShow();
			genreList=im.getGenre();

			//response.getWriter().print(movieNameList.size());
			//response.getWriter().print(movieNameList.get(0).getMovieName());
			request.setAttribute("movieNameList", (Object) movieNameList);
			request.setAttribute("branchNameList", (Object) branchNameList);
			request.setAttribute("posterList", (Object) posterList);
			request.setAttribute("bannerList", (Object)bannerList);
			request.setAttribute("nowPlayingList", (Object)nowPlayingList);
			request.setAttribute("openingThisWeekList", (Object)openingThisWeekList);
			request.setAttribute("comingSoonList", (Object)comingSoonList);
			request.setAttribute("featuredList",(Object)featuredList);
			request.setAttribute("movieSlideShowList",(Object)movieSlideShowList);
			request.setAttribute("genreList", (Object)genreList);
			HttpSession Ssession = request.getSession(false);
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward((ServletRequest) request, (ServletResponse) response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	//get cinemas

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
