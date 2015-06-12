<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.ReservContents,java.util.List,
java.util.Map,
java.util.HashMap,
java.time.LocalDate,
java.time.YearMonth,
java.time.format.DateTimeFormatter,
model.Today,
model.DetailJudge"
 %>
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
${timechoices.yearchoices}
</select> 年
<select name="month">
${timechoices.monthchoices }
</select> 月
<select name="day">
${timechoices.daychoices }
</select> 日
<select name="shour">
${timechoices.hourchoices }
</select> 時
<select name="sminute">
${timechoices.minutechoices}
</select> 分<br>

終了時間：
<select name="fhour">
${timechoices.hourchoices}
</select> 時
<select name="fminute">
${timechoices.minutechoices}
</select> 分<br>

	パスワード：<input type="password" name="password" value="0000">
	*パスワードの初期値は[0000]です
	<input type="submit" value =予約>
</form>

</div>

<!-- エラー表示を動的インクルード -->

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
${timechoices.yearchoices}
</select> 年
<select name="month">
${timechoices.monthchoices}
</select> 月
<select name="day">
${timechoices.daychoices}
</select> 日

		<input type="submit" value =詳細>
		</form>

</div>

<div>

<%
DetailJudge detailjudge =(DetailJudge)session.getAttribute("detailjudge");

if(detailjudge.isDetailjudge()){ %>

<%@ include file="Detail.jsp" %>

<%}else{ %>

ここには予定の詳細が表示されます。

<%} %>

</div>


</div>
</body>
</html>


