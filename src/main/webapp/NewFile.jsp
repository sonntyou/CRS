<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DbConTest</title>
</head>
<body>
<%@
page
import= "java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.SQLException,java.sql.Statement"

%>

<%
	int count = 0;
int id;
String name;
try {
    // JDBCドライバの登録
    String driver = "org.postgresql.Driver";
    // データベースの指定
    String server   = "localhost:5432";   // PostgreSQL サーバ ( IP または ホスト名 )
    String dbname   = "";         // データベース名
    String url = "jdbc:postgresql://" + server + "/" + dbname;
    String user     = "postgres";         //データベース作成ユーザ名
    String password = "1714";     //データベース作成ユーザパスワード
    Class.forName (driver);

    count++;
%>


<%=count %>


<p>Hello</p>

<%
	count++;
    // データベースとの接続
    Connection con = DriverManager.getConnection(url, user, password);
    // テーブル照会実行
    Statement stmt = con.createStatement ();
    String sql = "SELECT * FROM testtbl";
    ResultSet rs = stmt.executeQuery (sql);
    // テーブル照会結果を出力
    while(rs.next()){
       id = rs.getInt("num");
       name = rs.getString("name");
       System.out.println("ID：" + id);
       System.out.println("名前：" + name);
    }
%>

<%=count %>

<%
    // データベースのクローズ
    rs.close();
    stmt.close();
    con.close();
} catch (SQLException e) {
    System.err.println("SQL failed.");
    e.printStackTrace ();
} catch (ClassNotFoundException ex) {
    ex.printStackTrace ();
}

%>
<p>World!</p>

</body>
</html>