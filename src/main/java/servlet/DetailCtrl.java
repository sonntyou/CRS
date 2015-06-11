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

		String locate = request.getParameter("locate");
		String stime = request.getParameter("stime");

	if(stime.equals(reservlist.get(1).getStime())){
			System.out.println("stimeが一致");
		}


		PartReserv partreserv = new PartReserv();

		for ( int i = 0; i < reservlist.size(); i++ ) {
			System.out.println("for文が実行されました。");
			if((locate.equals(reservlist.get(i).getLocate())) && (stime.equals(reservlist.get(i).getStime()))) {

				System.out.println("ヒット！");
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


		RequestDispatcher dispatcher=request.getRequestDispatcher("/Detail.jsp");
		dispatcher.forward(request,response);

}

}
