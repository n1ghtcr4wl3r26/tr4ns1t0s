<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
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
<script language="JavaScript" type="text/JavaScript" src="js/ReporteActa.js"></script>

<%
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );

  String sTitulo = "";
  switch( cs.getOpcion() )
  {
    case Ctte.erActa:
      sTitulo = "Detalle de Transitos No Arribados";
      break;
    case Ctte.erFueraPlazo:
      sTitulo = "Detalle de Transitos Fuera de Plazo";
      break;
  }
%>

<html:form action="/ReporteAction" target="_blank" onsubmit="return fEvalua();">
  <table width="50%" border="0" cellpadding="2" cellspacing="0">
    <tr><td class="t14"><%=sTitulo%></td></tr>
  </table>
  <table width="50%" border="0" cellpadding="4" cellspacing="1" class="marco" id="a">
    <tr>
      <th>Identificaci&oacute;n Empresa (NIT)</th>
      <td><html:text property="nit" maxlength="13" size="18"/></td>
    </tr>
    <tr>
      <th>Medio de Transporte (Placa)</th>
      <td><html:text property="p_medio" maxlength="10" size="12" onblur="this.value = this.value.toUpperCase();" /></td>
    </tr>
    <tr>
    
        <th>Aduana de Partida</th>
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
      <th>Aduana de Destino</th>
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
      <td colspan="2" align="center">
        <html:submit property="opcion" value="Procesar"/>
      </td>
    </tr>
  </table>
</html:form>