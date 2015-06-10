<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <link rel="StyleSheet" href="/CRS/src/main/webapp/Top.css" type="text/css">  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会議室予約システム</title>

<style type="text/css">

.time {
	border-style:none;
	text-align:right
}

.memori0{
	 border-style:none;}

.memori{
	border-top:none;
	border-left:none;}

.timetitle {
	color: red;
	border-style:none;
}

.table
{
  border-collapse: collapse;
  border-style:none;
 }


</style>

</head>

<body>

<%
	String reserver = "タクミソ";
	String stime = "12:00";
	String ftime = "15:00";
	String locate = "3";

	//始まりの時間と分
	String convshour=stime.substring(0,2);
	String convsminute=stime.substring(stime.length()-2);

	//終わりの時間と分
	String convfhour=ftime.substring(0,2);
	String convfminute=stime.substring(stime.length()-2);

	//始まりの時間と分をint型に
	int intshour= Integer.parseInt(convshour);
	int intsminute= Integer.parseInt(convsminute);

	//終わりのの時間と分をint型に
	int intfhour= Integer.parseInt(convfhour);
	int intfminute= Integer.parseInt(convfminute);

	//場所をint型に
	int intlocate =Integer.parseInt(locate);

	//左端と右端の値
	int leftside = (intlocate - 1) * 150;

	//上端と下端の値
	int px=60;
	int topside = (intshour-9)*px + intsminute*px/60;
	int height = ((intfhour*60+intfminute)-(intfhour*60+intfhour))*px/60;

	System.out.println(stime + "～" + ftime);

	%>

<!--
 style = "position:absolute; left:${leftside}px;top:${topside}px" height = ${height}
 -->

<table class="reserv" style = "position:absolute; left:${leftside}px;top:${topside}px" border="1">
	<tr>
		<th>
			あうあう
		</th>
	</tr>
</table>

<div align="right">
	<p>${today.today}の予定</p>
	<div align="right">
		<table class="table" border="1" height="">

			<tr>
 				<th class="timetitle" id="time"></th>
 				<th class="memori0"> </th>
 				<th width = "150">会議室</th>
 				<th width = "150">応接室</th>
 				<th width = "150" >リフレッシュ</th>
			</tr>
			<tr>
 				<td class="time"rowspan="2">9:00</td>
 				<td class="memori"></td>
 				<td rowspan="26">
 				</td>
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
</div>
<c:forEach var="reservlist" items="${reservList}">
<HR size="70">
</c:forEach>
<HR width="10">

</body>
</html>