package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Model.Ticket;
import dao.BookMovieDao;
import dao.PaymentDao;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/PaymentController")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PaymentDao dao;
	Gson gson = new Gson();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentController() {
        super();
        // TODO Auto-generated constructor stub
        try {
			dao = new PaymentDao();
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
		response.setContentType("application/json; charset=UTF-8");
		String command = request.getParameter("command");
		HttpSession Ssession = request.getSession(false);
		if (command.equals("pay")) {
			String userID = (String) Ssession.getAttribute("CustomerUserID");			
			int count=0;
			ArrayList<Ticket> mTicket=(ArrayList<Ticket>) Ssession.getAttribute("CartList");
			for(int i=0;i<mTicket.size();i++){
				String theatreID= mTicket.get(i).getTheatreID();
				String movieID =mTicket.get(i).getMovieID();
				String timeslotID= mTicket.get(i).getTimeslotID();
				String Theatre_movieID = mTicket.get(i).getTheatre_movieID();
				String row= mTicket.get(i).getRow();
				String column= mTicket.get(i).getColumn();
				try {
					count+=dao.PayMovie(userID,theatreID,movieID,Theatre_movieID,row,column);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("error "+e);
				}
				
				System.out.println("totaladded="+count);
				
				
			}
		
		
		}
		doGet(request, response);
	}

}
