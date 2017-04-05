<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
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
<script language="JavaScript" type="text/JavaScript" src="js/HabilitaEmpresa.js"></script>

<%
  String Aduana = "";
	AduanaDestinoForm bDestino = ( AduanaDestinoForm ) request.getAttribute( "AduanaDestinoForm" );
  if( bDestino != null )
    Aduana = bDestino.getAduana();
%>

<html:form action="/HabilitaEmpresaAction" onsubmit="return fEvalua ( );">
  <table width="100%" border="0" cellpadding="3" cellspacing="0">
    <tr>
      <td class="t14">Habilitaci&oacute;n de Empresas de Transporte</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="marco" id="c">
    <tr>
      <th>N&uacute;mero de Tr&aacute;nsito</th>
      <th>&Iacute;tem</th></th>
      <th>Empresa Transportista</th>
      <th>Placa</th>
      <th>Acta de Intervenci&oacute;n</th>
      <th>Fecha de Registro</th>
      <th>Observaci&oacute;n</th>
    </tr>
<%  ClaseSql sql = new ClaseSql();
    ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
    ActaTnaForm bActa = (ActaTnaForm) request.getSession().getAttribute( "ActaTnaForm" );
    try {
      sql.getConexion();
      CallableStatement call = null;
      call = sql.cn.prepareCall( "{? = call PKG_ACTA.consulta_empresas( ? ) }" );
      call.registerOutParameter( 1, OracleTypes.CURSOR );
      call.setString( 2, Aduana );
      call.execute();

      ResultSet rs = ( ResultSet ) call.getObject( 1 );
      if( ! ( rs == null || !rs.next() ) ) {
        String acceso = "";
        int i = 0;
        int j = -1;
        ClaseLista a = null;
        bActa.setLista( rs.getInt( 10 ) );
        do {
          a = new ClaseLista( rs.getString( 1 ) + ";" + rs.getString( 2 ) + ";" + rs.getString( 3 ) + ";" + rs.getString( 4 ), rs.getString( 5 ) + ";" + rs.getString( 7 ), "", "" );
          bActa.setLista( a, i );
          acceso = "lista[" + i++ + "].acceso";
          j++;
          if( j % 2 == 0 )  {
%>
    <tr>
<%
          } else {
%>
    <tr class="tr1">
<%        }  %>
      <td><%= rs.getString( 2 ) %> / <%=rs.getString( 1 ) %> - <%=rs.getString( 3 )%></td>
      <td><%=rs.getString( 4 ) %></td>
      <td><%=rs.getString( 5 ) %>: <%=rs.getString( 6 ) %></td>
      <td><%=rs.getString( 7 ) %></td>
      <td><%=rs.getString( 8 ) %></td>
      <td><%=rs.getString( 9 ) %></td>
      <td><input type="text" name="<%= acceso %>" maxlength="100" size="50"></td>
    </tr>
<%      }while( rs.next() );
      }
    }
    catch( Exception e ) {
      e.getMessage();
    }
    finally {
      sql.getClose();
    }
%>
  </table>
  <html:hidden property="opcion"/>
  <html:hidden property="placa"/>
  <html:submit value="Aceptar" onclick="opcion.value=1"/>
  <html:submit value="Cancelar" onclick="opcion.value=2;bCancel=true"/>
</html:form>