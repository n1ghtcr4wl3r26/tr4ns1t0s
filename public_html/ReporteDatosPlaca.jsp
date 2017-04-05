<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Reporte.*, Transito.*"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/ReportePlaca.js"></script>

<html:form action="/ReporteAction" target="_blank" onsubmit="return fEvalua();" focus="p_medio">
  <table width="50%" border="0" cellpadding="2" cellspacing="0">
    <tr><td class="t14">Tr&aacute;nsitos por Placa</td></tr>
  </table>
  <table width="50%" border="0" cellpadding="4" cellspacing="1" class="marco" id="a">
    <tr>
      <th>Medio de Transporte (Placa)</th>
      <td><html:text property="p_medio" maxlength="10" size="12"/></td>
    </tr>
    <tr>
      <th>Fecha Inicial (dd/mm/aaaa):</th>
      <td><html:text property="i_fecha" maxlength="10" size="12"/></td>
    </tr>
    <tr>
      <th>Fecha Final (dd/mm/aaaa):</th>
      <td><html:text property="d_fecha" maxlength="10" size="12"/></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <html:submit property="opcion" value="Procesar"/>
      </td>
    </tr>
    <tr><td colspan="2">
      La Fecha (Inicial y Final) se buscara en el campo de Fecha de Inicio de Tr&aacute;nsito.
    </td></tr>
  </table>
</html:form>