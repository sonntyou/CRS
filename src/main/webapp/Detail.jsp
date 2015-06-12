<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.PartReserv" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>詳細</title>
</head>
<body>

<%

PartReserv partreserv =(PartReserv)session.getAttribute("partreserv");

String locate = partreserv.getLocate();
String reserver = partreserv.getReserver();
String title = partreserv.getTitle();
String date = partreserv.getDate();
String stime = partreserv.getStime();
String ftime = partreserv.getFtime();

if(locate.equals("1")){
	locate = "会議室";
}else if(locate.equals("2")){
	locate = "応接室";
}else if(locate.equals("3")){
	locate = "リフレッシュルーム";
}

%>

タイトル：<%=title %><br>
予約者：<%=reserver %><br>
場所：<%=locate %><br>
開始時間：<%=stime %><br>
終了時間：<%=ftime %><br>

<form action ="/CRS/DeleteCtrl" method ="post">
	パスワード：<input type="password" name="password">
	<input type="submit" value =削除>
</form>


</body>
</html>