<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.ReservContents,java.util.List,
java.util.Map,
java.util.HashMap,
java.time.LocalDate,
java.time.YearMonth,
java.time.format.DateTimeFormatter,
model.Today" %>
<!-- <link rel="StyleSheet" href="/CRS/src/main/webapp/Top.css" type="text/css">  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="">
<title>会議室予約システム</title>

<style type="text/css">

.time {
	border-style:none;
	text-align:right;
	height:120px;
}

.memori0{
	 border-style:none;
}

.memori{
	border-top:none;
	border-left:none;
}

.timetitle {
	color: red;
	border-style:none;
}

.table
{
  border-collapse: collapse;
  border-style:none;
}

.gyou{
	height:1000px;
}

.sitebody{
	width: 900px;
}

.reservform{
  height: 300px;
  width: 300px;
  float: left;
  padding: 30px;
  color: white;
  background-color: #40bfb0;
  padding: 15px;
  margin-bottom: 10px;
	border-right: 1px solid #dddddd;

}
<!-- -->
.dayreserv{
	float:right;
	padding: 30px;
  color: black;
  background-color: #FFFACD;
  padding: 15px;
  margin-bottom: 10px;
	border-right: 1px solid #dddddd;

}


.appoint{
	height:200px;
	width:300px;
	float:left;
	 padding: 30px;
  color: white;
  background-color: #FFFF33;
  padding: 15px;
  margin-bottom: 10px;
	border-right: 1px solid #dddddd;

}


</style>

</head>

<body>
<div class="sitebody">

<%
	int width = 150;

	int leftref = 434;
	int topref= 157;

List<ReservContents> reservlist = (List<ReservContents>)session.getAttribute("reservlist");
int size = reservlist.size();

%>

<%

/*
	Mapは参照型
	以下の処理に加えて、Today.javaから現在の年月日を取得し、todayに代入。
*/

//現在の年月日と時刻の取得
Today todaytime =(Today) session.getAttribute("today");

String today=todaytime.getToday()+" "+todaytime.getTodayTime();

//substring(インデックス,何文字目か)
int year= Integer.parseInt(today.substring(0,4));
int month= Integer.parseInt(today.substring(5,7));
int day= Integer.parseInt(today.substring(8,10));
int chkday =day;	//月の処理のところでどうしても必要なのでやむを得なく追加
int hour= Integer.parseInt(today.substring(11,13));
int minute= Integer.parseInt(today.substring(14,16));


//プルダウンメニューに選択肢を表示するために必要な文字列
String optionst = "<option value=";
String optionend ="</option>";

//現在の分を初期選択肢にするための処理
Map<Integer,String> minutemap = new HashMap<Integer, String>();

for(int i = 0; i<=45;i=i+15){
	String mchoice;
	if(i<10){
    mchoice= optionst + "\"0"+i+"\">"+i+optionend;
	}else{
	mchoice= optionst + "\""+i+"\">"+i+optionend;
	}
    minutemap.put(i,mchoice);
}

if((hour >= 21 && minute >0)|| hour < 9 ){
    minute = 0;
}else if(minute==0){
	//そのまま
}else if(minute <= 15){
    minute = 15;
}else if(minute <= 30){
    minute = 30;
}else if(minute <=45){
    minute = 45;
}else if(minute >45){
    //45分を超えていたら時間を繰り上げる。
    minute =0;
    hour++;
}

String selectedminute;
if(minute<10){
	selectedminute = optionst + "\"0"+minute+"\" selected>"+minute+optionend;
}else{
	selectedminute = optionst + "\""+minute+"\" selected>"+minute+optionend;
}
minutemap.put(minute, selectedminute);

String minutechoices = "";

for(int i = 0; i <=45; i=i+15){
    minutechoices += minutemap.get(i);
}

/*	現在の時間を初期選択肢にするための処理
	分の繰り上がり処理を行ってから時間の処理をするべきだから
	分の後に処理をする必要がある。
*/
Map<Integer,String> hourmap = new HashMap<Integer, String>();

for(int i = 9; i<=21;i++){
	 String hchoice;
	if(i<10){
	    hchoice=optionst + "\"0"+i+"\">"+i+optionend;
	}else{
		hchoice=optionst + "\""+i+"\">"+i+optionend;
	}
	hourmap.put(i,hchoice);
}

