package model;

import java.io.Serializable;

public class Judge implements Serializable{
	boolean judge;

	public boolean isJudge() {
		return judge;
	}

	public void setJudge(boolean judge) {
		this.judge = judge;
	}


}
