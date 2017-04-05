<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Reporte.*, Transito.*"%>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="oracle.jdbc.pool.OraclePooledConnection"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.text.SimpleDateFormat"%>

<script language="JavaScript" type="text/JavaScript">
<!--
function Boton( aduana, gestion, serial ) {
  f = document.forms["ReporteForm"];
  f.nit.value = aduana;
  f.check1.value = gestion;
  f.check2.value = serial;
  f.submit();
}
-->
</script>
<html:form action="/ReporteAction" target="_blank">
  <html:hidden property="nit"/>
  <html:hidden property="check1"/>
  <html:hidden property="check2"/>
</html:form>
<%TramiteForm bTramite = (TramiteForm) request.getAttribute("TramiteForm");
  ClaseSql sql = new ClaseSql();
  String cadena="", fhoy="";
  try {
    sql.getConexion();
    CallableStatement call = null;
    call = sql.cn.prepareCall("{?=call pkg_transito.reporte_aduana_peso_paso(?,?,?,?)}");
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, bTramite.getAduana() );
    call.setString( 3, bTramite.getGestion() );
    call.setString( 4, bTramite.getRegistro());
    call.setString( 5, bTramite.getSaduana() );
    System.out.print(bTramite.getAduana() + " " + bTramite.getGestion() + " " + bTramite.getRegistro() + " " + bTramite.getSaduana());
    call.execute();   %>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>Reporte de Aduana de Paso "Tambo Quemado"</th></tr>
  </table>
  <table width="100%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
    <tr class="t14">
      <th align="center">Tr&aacute;nsito</th>                    
      <th align="center">Registro de Peso</th>
      <th align="center">Registro Observaciones</th>
      <th align="center">Fecha Inicio de Tr&aacute;nsito</th>
      <th align="center">Fecha Registro Peso</th>
      <th align="center">Fecha Observaci&oacute;n</th>
    </tr> 
<%  ResultSet rs = (ResultSet) call.getObject( 1 );
    int i = 0;
    if( ! ( rs == null || !rs.next() ) ) {
      fhoy=rs.getString("fhoy");
      do{
        cadena = "'" + rs.getString( 1 ) + "', '" + rs.getString( 2 ) + "', " + rs.getString( 3 );
        if( (i++)%2 == 0 ) {
%>
    <tr class="tr1">
<%      } else  {   %>
    <tr>
<%      }  %>
    <td><a href="javascript:Boton(<%= cadena %>)"><%=rs.getString( 1 )%> / <%=rs.getString( 2 )%> - <%=rs.getString( 3 )%></a></td>
    <td><%=rs.getString("registro_peso")%></td>
    <td><%=rs.getString("registro_obs")%></td>
    <td><%=rs.getString("tra_fec_ini")%></td>
    <td><%=rs.getString("mod_reg")%></td>
    <td><%=rs.getString("tra_fec_obs")%></td>
  </tr> 
<%  } while (rs.next());   } %>
  <tr>
    <td colspan="5"><strong>Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= fhoy %></td>
    <td colspan="3">Total : <%=i%></td>
  </tr>
</table>
<%   
  } catch (Exception er)  {
    er.printStackTrace();
  } 
  finally {
    sql.getClose();
  }
%>
</body>