if(hour <=9){
    hour=9;
}else if(hour >= 21){
    hour=9;
    chkday++;

}
String selectedhour;
if(hour<10){
	selectedhour = optionst + "\"0"+ hour +"\" selected>"+ hour +optionend;
}else{
	selectedhour = optionst + "\""+ hour +"\" selected>"+ hour +optionend;
}
hourmap.put(hour, selectedhour);

String hourchoices = "";

for(int i = 9; i <=21; i++){
    hourchoices += hourmap.get(i);
}

//現在の日を初期選択肢にするための処理

	//アクセスした月の最終日(うるう年考慮)をintlastDateに格納
LocalDate localdate = LocalDate.of(year,month,day);
YearMonth ym = YearMonth.from(localdate);
LocalDate lastDate = ym.atEndOfMonth();
String StringlastDate = lastDate.format(DateTimeFormatter.ofPattern("dd"));
int intlastDate = Integer.parseInt(StringlastDate);

/*
	たとえば、2015年6月30日22:00にアクセスしたとすると
	直前の時間の処理でhourは9:00になり、chkdayが+1されている。
	そうすると6月31日になるわけだが、それは存在しない。
	存在しない年月日をLocalDateに入れるとエラーを吐くので、
	そのために、dayとは別にchkdayを設けた。
	存在しない場合は、monthを+1し、dayを1にする。
	プルダウンメニューに欲しい項目は、新しい月の日数なので
	ここで、またintlastDateを再評価する。
*/
if(chkday > intlastDate ){
    day=1;
    if(month+1 >12){	//学習ポイント！前置++と後置++と+1の違い
        year++;
        month=1;
    }else{
        month++;
    }

    localdate = LocalDate.of(year,month,day);
    ym = YearMonth.from(localdate);
    lastDate = ym.atEndOfMonth();
    StringlastDate = lastDate.format(DateTimeFormatter.ofPattern("dd"));
    intlastDate = Integer.parseInt(StringlastDate);
}else{
	day=chkday;
}

Map<Integer,String> daymap = new HashMap<Integer, String>();

for(int i = 1; i<=intlastDate;i++){
	 String dchoice;
	if(i<10){
	    dchoice=optionst + "\"0"+i+"\">"+i+optionend;
	}else{
		dchoice=optionst + "\""+i+"\">"+i+optionend;
	}
	daymap.put(i,dchoice);
}

String selectedday;
if(day<10){
	selectedday = optionst + "\"0"+ day +"\" selected>"+ day + optionend;
}else{
	selectedday = optionst + "\""+ day +"\" selected>"+ day + optionend;
}
daymap.put(day, selectedday);

String daychoices = "";

for(int i = 1; i <=intlastDate; i++){
    daychoices += daymap.get(i);
}

//現在の月を初期選択肢にするための処理
Map<Integer,String> monthmap = new HashMap<Integer, String>();

for(int i = 1; i<=12;i++){
    String monchoice;
	if(i<10){
	    monchoice=optionst + "\"0"+i+"\">"+i+optionend;
	}else{
		monchoice=optionst + "\""+i+"\">"+i+optionend;
	}
	monthmap.put(i,monchoice);
}

String selectedmonth;
if(month<10){
	selectedmonth = optionst + "\"0"+ month +"\" selected>"+ month + optionend;
}else{
	selectedmonth = optionst + "\""+ month +"\" selected>"+ month + optionend;
}
monthmap.put(month, selectedmonth);

String monthchoices = "";

for(int i = 1; i <=12; i++){
    monthchoices += monthmap.get(i);
}

//現在の年を初期選択肢にするための処理
Map<Integer,String> yearmap = new HashMap<Integer, String>();

for(int i = year; i<=(year+10);i++){
    String ychoice=optionst + "\""+i+"\">"+i+optionend;
	yearmap.put(i,ychoice);
}

String selectedyear = optionst + "\""+year+"\" selected>"+year+optionend;
yearmap.put(year, selectedyear);

String yearchoices = "";

for(int i = year; i <=(year+10); i++){
    yearchoices += yearmap.get(i);
}

