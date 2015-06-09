package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.ReservContents;

public class DAO {
	private final String DRIVER_NAME = "org.postgresql.Driver";
	private final String JDBC_URL = "jdbc:postgresql://localhost:5432/";
	private final String DB_USER = "postgres";
	private final String DB_PASS = "1714";

	//データベースに日付で検索をかけて、予約ごとにインスタンスを生成し、リストに格納し、そのリストを返す。
	public  List<ReservContents> search(ReservContents reservcontents) {
		Connection conn =null;

		//ReservContentsを格納し、一日の予約を格納するリストを作成
		List<ReservContents> reservList = new ArrayList<ReservContents>();

		try {
			Class.forName(DRIVER_NAME);
			conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS);

			//SELECT文の準備
			String sql =
			"SELECT locate,name,title,kwd,mst_kwd,time_st,time_end FROM rsv_timetable WHERE to_char(time_st,'yyyy-mm-dd')='"+reservcontents.getDate()+"';";
			PreparedStatement pstmt =conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while(rs.next()){
				String locate =rs.getString("locate");
				String reserver=rs.getString("name");
				String title=rs.getString("title");
				String password=rs.getString("kwd");
				String mpassword=rs.getString("mst_kwd");
				//年月日だけ抽出して入れる
				String date =new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("time_st"));
				//時分だけ抽出して入れる
				String stime = new SimpleDateFormat("hh:mm").format(rs.getTimestamp("time_st"));
				String ftime = new SimpleDateFormat("hh:mm").format(rs.getTimestamp("time_end"));;

				ReservContents yoyaku = new ReservContents(locate,reserver,title,password,mpassword,date,stime,ftime);

				reservList.add(yoyaku);
			}

		}catch(SQLException e){
			e.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
					return null;
				}
			}
		}
			return reservList;
	}

	//データベースと照合し、重複がなければ予約追加します
	public boolean reserv(ReservContents reservcontents) {
		Connection conn = null;

		try {
			Class.forName(DRIVER_NAME);
			conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS);

			String locate = reservcontents.getLocate();
			String date = reservcontents.getDate();
			String stime = reservcontents.getStime();
			String ftime = reservcontents.getFtime();
			String reserver = reservcontents.getReserver();
			String title = reservcontents.getTitle();
			String password = reservcontents.getPassword();
			String mpassword = reservcontents.getMPassword();





			//SELECT文の準備
			String sql =



		}catch(SQLException e){
			e.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
					return null;
				}
			}
		}

	}
	}