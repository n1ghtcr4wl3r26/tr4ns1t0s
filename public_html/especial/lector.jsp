<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Transito.*"%>
<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/lector.js"></script>
<%  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" ); %>
<html:form action="/LectorAction" onsubmit="return fEvalua ( );" focus="etiqueta">
  <table width="65%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
    <caption>.: <%=cs.getSetapa()%></caption>
    <tr><th class="c1" colspan="2">Lea la Etiqueta del Tr&aacute;nsito</th></tr>
    <tr>
      <th>Etiqueta:</th>
      <td>
        <div class="multiple">
          <html:password property="etiqueta" maxlength="750" size="750" redisplay="false"/><html:hidden property="opcion"/>
        </div>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="C">
        <html:submit value="Control de Paso OK" onclick="opcion.value=1"/>
        <html:submit value="Control de Paso con Observaciones" onclick="opcion.value=0"/>
      </td>
    </tr>
  </table>
</html:form>
<% if( cs.isResumen() ) { %>
<script language="JavaScript" type="text/JavaScript">
function fImprimir(  ) {
  window.open( "ReporteRutaPlazo.jsp", "imprime", "status=0, toolbar=1, scrollbars=1, width=800, height=450, resizable=1");
}
fImprimir();
</script>
<%  cs.setResumen( false );
  } %>