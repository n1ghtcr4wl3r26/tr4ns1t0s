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
<script language="JavaScript" type="text/JavaScript" src="js/Reporte_TransitosPuerto.js"></script>

<script language="JavaScript" type="text/JavaScript" src="js/jquery.js"></script>

<html:form action="/ReporteAction" onsubmit="return validarep();" focus="i_aduana">
  <table width="75%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><td class="t14">Tránsitos de Puerto</td></tr>
  </table>

  <table  width="75%" border="0" cellpadding="2" cellspacing="1" class="marco" id="a" align="center">
    <tr>
      <th>Código Aduana Partida: </th>
      <td><html:select property="i_aduana">  
<html:option value="%">&lt;-- Todas las Aduanas --&gt;</html:option>
<option value="071">071: Agencia Exterior Matarani</option>
<option value="072">072: Agencia Exterior Arica</option>
<option value="073">073: Agencia Exterior Matarani - Ilo</option>
</html:select>
      </td>
    </tr>
    <tr>
      <th>Código Aduana Destino: </th>
      <td>
      
         <html:select property="d_aduana">
<html:option value="%">&lt;-- Todas las Aduanas --&gt;</html:option>
<%ClaseSql sql2 = new ClaseSql();
  try {
    sql2.getConexion();
    String sCadena = "SELECT cuo_cod, cuo_nam FROM ops$asy.uncuotab WHERE lst_ope = 'U' AND NOT cuo_cod IN ('CUO01', 'ALL') ORDER BY cuo_cod";
    ResultSet rs = sql2.st.executeQuery( sCadena );
    if ( ! (rs == null || !rs.next()) ) {
      do{   %>
<html:option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>: <%=rs.getString(2)%></html:option>
<%      }while( rs.next() );
    }
  } catch (Exception er)  {
    er.printStackTrace();
  } 
  finally  {
    sql2.getClose();
  }
%>
        </html:select>
      
      
      </td>
    </tr>
    <tr>
      <th>Fecha de Asignación Ruta Plazo (dd/mm/aaaa): desde</th>
      <td><html:text property="i_fecha"/></td>
    </tr>
    <tr>
      <th>hasta</th>
      <td><html:text property="d_fecha"/></td>
    </tr>   
    <tr>
      <td></td>
    </tr>
    <tr>
      <td></td>
    </tr>
    <tr>
      <td></td>
    </tr>
    <tr>
      <td></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <html:submit property="boton" value="Procesar" onclick="" />
      </td>
    </tr>
  </table>
</html:form>