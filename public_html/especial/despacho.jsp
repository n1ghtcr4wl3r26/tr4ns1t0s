<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<script language="JavaScript" type="text/JavaScript" src="js/despacho.js" charset="UTF-8"></script>
<html:form action="/DespachoAction">
<html:hidden property="gestion"/><html:hidden property="aduana"/><html:hidden property="registro"/><html:hidden property="opcion"/>
<div style="width:420px;">
  <ul id="tabs">
    <li><a href="#" onClick="pm(this)">Declaración Unica de Importación</a></li>
    <li><a href="#" onClick="pm(this)">Manifiesto</a></li>
  </ul>
</div>
<div id="cuerpos" class="tabc"><div class="tab">
<table width="100%" border="0" cellpadding="4" cellspacing="1" id="a">
  <tr><th class="c1" colspan="2">Ingrese la DUI Anticipada</th></tr>
  <tr><th>Gestión</th><td><input type="text" name="b1" maxlength="4" size="7"/></td></tr>
  <tr><th>Código de Aduana</th><td><select name="b2"/></td></tr>
  <tr><th>Nro. de Registro</th><td>C <input type="text" name="b3" maxlength="7" size="10"/></td></tr>
  <tr><th colspan="2"></th></tr>
  <tr><th>Aduana de Conexión</th><td><select name="b4" onchange="fCambia2()"/></td></tr>
  <tr><td colspan="2" class="C"><html:button styleClass="im" property="b" value="Procesar" onclick="fCargaDUI(1)" title="Busca los Manifiestos asociados a la DUI."/></td></tr>
</table>
</div>
<div class="tab">
<table width="100%" border="0" cellpadding="4" cellspacing="1" id="a">
  <tr><th class="c1" colspan="2">Ingrese el Manifiesto</th></tr>
  <tr><th>Gestión</th><td><input type="text" name="a1" maxlength="4" size="7"/></td></tr>
  <tr><th>Código de Aduana</th><td><select name="a2"/></td></tr>
  <tr><th>Nro. de Registro</th><td><input type="text" name="a3" maxlength="7" size="10"/></td></tr>
  <tr><th colspan="2"></th></tr>
  <tr><th>Aduana de Conexión</th><td><select name="a4" onchange="fCambia1()"/></td></tr>
  <tr><td colspan="2" class="C"><html:button styleClass="im" property="a" value="Procesar" onclick="fCargaDUI(2)" title="Busca la DUI y los Manifiestos asociados a la DUI."/></td></tr>
</table>
</div></div>
<br>
<div id="msg"></div>
<script type="text/javascript">
var f=document.forms["DespachoForm"];
window.onload=pi();
</script>
</html:form>