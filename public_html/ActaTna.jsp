<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Transito.*"%>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.sql.CallableStatement"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/ActaTna.js"></script>

<%
 // String Aduana = "";
	//AduanaDestinoForm bDestino = ( AduanaDestinoForm ) request.getAttribute( "AduanaDestinoForm" );
        //ActaTnaForm acta = (ActaTnaForm)request.getAttribute("ActaTnaForm"); 
        /*
        
  if( bDestino != null ){
      if(bDestino.getAduana() != null) {
            Aduana = bDestino.getAduana();
            acta.setAduana(bDestino.getAduana());
      }
      else{
            //Aduana = acta.getAduana();
            Aduana = bDestino.getAduana();
      }
  }*/
%>

<html:form action="/ActaTnaAction" onsubmit="return fEvalua ( );">
  <table width="100%" border="0" cellpadding="3" cellspacing="0">
    <tr>
      <td class="t14">Registro de Actas de Intervenci&oacute;n</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="marco" id="c">
    <tr>
      <th rowspan="2">Nro.</th>
      <th colspan="2">Tr&aacute;nsito</th>
      <th colspan="2">Partida</th>
      <th colspan="2">Llegada Estimada</th>
      <th rowspan="2">Empresa Transportista</th>
      <th rowspan="2">Placa</th>
      <th colspan="2">Retraso</th>
      <th rowspan="2">Acta de Intervenci&oacute;n</th>
    </tr>
    <tr>
      <th>N&uacute;mero</th>
      <th>&Iacute;tem</th>
      <th>Aduana</th>
      <th>Fecha</th>
      <th>Aduana</th>
      <th>Fecha</th>
      <th>D&iacute;as</th>
      <th>Horas</th>
    </tr>
<%  ClaseSql sql = new ClaseSql();
    ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
    ActaTnaForm bActa = (ActaTnaForm) request.getSession().getAttribute( "ActaTnaForm" );

    try {
      sql.getConexion();
      CallableStatement call = null;
      call = sql.cn.prepareCall( "{? = call PKG_ACTA.consulta_acta( ? ) }" );
      call.registerOutParameter( 1, OracleTypes.CURSOR );
      call.setString( 2, bActa.getAduana() );
      call.execute();

      ResultSet rs = ( ResultSet ) call.getObject( 1 );
      if( ! ( rs == null || !rs.next() ) ) {
        String acceso = "";
        int i = 0;
        int j = -1;
        ClaseLista a = null;
        bActa.setLista( rs.getInt( 12 ) );
        do {
          a = new ClaseLista( rs.getString( 1 ) + ";" + rs.getString( 2 ) + ";" + rs.getString( 3 ) + ";" + rs.getString( 4 ), rs.getString( 5 ) + ";" + rs.getString( 7 ), "", "" );
          bActa.setLista( a, i );
          acceso = "lista[" + i++ + "].acceso";
          j++;
          if( j % 2 == 0 )  {  %>
    <tr>
<%        } else {  %>
    <tr class="tr1">
<%        }  %>
      <td><%= i %></td>
      <td><%= rs.getString( 2 ) %> / <%=rs.getString( 1 ) %> - <%=rs.getString( 3 )%></td>
      <td><%=rs.getString( 4 )%></td>
      <td><%=rs.getString( 8 ) %></td>
      <td><%=rs.getString( 9 ) %></td>
      <td><%=rs.getString( 10 ) %></td>
      <td><%=rs.getString( 11 ) %></td>
      <td><%=rs.getString( 5 ) %>: <%=rs.getString( 6 ) %></td>
      <td><%=rs.getString( 7 ) %></td>
      <td><%=rs.getString( 13 ) %></td>
      <td><%=rs.getString( 14 ) %></td>
      <td><input type="text" name="<%= acceso %>" maxlength="25" size="25"></td>
    </tr>
<%      }while( rs.next() );
      }
    } catch( Exception e ) {
      e.getMessage();
    }
    finally {
      sql.getClose();
    } %>
  </table>
  <html:hidden property="opcion"/>
  <html:hidden property="placa"/>
  <html:hidden property="aduana"/>
  <html:submit value="Aceptar" onclick="opcion.value=1"/>
  <html:submit value="Cancelar" onclick="opcion.value=2;bCancel=true"/>
</html:form>