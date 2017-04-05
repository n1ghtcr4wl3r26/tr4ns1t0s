<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<html:errors/>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/usuario.js"></script>

<html:form action="/UsuarioAction" focus="usuario" onsubmit="return fEvalua()">

<table border="0" width="100%" id="a">
<tr><td align="center">
<img src="img/TRANSITOS_logo.jpg" align="middle" />
</td></tr>
  
</table>

  <table cellspacing="0" cellpadding="3" border="0" width="35%" id="a" class="marco">
    <caption>.: Ingreso al Sistemas de Tr&aacute;nsitos</caption>
    <tr><th class="c1" colspan="2">
      Ingrese los datos Solicitados
    </th></tr>
    <tr>
      <th>Usuario:</th>
      <td><html:text maxlength="15" size="20" property="usuario"/></td>
    </tr>
    <tr>
      <th>(*) Contrase&ntilde;a:</th>
      <td><html:password maxlength="15" size="20" property="clave" redisplay="false"/><br></td>
    </tr>
    <tr>
      <td colspan="2" class="C"><html:submit value="Aceptar"/></td>
    </tr>
    <tr>
      <td colspan="2" class="s9">(*) Hay diferencias entre May&uacute;sculas y Min&uacute;sculas</td>
    </tr>
  </table>
</html:form>
