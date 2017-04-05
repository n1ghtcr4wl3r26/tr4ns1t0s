<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/ReporteResxAP.js"></script>

<html:form action="/ReporteAction" onsubmit="return validarepxAP();" focus="i_aduana">
  <table width="75%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><td class="t14">Resumen Tránsitos por Aduana de Partida</td></tr>
  </table>

  <table  width="75%" border="0" cellpadding="2" cellspacing="1" class="marco" id="a" align="center">
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
      <td><html:checkbox property="check1">Concluido con localización</html:checkbox></td>
    </tr>
    <tr>
      <td><html:checkbox property="check2">Concluido sin localización</html:checkbox></td>
    </tr>
    <tr>
      <td><html:checkbox property="check3">En tránsito fuera del plazo</html:checkbox></td>
    </tr>
    <tr>
      <td><html:checkbox property="check4">En tránsito en plazo</html:checkbox></td>
    </tr>
    <tr>
      <td><html:checkbox property="check5">Cancelados</html:checkbox></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <html:submit property="boton" value="Procesar" onclick="" />
      </td>
    </tr>
  </table>
</html:form>