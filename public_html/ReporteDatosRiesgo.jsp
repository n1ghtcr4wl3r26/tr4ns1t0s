<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="Main.*, Reporte.*, Transito.*"%>
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


<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/ReporteRiesgo.js"></script>

<script language="JavaScript" type="text/JavaScript" src="js/jquery.js"></script>
<script type="text/JavaScript">

$(document).ready(function(){


});
</script>
<html:form action="/ReporteAction" onsubmit="return validarep();" target="_blank" focus="i_aduana">
  <table width="75%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><td class="t14">Control de Riesgos</td></tr>
  </table>

  <table  width="75%" border="0" cellpadding="2" cellspacing="1" class="marco" id="a" align="center">
    <tr>
      <th>Código Aduana Registro: </th>
      <td>
       <html:select property="i_aduana">
<html:option value="%">&lt;-- Todas las Aduanas --&gt;</html:option>
<%ClaseSql sql = new ClaseSql();
  try {
    sql.getConexion();
    String sCadena = "SELECT cuo_cod, cuo_nam FROM ops$asy.uncuotab WHERE lst_ope = 'U' AND NOT cuo_cod IN ('CUO01', 'ALL') ORDER BY cuo_cod";
    ResultSet rs = sql.st.executeQuery( sCadena );
    if ( ! (rs == null || !rs.next()) ) {
      do{   %>
<html:option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>: <%=rs.getString(2)%></html:option>
<%      }while( rs.next() );
    }
  } catch (Exception er)  {
    er.printStackTrace();
  } 
  finally  {
    sql.getClose();
  }
%>
        </html:select>     
      
      </td>
    </tr>
    
    <tr>
      <th>Fecha de Registro de Manifiesto - desde (dd/mm/aaaa):</th>
      <td><html:text property="i_fecha"/></td>
    </tr>
    <tr>
      <th>Fecha de Registro de Manifiesto - hasta (dd/mm/aaaa):</th>
      <td><html:text property="d_fecha"/></td>
    </tr>
    <tr><th>NIT Consignatario:</th><td><html:text property="empresa"/></td></tr>
    <tr><th>NIT Empresa Transporte:</th><td><html:text property="transporte"/></td></tr>
    <tr><th>Placa:</th><td><html:text property="placa"/></td></tr>
    <tr><th>Ch&oacute;fer:</th><td><html:text property="chofer"/></td></tr>
    <tr><th>Proveedor:</th><td><html:text property="proveedor"/></td></tr>
    <tr><th>Documento de Embarque:</th><td><html:text property="remitente"/></td></tr>
    <tr>
      <td></td>
    </tr>
    <tr>
      <td colspan="2"  align="center">
      
      <table><tr><td> <html:submit property="boton" value="Procesar" onclick="" /></td>
      <td> &nbsp;</td>
      <td><html:submit property="boton" value="Exportar a Excel" onclick="" /></td></tr></table>
        
      </td>
      
      
      
    </tr>
  </table>
</html:form>