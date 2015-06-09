import java.util.regex.Pattern;


public class test {
	public static void main(String[] args) {

		String password = "a";

		if(Pattern.compile("^[0-9a-zA-Z]+$").matcher(password).find()){
			System.out.println("成功");
		}else{
			System.out.println("失敗");
		}
	}
	}
