package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Judge;
import model.ReservContents;
import model.ReservLogic;
import model.Today;

/**
 * Servlet implementation class MainCtrl
 */
@WebServlet("/MainCtrl")
public class MainCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String date =LocalDate.now().toString();
		Today today = new Today(date);
		ReservLogic reservlogic = new ReservLogic();

		HttpSession session = request.getSession();

		request.setAttribute("today", today);
		session.setAttribute("reservlist", reservlogic.execute(date));

		RequestDispatcher dispatcher=request.getRequestDispatcher("/Top.jsp");
		dispatcher.forward(request,response);

		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	if(request.getParameter("reserver")==null){
		//予約者名がないときに実行
		RequestDispatcher dispatcher=request.getRequestDispatcher("/NoName.jsp");
		dispatcher.forward(request,response);

		//読み込んだパスワードが半角英数のみかどうかを判定
	}else if(Pattern.compile("^[0-9a-zA-Z]+$").matcher(request.getParameter("password")).find()){
		//送られてきた情報を取得
		String locate = request.getParameter("locate");
		String reserver = request.getParameter("reserver");
		String title = request.getParameter("title");
		String date = request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
		String stime = request.getParameter("shour")+":"+request.getParameter("sminute");
		String ftime = request.getParameter("fhour")+":"+request.getParameter("fminute");
		String password = request.getParameter("password");

		//ReservContentsインスタンスを生成
		ReservContents reservcontents = new ReservContents(locate,reserver,title,date,stime,ftime,password);

		//ReservLogicにReservContentsを渡し、登録をしてもらう
		ReservLogic reservlogic = new ReservLogic();

		Judge judge = new Judge();

		//重複があればfalseが帰ってきて、登録が完了していればtrueが返ってくる
		judge.setJudge(reservlogic.execute(reservcontents));
		request.setAttribute("judge", judge);

		RequestDispatcher dispatcher=request.getRequestDispatcher("/ReservResult.jsp");
		dispatcher.forward(request,response);

		}else{
			//パスワードが不正なときに実行
			Judge judge = new Judge();
			judge.setJudge(false);
			request.setAttribute("judge", judge);

			RequestDispatcher dispatcher=request.getRequestDispatcher("/PassResult.jsp");
			dispatcher.forward(request,response);

			}
	}

}
