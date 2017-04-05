<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Reporte.*, Transito.*"%>

<html:html>
  <head>
    <link href="css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
    <title>Tr@nsitos</title>
  </head>
<body bgcolor="#F5F9FD">

<script>
function fEvalua( )
{
  f = document.forms[0];
  var mascara = new RegExp("^[0-9]{3,20}$","g");
  if( mascara.test( f.nit.value ) )
    return true;
  alert('La Identificación Empresa (NIT) ingresado no es valido o tiene valores que no son correcto');
  return false;
}
</script>

<%
  request.getSession().removeAttribute( "ClaseSession" );
%>
<table width="100%" height="100%" border="0" style="margin:0 auto">
  <tr align="center" valign="middle"><td>
  <html:form action="/ReporteAction" onsubmit="return fEvalua();" focus="nit">
    <table width="50%" border="0" cellpadding="2" cellspacing="0">
      <tr><td class="t14">Reporte de Tránsitos Fuera de Plazo</td></tr>
    </table>
    <table width="50%" border="0" cellpadding="4" cellspacing="1" class="marco" id="a">
      <tr>
        <th>Identificación Empresa (NIT)</th>
        <td><html:text property="nit" maxlength="13" size="18"/></td>
      </tr>
      <tr>
        <th colspan="2" align="center"><html:submit value="Procesar"/></th>
      </tr>
    </table>
  </html:form>
  </td></tr>
</table>

</body>
</html:html>