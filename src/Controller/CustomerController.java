package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Model.Member;
import dao.MemberDao;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Gson gson;
	MemberDao mDao;
	boolean check;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerController() {
		super();
		// TODO Auto-generated constructor stub

		gson = new Gson();
		try {
			mDao = new MemberDao();
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
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		try {
			String username = request.getParameter("loginID");
			String password = request.getParameter("loginPwd");

			Member mMember = mDao.login(username, password);
			HttpSession session = request.getSession(true);
			if (mMember.getmUserName() != null) {
				session.setAttribute("CustomerUserID", mMember.getmMemberID() + "");
				session.setAttribute("CustomerName", mMember.getmUserName());

				request.getRequestDispatcher("index.jsp").forward(request, response);
				response.sendRedirect("/index.jsp");
			}
		} catch (Exception e) {

			System.out.println("not working");
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
