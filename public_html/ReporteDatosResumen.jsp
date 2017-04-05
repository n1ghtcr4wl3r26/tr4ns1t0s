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
<script language="JavaScript" type="text/JavaScript" src="js/ReporteResumen.js"></script>

<script language="JavaScript" type="text/JavaScript" src="js/jquery.js"></script>
<script type="text/JavaScript">

$(document).ready(function(){

$("#check6").click(function() {
    if($("#check6").is(':checked')){
        $("#checko").hide();
        $("#checka").hide();
    }else
    {
        $("#checko").show();
        $("#checka").show();
    }
});


});
</script>
<html:form action="/ReporteAction" onsubmit="return validarep();" focus="i_aduana">
  <table width="75%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><td class="t14">Tránsito por Estados</td></tr>
  </table>

  <table  width="75%" border="0" cellpadding="2" cellspacing="1" class="marco" id="a" align="center">
    <tr>
      <th>Código Aduana Partida: </th>
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
      <th>Fecha de Partida de Inicio (dd/mm/aaaa):</th>
      <td><html:text property="i_fecha"/></td>
    </tr>
    <tr>
      <th>Fecha de Partida de Finalización (dd/mm/aaaa):</th>
      <td><html:text property="d_fecha"/></td>
    </tr>
    <tr>
      <th rowspan="5">Estado:</th>
      <td>
      

      
      <div id="checkb">
      <html:checkbox property="check6" styleId="check6">Con Parte de Recepción</html:checkbox>
      </div>
      <div id="checko">
      <html:checkbox property="check1" styleId="check1">Concluido con localización</html:checkbox><br/>
      <html:checkbox property="check2" styleId="check2">Concluido sin localización</html:checkbox><br/>
      <html:checkbox property="check3" styleId="check3">En tránsito fuera del plazo</html:checkbox><br/>
      <html:checkbox property="check4" styleId="check4">En tránsito en plazo</html:checkbox><br/>
      <html:checkbox property="check5" styleId="check5">Cancelados</html:checkbox>
      </div>
      </td>
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