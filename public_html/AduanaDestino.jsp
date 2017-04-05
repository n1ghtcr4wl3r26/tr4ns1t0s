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
<script language="JavaScript" type="text/JavaScript" src="js/aduana.js"></script>

<html:form action="/AduanaDestinoAction" onsubmit="return fEvalua ( );" focus="aduana">
  <table width="50%" border="0" cellpadding="4" cellspacing="1" class="marco" id="a">
    <caption>Seleccione Aduana de Destino</caption>
    <tr>
      <th>Aduana:</th>
      <td>
        <select name="aduana"><option value="">&lt;-- Seleccione Aduana --&gt;</option>
<%
  ClaseSql sql = new ClaseSql();
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );

  try
  {
    sql.getConexion();

    CallableStatement call = null;
    call = sql.cn.prepareCall("{?=call pkg_transito.lista_aduanas(?)}");
    call.registerOutParameter( 1, OracleTypes.CURSOR);
    call.setString( 2, cs.getAduanas());
    call.execute();

    ResultSet fp = ( ResultSet ) call.getObject( 1 );
    if(! (fp==null || !fp.next()) ) {
      do{  %>
        <option value="<%= fp.getString( 1 ) %>"> <%= fp.getString( 1 ) %>: <%= fp.getString( 2 ) %></option>
<%    } while( fp.next() ); }
  }
  catch( Exception e) {
    System.out.println( e.getMessage() );
  }
  finally{
    sql.getClose();
  } %>
        </select>
    </td></tr>
    <tr>
      <td colspan="2" align="center">
        <html:hidden property="opcion"/>
        <html:submit value="Aceptar" onclick="opcion.value=1"/>
        <html:submit value="Cancelar" onclick="opcion.value=2;bCancel=true"/>
      </td>
    </tr>
  </table>
</html:form>