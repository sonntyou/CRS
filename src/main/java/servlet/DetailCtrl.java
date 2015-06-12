package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DetailJudge;
import model.PartReserv;
import model.ReservContents;

/**
 * Servlet implementation class DetailCtrl
 */
@WebServlet("/DetailCtrl")
public class DetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		//
		HttpSession session =request.getSession();
		List<ReservContents> reservlist = (List<ReservContents>) session.getAttribute("reservlist");

		DetailJudge detailjudge=new DetailJudge();
		detailjudge.setDetailjudge(true);

		String locate = request.getParameter("locate");
		String stime = request.getParameter("stime");

		PartReserv partreserv = new PartReserv();

		for ( int i = 0; i < reservlist.size(); i++ ) {
			if((locate.equals(reservlist.get(i).getLocate())) && (stime.equals(reservlist.get(i).getStime()))) {

				partreserv.setLocate(reservlist.get(i).getLocate());
				partreserv.setReserver(reservlist.get(i).getReserver());
				partreserv.setTitle(reservlist.get(i).getTitle());
				partreserv.setDate(reservlist.get(i).getDate());
				partreserv.setStime(reservlist.get(i).getStime());
				partreserv.setFtime(reservlist.get(i).getFtime());
				partreserv.setPassword(reservlist.get(i).getPassword());
			}

		}

		session.setAttribute("partreserv",partreserv);
		session.setAttribute("detailjudge", detailjudge);

		RequestDispatcher dispatcher=request.getRequestDispatcher("/Top.jsp");
		dispatcher.forward(request,response);

}

}
