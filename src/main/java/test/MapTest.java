package test;

import java.util.HashMap;
import java.util.Map;

public class MapTest {
    public static void main(String[] args) {

        Map<Integer,String> celectmap = new HashMap<Integer, String>();

        String choice = "<option></option>";

        for(int i = 1; i<=10;i++){
            choice=choice.substring(0,8)+i+choice.substring(choice.length()-9);
            celectmap.put(i,choice);
        }

        int hour = 5;

        Map<Integer,String> hourmap = celectmap;
        String hourchoice = hourmap.get(hour);
        hourchoice = hourchoice.substring(0,7)+" selected>"+hourchoice.substring(8);
        hourmap.put(hour, hourchoice);

        for(int i = 1; i <=10; i++){
            System.out.println(hourmap.get(i));
        }

        System.out.println();

        int minute = 3;

        Map<Integer,String> minutemap = celectmap;
        String minutechoice = minutemap.get(minute);
        minutechoice = minutechoice.substring(0,7)+" selected>"+minutechoice.substring(8);
        minutemap.put(minute, minutechoice);

        for(int i = 1; i <=10; i++){
            System.out.println(minutemap.get(i));
        }

//        String today ="2015-06-11 00:31";
//        int year= Integer.parseInt(today.substring(0,4));
//        int month= Integer.parseInt(today.substring(5,7));
//        int day= Integer.parseInt(today.substring(8,10));
//        int hour= Integer.parseInt(today.substring(11,13));
//        int minute= Integer.parseInt(today.substring(14,16));
//
//        System.out.println(year);
//        System.out.println(month);
//        System.out.println(day);
//        System.out.println(hour);
//        System.out.println(minute);
//        System.out.println(today);
//
////        int year = dateTime.getYear();
////        Month month = dateTime.getMonth();
////        int month = dateTime.getMonthValue();
////        int day = dateTime.getDayOfMonth();
////        int hour = dateTime.getHour();
////        int minute = dateTime.getMinute();
////
//        LocalDate localdate = LocalDate.of(2012,2,25);
////        int days = localDate.lengthOfMonth(); // その月の日数
////        int days = localDate.lengthOfYear(); // その年の日数
//
//        ZonedDateTime now = ZonedDateTime.now();
//        String nowString = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
//
//        System.out.println(nowString);
//
//        LocalDate date = LocalDate.now();
//        String dateString =date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//
//        System.out.println(dateString);
//
//        YearMonth ym = YearMonth.from(localdate);
//        LocalDate firstDate = ym.atDay(1);
//        LocalDate lastDate = ym.atEndOfMonth();
//
//        String lastDateString = lastDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//
//        System.out.println(lastDateString);
    }
}
