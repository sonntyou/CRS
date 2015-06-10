package model;

import java.io.Serializable;

public class Today implements Serializable {
	private String today;

	public Today(){

	}

	public Today(String today){
		this.today=today;
	}

	public void settoday(String today){
		this.today=today;
	}

	public String gettoday(){
		return today;
	}

}
