package test;

import java.util.List;

import model.ReservContents;
import dao.DAO;

public class DAOTest {
	public static void main(String[] args) {
		ReservContents reservcontents = new ReservContents("2015-06-08");

		DAO dao = new DAO();

		List<ReservContents> reservList = dao.search(reservcontents);

		for(int i =0; i<reservList.size();i++){
			ReservContents yoyaku = reservList.get(i);

			System.out.println(yoyaku.getLocate());
			System.out.println(yoyaku.getReserver());
			System.out.println(yoyaku.getTitle());
			System.out.println(yoyaku.getDate());
			System.out.println(yoyaku.getStime());
			System.out.println(yoyaku.getFtime());

		}


	}
}
