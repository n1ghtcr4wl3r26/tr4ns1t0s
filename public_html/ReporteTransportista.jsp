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
<%ClaseSql sql = new ClaseSql();
  int i = -1;
  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");
	ReporteForm bReporte = ( ReporteForm ) request.getAttribute( "ReporteForm" );

  try {
    sql.getConexion();

    String StrSql = "", linea = "";
    CallableStatement call = null;
    call = sql.cn.prepareCall( "{? = call pkg_transito.consulta_transportista( ? ) }" );
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, bReporte.getNit() );
    call.execute();
    ResultSet rs = ( ResultSet ) call.getObject( 1 );
    if( ! ( rs == null || !rs.next() ) ) { %>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>Empresa de Transporte: <%= rs.getString( 2 ) %> - <%= rs.getString( 3 ) %></th></tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c" class="marco">
    <tr>
      <th rowspan="2">Nº Tránsito</th>
      <th rowspan="2">Medio</th>
      <th colspan="2">Partida</th>
      <th colspan="2">Estimada</th>
      <th colspan="2">Destino</th>
      <th colspan="2">Retraso</th>
      <th rowspan="2">Estado</th>
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
<%  do {
      String fecha = "", hora = "";
      if ( rs.getInt( 13 ) == 1 ) {
        StrSql ="Concluido";
      } else {
        fecha = rs.getString( 11 );
        hora = rs.getString( 12 );
        if( rs.getInt( 13 ) == 0 ) {
          StrSql ="Sin localizaci&oacute;n";
        } else {
          if ( rs.getInt( 12 ) <= 0 )
            StrSql ="En tr&aacute;nsito";
          else
            StrSql ="Fuera de Plazo";
        }
      }

      if( (i++) % 2 == 0 )
        linea = "tr1";
      else
        linea = "tr2";
%>
    <tr class="<%=linea%>">
      <td><%=rs.getString( 1 ) %></td>
      <td><%=rs.getString( 4 ) %></td>
      <td><%=rs.getString( 5 ) %></td>
      <td><%=rs.getString( 6 ) %></td>
      <td><%=rs.getString( 7 ) %></td>
      <td><%=rs.getString( 8 ) %></td>
      <td><%=rs.getString( 9 ) %></td>
      <td><%=rs.getString( 10 ) %></td>
      <td><%=rs.getString( 11 ) %></td>
      <td><%=rs.getString( 12 ) %></td>
      <td><%= StrSql %></td>
    </tr>
<%
    }while( rs.next() );
  } else {  %>
    No existe ningún vehículo con la Identificación Empresa (NIT) ingresado<br>
<%} %>
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