%>



<div class="reservform">

<h3>予約フォーム</h3>

<form action ="/CRS/MainCtrl" method ="post">
	予約者名：<input type="text" name="reserver" value=""><br>
	タイトル：<input type="text" name="title" value=無題><br>
	予約場所：<select name="locate" size="1">
				<option value="1">会議室</option>
				<option value="2">応接室</option>
				<option value="3">リフレッシュルーム</option>
			</select><br>

開始時間：
<select name="year">
<%=yearchoices %>
</select> 年
<select name="month">
<%=monthchoices %>
</select> 月
<select name="day">
<%=daychoices %>
</select> 日
<select name="shour">
<%=hourchoices %>
</select> 時
<select name="sminute">
<%=minutechoices %>
</select> 分<br>

終了時間：
<select name="fhour">
<%=hourchoices %>
</select> 時
<select name="fminute">
<%=minutechoices %>
</select> 分<br>

	パスワード：<input type="password" name="password" value="0000">
	*パスワードの初期値は[0000]です
	<input type="submit" value =予約>
</form>

</div>
<div>

<%@ include file="Check.jsp" %>

</div>

<div class="dayreserv">
	<p>${today.today}の予定</p>

		<table class="table" border="1">
			<tr>
 				<th class="timetitle" id="time"></th>
 				<th class="memori0"> </th>
 				<th width=<%=width%>>会議室</th>
 				<th width =<%=width%>>応接室</th>
 				<th width =<%=width%>>リフレッシュ</th>
			</tr>
			<tr>
 				<td class="time"rowspan="2">9:00</td>
 				<td class="memori"></td>
 				<td rowspan="26"></td>
 				<td rowspan="26"></td>
 				<td rowspan="26"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">10:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">11:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">12:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">13:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">14:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">15:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">16:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">17:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">18:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">19:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">20:00</td>
			<td class="memori"></td>
			</tr>
			<tr><td class="memori0"></td></tr>
			<tr>
 				<td class="time" rowspan="2">21:00</td>
 			<td class="memori"></td>
 			</tr>
 			<tr><td class="memori0"></td></tr>

</table>

<%for(int i = 0;i<size;i++) {

String reserver = reservlist.get(i).getReserver();
String stime = reservlist.get(i).getStime();
String ftime = reservlist.get(i).getFtime();
String locate = reservlist.get(i).getLocate();

//始まりの時間と分
String convshour=stime.substring(0,2);
String convsminute=stime.substring(stime.length()-2);

//終わりの時間と分
String convfhour=ftime.substring(0,2);
String convfminute=ftime.substring(ftime.length()-2);

//始まりの時間と分をint型に
int intshour= Integer.parseInt(convshour);
int intsminute= Integer.parseInt(convsminute);

//終わりのの時間と分をint型に
int intfhour= Integer.parseInt(convfhour);
int intfminute= Integer.parseInt(convfminute);

//場所をint型に
int intlocate =Integer.parseInt(locate);

//左端の値
int leftside = (intlocate - 1) * 150+leftref;

//上端と下端の値
int px=120;
int topside = (intshour-9)*px + intsminute*px/60+topref;
int height = ((intfhour*60+intfminute)-(intshour*60+intsminute))*px/60;

%>



<table class="reserv" style ="position:absolute; left:<%=leftside%>px ; top:<%=topside%>px" height=<%=height%> width=<%=width%> border="1">
	<tr>
		<th>
			<%=reserver %><br>
			<%=stime %>～<%=ftime %>
			<form action ="/CRS/DetailCtrl" method ="post">
			<input type = "hidden" name="locate" value="<%=locate%>">
			<input type = "hidden" name="stime" value="<%=stime%>">
			<input type='submit' value='詳細'>

			</form>
		</th>
	</tr>
</table>


<%} %>

</div>

<div class="appoint">
<h3>指定した日の詳細を表示</h3>

<form action="/CRS/DayCtrl"	method="post">

<select name="year">
<%=yearchoices %>
</select> 年
<select name="month">
<%=monthchoices %>
</select> 月
<select name="day">
<%=daychoices %>
</select> 日

		<input type="submit" value =詳細>
		</form>

</div>


</div>
</body>
</html>


