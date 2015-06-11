package model;

import java.util.List;

import dao.DAO;

public class ReservLogic {

	public List<ReservContents> execute(String date){
		DAO dao=new DAO();
		return dao.search(date);
	}

	public int execute(ReservContents reservcontents){
		DAO dao=new DAO();
		return dao.reserv(reservcontents);
	}

	public int execute(PartReserv partreserv){
		DAO dao =new DAO();
		return dao.delete(partreserv);

	}

}
