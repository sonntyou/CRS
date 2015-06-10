package test;

//import java.util.List;

import model.PartReserv;
import dao.DAO;

public class DAOTest {
	public static void main(String[] args) {
//		ReservContents reservcontents = new ReservContents("2015-06-08");

		DAO dao = new DAO();

//		List<ReservContents> reservList = dao.search(reservcontents);
//
//		for(int i =0; i<reservList.size();i++){
//			ReservContents yoyaku = reservList.get(i);
//
//			System.out.println(yoyaku.getLocate());
//			System.out.println(yoyaku.getReserver());
//			System.out.println(yoyaku.getTitle());
//			System.out.println(yoyaku.getDate());
//			System.out.println(yoyaku.getStime());
//			System.out.println(yoyaku.getFtime());
//
//		}

		PartReserv takumiso = new PartReserv();
		takumiso.setLocate("1");
		takumiso.setTitle("あかさたな");
		takumiso.setReserver("飯野");
		takumiso.setDate("2015-06-08");
		takumiso.setStime("18:14");
		takumiso.setFtime("20:00");
		takumiso.setPassword("0000");


		if(dao.delete(takumiso)){
			System.out.println("登録されたよ");
		}else{
			System.out.println("正しくはじかれたかエラーです。");
		}

	}
}
