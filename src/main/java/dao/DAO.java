package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.PartReserv;
import model.ReservContents;

public class DAO {
	private final String DRIVER_NAME = "org.postgresql.Driver";
	private final String JDBC_URL = "jdbc:postgresql://localhost:5432/";
	private final String DB_USER = "postgres";
	private final String DB_PASS = "1714";

	//データベースに日付で検索をかけて、予約ごとにインスタンスを生成し、リストに格納し、そのリストを返す。
	public  List<ReservContents> search(String _date) {
		Connection conn =null;

		//ReservContentsを格納し、一日の予約を格納するリストを作成
		List<ReservContents> reservList = new ArrayList<ReservContents>();

		try {
			Class.forName(DRIVER_NAME);
			conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS);

			//SELECT文の準備
			String sql =
			"SELECT locate,name,title,kwd,time_st,time_end FROM rsv_timetable WHERE to_char(time_st,'yyyy-mm-dd')='"+_date+"';";
			PreparedStatement pstmt =conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			//SELECTされたオブジェクトを1行ごとにReservContents型のyoyakuに格納し、Listに追加していく
			while(rs.next()){
				String locate =rs.getString("locate");
				String reserver=rs.getString("name");
				String title=rs.getString("title");
				String password=rs.getString("kwd");
				//年月日だけ抽出して入れる
				String date =new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("time_st"));
				//時分だけ抽出して入れる
				String stime = new SimpleDateFormat("HH:mm").format(rs.getTimestamp("time_st"));
				String ftime = new SimpleDateFormat("HH:mm").format(rs.getTimestamp("time_end"));;

				ReservContents yoyaku = new ReservContents(locate,reserver,title,password,date,stime,ftime);

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

			//ReservContentsに登録された予約情報をゲットしてます。
			String locate = reservcontents.getLocate();
			String date = reservcontents.getDate();
			String stime = reservcontents.getStime();
			String ftime = reservcontents.getFtime();
			String reserver = reservcontents.getReserver();
			String title = reservcontents.getTitle();
			String password = reservcontents.getPassword();
			String mpassword = reservcontents.getMPassword();

			//送られてきたlocateとdateに一致するデータを持ってくる
			String sql ="select time_st,time_end from rsv_timetable where locate='"+locate+"'and to_char(time_st,'yyyy-mm-dd')='"+date+"';";
			PreparedStatement pstmt =conn.prepareStatement(sql);

			//SQL文(SELECT)の実行
			ResultSet rs =pstmt.executeQuery();

			int count=0;
			while(rs.next()){

				//データベース上のtime_stとtime_endをHH:mmの形で取ってきてそれぞれtime_stとtime_endに代入
				String time_st = new SimpleDateFormat("HH:mm").format(rs.getTimestamp("time_st"));
				String time_end = new SimpleDateFormat("HH:mm").format(rs.getTimestamp("time_end"));

				//3文字目の:を削除
				String convtime_st=time_st.substring(0,2)+time_st.substring(time_st.length()-2);
				String convtime_end=time_end.substring(0,2)+time_end.substring(time_end.length()-2);
				String convstime=stime.substring(0,2)+stime.substring(stime.length()-2);
				String convftime=ftime.substring(0,2)+ftime.substring(ftime.length()-2);

				//String型をint型に変換
				int inttime_st= Integer.parseInt(convtime_st);
				int intstime= Integer.parseInt(convstime);
				int intftime= Integer.parseInt(convftime);
				int inttime_end= Integer.parseInt(convtime_end);

				//時間がかぶっていたらカウントし、break
				if((intstime >= inttime_st && intstime < inttime_end)||(intftime > inttime_st && intftime <= inttime_end)||(intstime <= inttime_st && intftime >= inttime_end)) {
					count++;
					break;
				}

			}//while文の最後

				//カウンターが0だったら、つまり、1つでも予定がかぶっていたらfalseを返す
				if(count == 1) {
					return false;
				}else{
					//１つも予定がかぶっていなかったら、dateとstimeを足してpostgreSQLのtimestamp型に形成し、挿入
					String timestampstime = date + " " + stime + ":00";
					String timestampftime = date + " " + ftime + ":00";

					String insertsql ="insert into rsv_timetable (locate, name, title, time_st, time_end, kwd, mst_kwd) values"
							+ "("+locate+",'"+reserver+"','"+ title+"','"+ timestampstime+"','"+ timestampftime+"','"+ password+"','"+ mpassword+"');";

					PreparedStatement stmt = conn.prepareStatement(insertsql);

					//SQL文(INSERT)の実行
					int num = stmt.executeUpdate();

					//INSERTが期待通り(1件だけ挿入すること)の結果でなければfalseを返す
					if(num != 1){
						return false;
					}

					//登録が正常に済めばtrueを返す
					return true;
				}

			}catch(SQLException e){
			e.printStackTrace();
			return false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
					return false;
				}
			}
		}
	}//reservメソッドの終わり

	//データベースから一致したデータを消す
	public boolean delete(PartReserv partreserv) {
		Connection conn = null;

		try {
			Class.forName(DRIVER_NAME);
			conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS);

			//ReservContentsに登録された予約情報をゲットしてます。
			String locate = partreserv.getLocate();
			String date = partreserv.getDate();
			String stime = partreserv.getStime();

			String timestampstime = date + " " + stime + ":00";
			//送られてきたlocateとdateに一致するデータを持ってくる
			String sql ="delete from rsv_timetable where locate='"+locate+"'and time_st='"+timestampstime+"';";

			PreparedStatement pstmt =conn.prepareStatement(sql);
			//SQL文の実行
			int num = pstmt.executeUpdate();

			//削除された行数が0行だったらfalseを返す
			if(num == 0){
				return false;
			}

			//DELETEが行われたらtrueを返す
			return true;

		}catch(SQLException e){
			e.printStackTrace();
			return false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
					return false;
				}
			}
		}
	}//Deleteメソッドの終わり


}//クラスの終わり