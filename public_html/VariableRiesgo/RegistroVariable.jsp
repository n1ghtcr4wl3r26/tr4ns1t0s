<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="Main.*,Transito.*,VariableRiesgo.*"%>
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
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>

<%
  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" ); 
  VariableRiesgoForm bean = (VariableRiesgoForm)request.getAttribute("VariableRiesgoForm");   
%>
<style type="text">
#msgalert{
	width:90%; 
	border:1px solid #FF0; 
	background-color:#FFC; 
	padding:10px; 
	color:#6A4800; 
	margin-top:10px; 
	margin-bottom:10px;
	}
#msgerror{
	width:90%; 
	border:1px solid #900; 
	background-color:#FF9797; 
	padding:10px; 
	color:#300039; 
	margin-top:10px; 
	margin-bottom:10px;	
	}
#msginfo{
	width:90%; 
	border:1px solid #069; 
	background-color:#7DD5FF; 
	padding:10px; 
	color:#002435; 
	margin-top:10px; 
	margin-bottom:10px;
	}
</style>
<script language="JavaScript" type="text/javascript" >
  $(document).ready(function () {   
  });
    
  function consultar(valor) {
  if(valor == 1) {
      $('#boton').val('consultar');
  }
  
  if(valor == 2) {
     $('#boton').val('consultar2');
  }
  
  if(valor == 3) {
     $('#boton').val('consultar3');
  }
  
      document.VariableRiesgoForm.submit();
  };
  
  function deshabilitar(v_tipo, v_valor) {
    var Mensaje = "";
    var f = document.forms["VariableRiesgoForm"];
    f.ptipo_variable.value = v_tipo;
    f.pvalor.value = v_valor;
    
      if( Mensaje == "" )
      {
        $('#boton').val('deshabilitar');
        document.VariableRiesgoForm.submit();
      }
      else
      {
        alert( Mensaje );
        return false;
      }
      
       
  };
  
  function habilitar(v_tipo, v_valor) {
    var Mensaje = "";
    var f = document.forms["VariableRiesgoForm"];
    f.ptipo_variable.value = v_tipo;
    f.pvalor.value = v_valor;
    
      if( Mensaje == "" )
      {
        $('#boton').val('habilitar');
        document.VariableRiesgoForm.submit();
      }
      else
      {
        alert( Mensaje );
        return false;
      }
      
       
  };
  
  
</script>
<%
try
{
    if(!(bean.getMensaje()== null))
    {
        if(!(bean.getMensaje()==""))
        {
        %><center>
            <%=bean.getMensaje()%>
        </center><%
        }
    }
}
catch(Exception ex)
{
}
%>

<html:form action="/VariableRiesgo" focus="gestion">
    <input type="hidden" name="boton" id="boton"/>
    <input type="hidden" name="ptipo_variable" id="ptipo_variable"/>
    <input type="hidden" name="pvalor" id="pboton"/>
    <html:hidden property="sw_consultar"/>
    <html:hidden property="sw_listar"/>

    
     <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
        <caption>
            .:
            <%=cs.getSetapa()%>
        </caption>         
        <tr>
            <th class="c1" colspan="2">Registrar Variable de Riesgo - jgjfkdgjkldfg</th>
        </tr>         
        <tr>
            <th>Tipo Variable:</th>
            <td>
                <html:select property="tipo_variable">
                    <html:option value="%">&lt;-- Todas las Variables --&gt;</html:option>
                    <html:option value="NIT">NIT</html:option>
                    <html:option value="PLACA">PLACA</html:option>
                    <html:option value="REMITENTE">REMITENTE</html:option>
                    <html:option value="ORIGEN">ORIGEN</html:option>
                    <html:option value="CONSIGNATARIO">CONSIGNATARIO</html:option>
                    <html:option value="CARTA_PORTE">NUMERO CARTA PORTE</html:option>
                </html:select>
            </td>
            </tr>
            
        <tr>
            <th>Valor:</th>
            <td>
                <html:text property="valor" maxlength="30" size="10"/>
            </td>
        </tr>
        <tr>
            <td class="C" colspan="2">
                <input type="button" value="Consultar" name="boton" onclick="consultar(3)"></input>
            </td>
        </tr>
    </table>
 
 
 
 
    

</html:form>