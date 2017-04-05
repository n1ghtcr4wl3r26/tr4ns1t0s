<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="Main.*,Transito.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>error</title>
    </head>
    
<%
  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" ); %>
    <body>
    <div id="msgalert" style="width:90%;border:1px solid #900;background-color:#FF9797;padding:10px;color:#300039;margin-top:10px;margin-bottom:10px">

    <%=cs.getError()%></div></body>
</html>