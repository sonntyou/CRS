package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Judge;
import model.ReservLogic;
import model.Today;

/**
 * Servlet implementation class DayCtrl
 */
@WebServlet("/DayCtrl")
public class DayCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String date=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
		String todaytime ="09:00";

		Today today = new Today(date);
		today.setTodayTime(todaytime);

		HttpSession session =request.getSession();
		session.setAttribute("today",today);

		ReservLogic reservlogic=new ReservLogic();
		reservlogic.execute(date);

		Judge judge = new Judge();
		request.setAttribute("judge",judge);

		RequestDispatcher dispatcher=request.getRequestDispatcher("/Top.jsp");
		dispatcher.forward(request,response);

	}

}
