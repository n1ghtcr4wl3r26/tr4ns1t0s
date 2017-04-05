<%@ page contentType="text/html; charset=UTF-8" language="java" buffer="none" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="oracle.jdbc.pool.OraclePooledConnection"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="Transito.*, Main.*"%>
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
<body  bgcolor="#F5F9FD">
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>Bitácora</th></tr>
  </table>
<%ClaseSql sql = new ClaseSql();
  int i = 0;
  String msg = "";
  String StrSql = "";
  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");
  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" );

  try {
    sql.getConexion();
%>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center" id="a">
    <tr>
      <th width="50%">Número de Manifiesto:</th>
      <td><%= cs.getKey_year() %> / <%= cs.getKey_cuo() %> - <%= cs.getKey_nber() %></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c">
  <tr>
    <th rowspan="3">#</th>
    <th>Partida</th>
    <th>Estimada</th>
    <th>Destino</th>
    <th rowspan="3">Precintos</th>
    <th rowspan="3">Tipo de Cierre</th>
    <th rowspan="3">Observación</th>
    <th rowspan="3">Loc.</th>
    <th rowspan="3">Ver.</th>
    <th>Registro</th>
  </tr>
  <tr>
    <th>Aduana</th>
    <th>Aduana</th>
    <th>Aduana</th>
    <th>Usuario</th>
  </tr>
  <tr>
    <th>Fecha</th>
    <th>Fecha</th>
    <th>Fecha</th>
    <th>Fecha</th>
  </tr>
<%
        CallableStatement call = null;
        call = sql.cn.prepareCall("{ ? = call pkg_transito.consulta_bitacora( ?, ?, ? ) }");
        call.registerOutParameter( 1, OracleTypes.CURSOR );
        call.setString( 2, cs.getKey_cuo() );
        call.setString( 3, cs.getKey_year() );
        call.setString( 4, cs.getKey_nber() );
        call.execute();

        ResultSet rs = ( ResultSet ) call.getObject( 1 );
        if( ! ( rs == null || !rs.next() ) ) {
          do{
if( (i++) % 2 == 0 )
  StrSql = "tr1";
else
  StrSql = "tr2";
%>
    <tr class="<%=StrSql%>">
      <td rowspan="2"><%=rs.getInt( 1 ) %></td>
      <td><%=rs.getString( 2 ) %></td>
      <td><%=rs.getString( 4 ) %></td>
      <td><%=rs.getString( 7 ) %></td>
      <td rowspan="2"><%=rs.getString( 6 ) %></td>
      <td rowspan="2"><%=rs.getString( 9 ) %></td>
      <td rowspan="2"><%=rs.getString( 10 ) %></td>
      <td rowspan="2"><%=rs.getString( 11 ) %></td>
      <td rowspan="2"><%=rs.getString( 12 ) %></td>
      <td><%=rs.getString( 13 ) %></td>
    </tr>
    <tr class="<%=StrSql%>">
      <td><%=rs.getString( 3 ) %></td>
      <td><%=rs.getString( 5 ) %></td>
      <td><%=rs.getString( 8 ) %></td>
      <td><%=rs.getString( 14 ) %></td>
    </tr>
<%        } while( rs.next() );  } %>
    <tr>
      <td colspan="10">Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %></td>
    </tr>
  </table>
<%   
  }
  catch (Exception er)  {
    er.printStackTrace();
  } 
  finally  {
    sql.getClose();
  }
%>
</body>
</html:html>