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

if(locate == "1"){
	locate = "会議室";
}else if(locate == "2"){
	locate = "応接室";
}else if(locate == "3"){
	locate = "リフレッシュルーム";
}

%>

タイトル：<%=title %><br>
予約者：<%=reserver %><br>
場所：<%=locate %><br>
開始時間：<%=stime %><br>
終了時間：<%=ftime %><br>

</body>
</html>