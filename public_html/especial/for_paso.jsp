<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Transito.*"%>
<%
  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" );
  String imp = "";
  if( cs.isBreporte() )
    imp = "_blank";
%>
<html:form action="/TramiteAction" target="<%=imp%>">
  <table width="50%" border="0" cellpadding="4" cellspacing="1" class="marco" id="a">
    <caption><%= cs.getSetapa() %></caption>
    <tr><th class="c1" colspan="2">Seleccione los filtros</th></tr>
    <tr>
      <th>Periodo:</th>
      <td><html:text property="aduana" maxlength="10" size="10"/> al <html:text property="gestion" maxlength="10" size="10"/></td>
    </tr>
    <tr>
      <th>Registro Aduana-Peso :</th>
      <td><html:select property="registro">
        <html:option value="-1">Todos</html:option>
        <html:option value="0">Los Registrados</html:option>
        <html:option value="1">Los NO Registrados</html:option></html:select>
      </td>
    </tr>
    <tr>
      <th>Registro con Observaciones :</th>
      <td><html:select property="saduana">
        <html:option value="-1">Todos</html:option>
        <html:option value="0">Con Observaciones</html:option>
        <html:option value="1">Sin Observaciones</html:option></html:select>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="C">
        <html:submit value="Procesar"/>
      </td>
    </tr>
  </table>
</html:form>