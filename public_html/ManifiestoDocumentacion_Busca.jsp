<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Transito.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<script language="JavaScript" type="text/JavaScript" src="js/declaracion_manDocs.js?ran=14"></script>
<script language="JavaScript" type="text/JavaScript" src="js/consultamanifiesto.js?ran=14"></script>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.sql.CallableStatement"%>
<%ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
short op = (Short) request.getSession().getAttribute("opcion");
//short op=0;
java.util.Date date = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
String anio = dateFormat.format(date)+"";
%>
<html:form action="/BuscaManifiestoDocsAction" onsubmit='<%= "return fEvalua("+cs.getOpcion()+");"%>' styleId="frm_man" >
  <div class="box-header with-border">
    <h3 class="box-title">
    <%= op == 53?"CONFIRMACI&Oacute;N REGISTRO MANIFIESTO":"REPORTE DOCUMENTOS SOPORTE MIC"%>
    </h3>
</div>
<BR>
  <table width="100%" border="0">
    <tr align="center">
      <td>
<table class="marco" id="a">
        <tbody>
		<tr>
			<th colspan="4"  class="c1">INFORMACI&Oacute;N MANIFIESTO REGISTRADO</th>
		</tr>	
		<tr>
			<th>&nbsp;</th>
			<td colspan="3"><font size="2px" color="green">gesti&oacute;n / aduana / no. registro</font></td>
		</tr>
		<tr>
			<th>Manifiesto:</th>
			<td><html:hidden property="opcion"/>
                        <html:text property="car_reg_year" maxlength="4" size="5" value="<%= anio%>" onKeyPress="return soloNumeros(event)"  onblur="this.value=this.value.replace(/(^\s*)|(\s*$)/g,'')" /></td>
                        <td> 
                        <html:text property="key_cuo" maxlength="4" size="5" onKeyPress="return soloNumeros(event)"  onblur="this.value=this.value.replace(/(^\s*)|(\s*$)/g,'')" />
                        </td>
                        
                 
                        <td> <html:text maxlength="20" size="10" property="car_reg_nber" onKeyPress="return soloNumeros(event)"  onblur="this.value=this.value.replace(/(^\s*)|(\s*$)/g,'')"/></td>
		</tr>
    <tr>
      <td colspan="4" align="center">
        <html:submit  styleClass="btn btn-primary" value='<%= op == 53?"Procesar":"Buscar"%>'/>&nbsp;&nbsp;
      </td>
    </tr>    
	</tbody>
</table>

            </td>
        </tr>          
        </table>
</html:form>
