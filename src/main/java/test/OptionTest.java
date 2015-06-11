package test;

public class OptionTest {
	public static void main(String[] args) {
		String optionst = "<option value=";
		String optionend ="</option>";

		int i = 1;

		String mchoice = optionst + "\""+i+"\">"+i+optionend;

		System.out.println(mchoice);

		String selectedminute = optionst + "\""+i+"\" selected>"+i+optionend;

		System.out.println(selectedminute);

	}
}
