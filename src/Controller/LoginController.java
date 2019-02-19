package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;
import dao.UserDao;

/**
 * Servlet implementation class LoginController
 */

// @WebServlet("/LoginController")

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao mUserDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub

		try {
			mUserDao = new UserDao();
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
		response.getWriter().append("Served att: ").append(request.getContextPath());
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
		System.out.println("LoginController Activated");
		response.getWriter().append("Served att: ").append(request.getContextPath());

		String mUsername = request.getParameter("inputText");
		String mPassword = request.getParameter("inputPassword");
		System.out.println(mUsername + mPassword + " for login controller");
		try {
			User mUser = mUserDao.getOneUser(mUsername, mPassword);
			System.out.println("from mUserDao" + mUser.getmUsername() + mUser.getmPassword());
			if ((mUser.getmUsername() != null) && (mUser.getmPassword() != null)) {
				System.out.println("LoginController if Condition invoked");
				HttpSession userSession = request.getSession(true);
				userSession.setAttribute("USER", mUser);

				// specify pathname to the resource
				// forward response if user exist
				request.getRequestDispatcher("/ViewMovieRecord.jsp").forward(request, response);
			} else {
				// forward back to loginPage
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	// end doPost

}
