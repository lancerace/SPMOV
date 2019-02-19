package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Model.History;
import dao.BookMovieDao;
import dao.HistoryDao;

/**
 * Servlet implementation class HistoryController
 */
@WebServlet("/HistoryController")
public class HistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HistoryDao dao;
	Gson gson = new Gson();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryController() {
        super();
        // TODO Auto-generated constructor stub
        try {
			dao = new HistoryDao();
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
		HttpSession Ssession = request.getSession(false);
		String customerId=(String)Ssession.getAttribute("CustomerUserID");
		
		ArrayList<History> historyList = new ArrayList<History>();
		try {
			historyList= dao.getHistory(customerId);
			PrintWriter out = response.getWriter();
			String content="";
			content+="<table class=\"table table-hover \">";
			content+="<thead><th>Movie Name</th><th>Branch</th><th>Date</th><th>Price</th></thead>";
			content+="<tbody id=\"cartBody\">";
			double total = 0.00;
				for (int i = 0; i < historyList.size(); i++) {
	
					total += Double.parseDouble(historyList.get(i).getValue());
					System.out.println("price is :"+historyList.get(i).getValue());
					content+="<tr>";
					content+="<td>"+historyList.get(i).getTitle()+"</td>";
					content+="<td>"+historyList.get(i).getCinema()+"</td>";
					content+="<td>"+historyList.get(i).getTimeslot()+"</td>";
					content+="<td>"+historyList.get(i).getValue()+"</td>";	
				}
				content+="</tr></tbody></table><p id=\"totalPrice\" align=\"right\">Total price $"+total+"</p>";
				System.out.println("HistoryContent "+content);
			out.print(gson.toJson(content));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
