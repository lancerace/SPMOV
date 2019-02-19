package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import Model.Cinema;
import Model.Ticket;
import dao.InstantBookingDao;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Gson gson = new Gson();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
        super();
     
        // TODO Auto-generated constructor stub
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
		response.setContentType("application/json; charset=UTF-8");
		String command = request.getParameter("command");
		HttpSession Ssession = request.getSession(false);
		if (command.equals("add")) {
			//System.out.println("cart add running");
			ArrayList<Ticket> mTicket;
			if(Ssession.getAttribute("CartList")==null){
				ArrayList<Ticket> cartList= new ArrayList<Ticket>();
				Ssession.setAttribute("CartList", cartList);			
			}
			ArrayList<Ticket> currentCart=(ArrayList<Ticket>) Ssession.getAttribute("CartList");
			//add item to cart session
			String movieId = (String)request.getParameter("movieID");
			String movieName = (String)request.getParameter("movieName");
			String branchName = (String)request.getParameter("branchName");
			String value = (String)request.getParameter("price");
			String theatreId =(String)request.getParameter("theatreID");
			String dateTime = (String)request.getParameter("datetime");
			String cinemaId = (String)request.getParameter("cinemaID");
			String Theatre_movieID = (String)request.getParameter("Theatre_movieID");
			String timeslotId = (String)request.getParameter("timeslotID");
			//System.out.println("user "+userId);
			String seat = (String)request.getParameter("seats");
			//System.out.println("Seat json"+seat);
			ArrayList<String> seatList = new ArrayList<String>();
			seatList = gson.fromJson(seat, new TypeToken<ArrayList<String>>() {}.getType());
			//System.out.println("Seat"+seatList.get(1));
			for(int i=0;i<seatList.size();i++){
				Ticket t= new Ticket();
				t.setCinemaID(cinemaId);
				t.setCinemaName(branchName);
				t.setTitle(movieName);
				t.setTime(dateTime);
				t.setTime(dateTime);
				t.setValue(value);
				t.setMovieID(movieId);
				t.setTheatreID(theatreId);
				t.setTimeslotID(timeslotId);
				t.setTheatre_movieID(Theatre_movieID);
				char letter= seatList.get(i).charAt(0);
				String col= seatList.get(i).substring(1);
				int  row = (int) letter;
				row-=64;
				//System.out.println("Row "+row+" Col"+col);
				t.setRow(row+"");
				t.setColumn(col);
				//System.out.println("cinemaId "+cinemaId+"branchName"+branchName+"movieName "+movieName+"dateTime "+dateTime+"price "+price+"movieId "+movieId+"timeslotId "+timeslotId);
				currentCart.add(t);
				
			}
			Ssession.removeAttribute("CartList");
			Ssession.setAttribute("CartList", currentCart);
			//System.out.println("currentcart size :"+currentCart.size());
			

		}else if (command.equals("remove")){
			//System.out.println("run remove");
			String postion = (String)request.getParameter("position");
			//System.out.println(" postion"+postion);
			ArrayList<Ticket> currentCart=(ArrayList<Ticket>) Ssession.getAttribute("CartList");
			//System.out.println("before Size:"+currentCart.size());
			currentCart.remove(Integer.parseInt(postion));
			//System.out.println("Size:"+currentCart.size());
			Ssession.removeAttribute("CartList");
			Ssession.setAttribute("CartList", currentCart);
			PrintWriter out = response.getWriter();
			String content="";
			content+="<table class=\"table table-hover \">";
			content+="<thead><th>Movie Name</th><th>Branch</th><th>Seat</th><th>Date</th><th>Price</th><th>Remove</th></thead>";
			content+="<tbody id=\"cartBody\">";
			double total = 0.00;
				for (int i = 0; i < currentCart.size(); i++) {
					char myChar = (char) (64 + (Integer.parseInt(currentCart.get(i).getRow())));
					String seatNo = myChar + "" + currentCart.get(i).getColumn();
					total += Double.parseDouble(currentCart.get(i).getValue());
					System.out.println("price is :"+currentCart.get(i).getValue());
					content+="<tr>";
					content+="<td>"+currentCart.get(i).getTitle()+"</td>";
					content+="<td>"+currentCart.get(i).getCinemaName()+"</td>";
					content+="<td>"+seatNo+"</td>";
					content+="<td>"+currentCart.get(i).getTime()+"</td>";
					content+="<td>"+currentCart.get(i).getValue()+"</td>";
					content+="<td>"+"<input type=\"button\" id="+i+" value=\"Delete\"";
					content+=" onclick=\"deleteCartItem(this.id)\"></td>";
				}
			
				content+="</tr></tbody></table><p id=\"totalPrice\" align=\"right\">Total price $"+total+"</p>";
				//System.out.println("content"+content);
			out.print(gson.toJson(content));
		}

		
		doGet(request, response);
	}

}
