<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.Judge"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
Judge judge =(Judge)request.getAttribute("judge");
int intjudge =judge.getJudge();
%>
<% if(intjudge==0){%>
エラーはありません。
<%}else if(intjudge==1){ %>
パスワードが不正です。
<%}else if(intjudge==2){ %>
名前が空欄です。
<%}else if(intjudge==3){ %>
予約が重なっています、場所か時間を改めてください。
<%}else if(intjudge==4){ %>
削除されました。
<%}else if(intjudge==5){ %>
予約が完了しました。
<%}else if(intjudge==6){ %>
時間が不正です。
<%}else if(intjudge==7){ %>
INSERTが正しく行われませんでした。
<%}else if(intjudge==8){ %>
SQLExceptionがキャッチされました。
<%}else if(intjudge==9){ %>
ClassNotFoundExceptionがキャッチされました。
<%}else if(intjudge==10){ %>
データベースが正しく閉じられませんでした。
<%}else if(intjudge==11){ %>
削除が行われませんでした。
<%} %>

</body>
</html>