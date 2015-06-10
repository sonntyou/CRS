<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.ReservContents,java.util.List" %>
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
	width: 1000px;
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

.appoint{
	height:200px;
	width:300px;
	clear:left;
	 padding: 30px;
  color: white;
  background-color: #FFFF33;
  padding: 15px;
  margin-bottom: 10px;
	border-right: 1px solid #dddddd;

}

.dayreserv{
	float:right;
	padding: 30px;
  color: black;
  background-color: #330099;
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

	int leftref = 638;
	int topref= 134;

List<ReservContents> reservlist = (List<ReservContents>)session.getAttribute("reservlist");
int size = reservlist.size();

	%>

<HR align="left" width=500>

<div class="reservform">

	フォームたちが入ります。<br>
	フォームたちが入ります。<br>
	フォームたちが入ります。<br>
	フォームたちが入ります。<br>
	フォームたちが入ります。<br>
	フォームたちが入ります。<br>
	フォームたちが入ります。<br>
	フォームたちが入ります。<br>
	フォームたちが入ります。<br>
	フォームたちが入ります。<br>

</div>

<div class="appoint">

日付を指定するフォームはります。

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



<table class="reserv" style ="position:relative; left:<%=leftside%>px ; top:<%=topside%>px" height=<%=height%> width=<%=width%> border="1">
	<tr>
		<th>
			<a href="http://localhost:8080/CRS/MainCtrl"><%=reserver %></a><br>
			<%=stime %>～<%=ftime %>
		</th>
	</tr>
</table>


<%} %>

</div>


</div>
</body>
</html>


