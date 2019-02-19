package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.Member;
import dao.MemberDao;

/**
 * Servlet implementation class MemberController
 */
// @WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Gson gson;
	MemberDao mDao;
	boolean check;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberController() {
		super();
		try {
			gson = new Gson();
			mDao = new MemberDao();
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
		System.out.println("doGet Membercontroller");
		response.getWriter().append("Served at: yoyoyoyo").append(request.getContextPath());

		try {
			if (request.getAttribute("command").equals("getMember")) {
				System.out.println("Command getMember invoked..");
				Member mMember = mDao.getOneMember("Member", request.getAttribute("memberID") + "");
				request.setAttribute("Memberobj", mMember);
				System.out.println("end of member ");
				RequestDispatcher Rd = request.getRequestDispatcher("/EditProfile.jsp");
				Rd.forward(request, response);

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
		System.out.println("dopost MemberController");
		// doGet(request, response);
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			System.out.println("doPost invoked");
			System.out.println(request.getParameter("command"));
			System.out.println(gson.toJson(request.getParameter("Member")));
			if (request.getParameter("command").equals("registerMember")) {

				Member mMember = gson.fromJson(request.getParameter("Member"), Member.class);

				check = mDao.addOneMember(mMember);
				System.out.println("password checking.." + mMember.getmPassword());
			} else if (request.getParameter("command").equals("updateMember")) {
				Member mMember = gson.fromJson(request.getParameter("Member"), Member.class);

				// updating member
				boolean check = mDao.updateOneMember(mMember);

				out.write(check + "");

				System.out.println("check updating record...:" + check);

			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
