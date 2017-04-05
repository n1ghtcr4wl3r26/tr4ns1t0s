<%@ page contentType="text/html; charset=UTF-8" language="java" buffer="none" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="oracle.jdbc.pool.OraclePooledConnection"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="Reporte.*, Transito.*, Main.*"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html:html>
  <head>
    <link href="../css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
    <title>Tr@nsitos</title>
  </head>
<body bgcolor="#F5F9FD">
<%ClaseSql sql = new ClaseSql();
  int i = -1;
  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");
	ReporteForm bReporte = ( ReporteForm ) request.getAttribute( "ReporteForm" );

  try {
    sql.getConexion();
    String StrSql = "", linea = "";

    CallableStatement call = null;
    call = sql.cn.prepareCall( "{?=call pkg_ds2295.c_list_partidas(?)}");
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, "2");
    call.execute();
    ResultSet rs = ( ResultSet ) call.getObject( 1 );
    if( ! ( rs == null || !rs.next() ) ) {
%>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>LISTA DE PARTIDAS D.S. 2295</th></tr>
  </table>

  <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c" class="marco">
    <tr>
      <th >Partida</th>
      <th>Descripci&oacute;n</th>
    </tr>
  
<%  
    do {
      if( (i++) % 2 == 0 )
        linea = "tr1";
      else
        linea = "tr2";
%>
    <tr class="<%=linea%>">
      <td><%=rs.getString( 1 ) %></td>
      <td><%=rs.getString( 2 ) %></td>
    </tr>
<%
    }while( rs.next() );
  }
%>
  </table>
  Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %>
<%   
  }
  catch (Exception er)  {
    er.printStackTrace();
  } 
  finally {
    sql.getClose();
  }
%>
</body>
</html:html>