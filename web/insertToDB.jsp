
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    //field values retrieval from server to client
    String username = request.getParameter("username");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    //Connect to DB
    Connection con = MyUtils.getSiteDBconnection(application, "db\\siteDB.mdb");
    Statement stmt = con.createStatement();

    //o יצירת שאילתת בחירה למסד לצורך בדיקת קיום המשתמש
    String sql = "SELECT * FROM users WHERE username='" + username + "'";
    ResultSet rs = stmt.executeQuery(sql);

    //check if the un exists
    if (rs.next()) {
        out.print("<center><h3>Registration unsuccessful</h3></center><br>");
    } else {
        sql = "INSERT INTO users(username, gender, email, password) VALUES('"
                + username + "','" + gender + "','" + email + "','" + password + "')";
        stmt.executeUpdate(sql);
        out.print("<center><h4>(" + username + "','" + gender + "','" + email + "','" + password + "')</h4></center>");
//        out.print("<center><h3>Registration successful</h3></center><br>");
    }
    //End connection with DB
    stmt.close();
    con.close();
%>
