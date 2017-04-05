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
    <link href="css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
    <title>Tr@nsitos</title>
  </head>
<body bgcolor="#F5F9FD">
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>Registro de Actas de Intervención (JUDIS)</th></tr>
  </table>
<%ClaseSql sql = new ClaseSql();
  int i = -1;
  String msg = "", empresa = "", medio = "";

  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");
	ReporteForm bReporte = ( ReporteForm ) request.getAttribute( "ReporteForm" );

  try
  {
    sql.getConexion();

    CallableStatement call = null;
    call = sql.cn.prepareCall( "{? = call PKG_ACTA.reporte_acta( ?,?,?,? ) }" );
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    if( bReporte.getNit().equals("") )
      call.setString( 2, "%" );
    else
      call.setString( 2, bReporte.getNit() );

    if( bReporte.getP_medio().equals("") )
      call.setString( 3, "%" );
    else
      call.setString( 3, bReporte.getP_medio() );

    if( bReporte.getI_aduana().equals("") )
      call.setString( 4, "%" );
    else
      call.setString( 4, bReporte.getI_aduana() );

    if( bReporte.getD_aduana().equals("") )
      call.setString( 5, "%" );
    else
      call.setString( 5, bReporte.getD_aduana() );
    
    call.execute();
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c" class="marco">
  <tr>
    <th rowspan="2">Nº Tránsito</th>
    <th rowspan="2">Empresa de Trasnporte</th>
    <th rowspan="2">Medio</th>
    <th colspan="2">Partida</th>
    <th colspan="2">Estimada</th>
    <th colspan="2">Destino</th>
    <th colspan="2">Retraso</th>
    <th rowspan="2">Acta (JUDIS)</th>
    <th rowspan="2">Loc.</th>
    <th rowspan="2">Resolución</th>
  </tr>
  <tr>
    <th>Aduana</th>
    <th>Fecha</th>
    <th>Aduana</th>
    <th>Fecha</th>
    <th>Aduana</th>
    <th>Fecha</th>
    <th>Día</th>
    <th>Hora</th>
  </tr>
<%
  ResultSet rs = ( ResultSet ) call.getObject( 1 );
  if( ! ( rs == null || !rs.next() ) ) {
    do {
      if( i != rs.getInt( 15 ) ) {
        i = rs.getInt( 15 );
        switch( rs.getInt( 15 ) ) {
          case 0:
            msg = "Tienen Acta de Intervención la Empresa y Medio";
            empresa = rs.getString( 2 ) + ": " + rs.getString( 3 );
            medio = rs.getString( 4 );
            break;
          case 1:
            msg = "Tiene Acta de Intervención la Empresa";
            empresa = rs.getString( 2 ) + ": " + rs.getString( 3 );
            medio = "&nbsp;";
            break;
          case 2:
            msg = "Tiene Acta de Intervención el Medio";
            empresa = "&nbsp;";
            medio = rs.getString( 4 );
            break;
        }
%>
  <tr><th colspan="14"><%= msg %></th></tr>
<%
    }
    switch( i ) {
      case 0:
        empresa = rs.getString( 2 ) + ": " + rs.getString( 3 );
        medio = rs.getString( 4 );
        break;
      case 1:
        empresa = rs.getString( 2 ) + ": " + rs.getString( 3 );
        medio = "&nbsp;";
        break;
      case 2:
        empresa = "&nbsp;";
        medio = rs.getString( 4 );
        break;
    }   
      
%>
  <tr>
    <td><%=rs.getString( 1 ) %></td>
    <td><%= empresa %></td>
    <td><%= medio %></td>
    <td><%=rs.getString( 5 ) %></td>
    <td><%=rs.getString( 6 ) %></td>
    <td><%=rs.getString( 7 ) %></td>
    <td><%=rs.getString( 8 ) %></td>
    <td><%=rs.getString( 9 ) %></td>
    <td><%=rs.getString( 10 ) %></td>
    <td><%=rs.getString( 11 ) %></td>
    <td><%=rs.getString( 12 ) %></td>
    <td><%=rs.getString( 13 ) %></td>
    <td><%=rs.getString( 14 ) %></td>
    <td><%=rs.getString( 16 ) %></td>    
  </tr>
<%
    }while( rs.next() );
  }
%>
  </table>
  Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %>
<%} catch (Exception er)  {
    er.printStackTrace();
  } 
  finally  {
    sql.getClose();
  }
%>
</body>
</html:html>