package model;

import java.io.Serializable;

public class ReservContents implements Serializable {
	private String locate,reserver,title,password;
	private String stime,ftime,date;
	private String mpassword = "NIKUNIkU29nIkU2914nikUBy0024";

	//コンストラクタ
	public ReservContents(){}

	public ReservContents(String date){
		this.date=date;
	}

	public ReservContents(String locate, String reserver,String title,String password,String date,
					String stime,String ftime) {
					this.locate = locate;
					this.reserver = reserver;
					this.title = title;
					this.password = password;
					this.date = date;
					this.stime = stime;
					this.ftime = ftime;
	}

	//ゲッター

	public String getLocate() {
		return locate;
	}

	public String getReserver() {
		return reserver;
	}

	public String getTitle() {
		return title;
	}

	public String getPassword() {
		return password;
	}

	public String getMPassword(){
		return mpassword;
	}

	public String getDate() {
		return date;
	}

	public String getStime() {
		return stime;
	}

	public String getFtime() {
		return ftime;
	}


	//セッター

	public void setLocate(String locate) {
		this.locate = locate;
	}

	public void setReserver(String reserver) {
		this.reserver = reserver;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setPassword(String password) {
		this.password = password;
	}
//
//	public void setMpassword(String mpassword) {
//		this.mpassword = mpassword;
//	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public void setFtime(String ftime) {
		this.ftime = ftime;
	}


}
