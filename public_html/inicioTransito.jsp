<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="Main.*, Transito.*"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/iniciaTransito.js"></script>

<%
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
  AsignaRutaPlazoForm bRuta = (AsignaRutaPlazoForm) request.getSession().getAttribute( "AsignaRutaPlazoForm" );
  String titulo="";
  String stransito=cs.getKey_cuo()+cs.getKey_year()+cs.getKey_nber();

  int index = 4;
  if( bRuta.isTiene() )
    index = 10;
%>
<script language="JavaScript" type="text/JavaScript">
<!--
  fRegistro = "<%= bRuta.getFecreg() %>";
  fActual = "<%= bRuta.getFeclim() %>";
  index = <%= index %>;
  hayBoleta = <%= bRuta.isTiene()%>;
  transito='<%=cs.getKey_cuo()%>+<%=cs.getKey_year()%>+<%=cs.getKey_nber()%>';
-->
</script>

<html:form action="/AsignaRutaPlazoAction" onsubmit="return fEvalua ( );" focus="fecha">
  <table width="100%" border="0" cellpadding="3" cellspacing="0" class="marco" id="a">
    <caption>Nro. de Registro del Manifiesto</caption>
    <tr><th>Aduana de Partida:</th><td><%=cs.getDscadu()%></td></tr>
    <tr><th>Nro. de Registro del Manifiesto:</th><td><%=cs.getKey_year()%>/<%=cs.getKey_cuo()%>-<%=cs.getKey_nber()%>
    <input type="hidden" name="verificacion" value="<%=cs.getKey_year()%><%=cs.getKey_cuo()%><%=cs.getKey_nber()%>"/>
    </td></tr>
    <tr>
      <th>Empresa Transportista:</th>
      <td><bean:write name="AsignaRutaPlazoForm" property="codtrans"/>:<bean:write name="AsignaRutaPlazoForm" property="dsctrans"/></td>
      <th>Placa del Medio de Transporte:</th>
      <td><bean:write name="AsignaRutaPlazoForm" property="placa"/></td>
    </tr>
    <tr>
      <th>Precinto(s) Registrado(s) en el SIDUNEA++:</th>
      <td colspan="3"><bean:write name="AsignaRutaPlazoForm" property="pre2"/></td></tr>
    <tr>
      <th>Fecha de Partida:</th><td><html:text property="fecha" maxlength="10" size="10"/> (dd/mm/aaaa)</td>
      <th>Hora de Partida:</th><td><html:text property="hora" maxlength="5" size="5"/> (hh:mi)</td>
    </tr>
    <tr>
      <th>Precintos (a parte de los registrados en el SIDUNEA++):</th>
      <td colspan="3"><html:text property="pre1" maxlength="75" size="100"/></td>
    </tr>
    <tr>
      <th>Observaci&oacute;n:</th>
      <td colspan="3"><html:text property="obs" maxlength="100" size="100"/></td>
    </tr>
  </table>
<div id="boleta">
<%  if( bRuta.isTiene() ) { %>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" class="marco" id="a">
    <caption>La Empresa de Transporte tiene un Transito No Arribado</caption>
    <tr>
      <th>Nro. Boleta:</th><td><html:text property="boleta" size="17" maxlength="15"/></td>
      <th>Entidad Financiera:</th>
      <td><html:select property="entidad">
<html:option value="">&lt;-- Seleccione Entidad --&gt;</html:option>
<html:option value="904">BANCO BOLIVIANO AMERICANO (904)</html:option>
<html:option value="824">BANCO BOLIVIANO AMERICANO (S.N.A.) (824)</html:option>
<html:option value="900">BANCO CENTRAL DE BOLIVIA (900)</html:option>
<html:option value="908">BANCO DE COCHABAMBA (908)</html:option>
<html:option value="947">BANCO DE COCHABAMBA (947)</html:option>
<html:option value="903">BANCO DE CREDITO DE BOLIVIA (903)</html:option>
<html:option value="952">BANCO DE CREDITO ORURO (952)</html:option>
<html:option value="944">BANCO DE FINANCIAMIENTO INDUSTRIAL (944)</html:option>
<html:option value="920">BANCO DE LA NACION ARGENTINA (920)</html:option>
<html:option value="911">BANCO DE LA PAZ (911)</html:option>
<html:option value="953">BANCO DE POTOSI (953)</html:option>
<html:option value="907">BANCO DE SANTA CRUZ (907)</html:option>
<html:option value="808">BANCO DEL ESTADO (D.G.A.) (808)</html:option>
<html:option value="967">BANCO DEL ESTADO (DGA - S/COP) (967)</html:option>
<html:option value="954">BANCO DEL PROGRESO (954)</html:option>
<html:option value="921">BANCO DO BRASIL (921)</html:option>
<html:option value="930">BANCO ECONOMICO (930)</html:option>
<html:option value="933">BANCO GANADERO (933)</html:option>
<html:option value="928">BANCO INDUSTRIAL S.A. (928)</html:option>
<html:option value="929">BANCO INTERNACIONAL DE DESARROLLO (929)</html:option>
<html:option value="959">BANCO INTERNACIONAL DE DESARROLLO (959)</html:option>
<html:option value="945">BANCO LATINOAMERICANO DE DESARROLLO (945)</html:option>
<html:option value="902">BANCO MERCANTIL (902)</html:option>
<html:option value="1003">BANCO MERCANTIL (A.N.B.) (1003)</html:option>
<html:option value="938">BANCO MERCANTIL (ANB - S/COP.) (938)</html:option>
<html:option value="853">BANCO MERCANTIL (RED OCCIDENTAL) (853)</html:option>
<html:option value="375">BANCO MERCANTIL S.A. (375)</html:option>
<html:option value="837">BANCO MERCANTIL (S.N.A.) (837)</html:option>
<html:option value="942">BANCO MINERO DE BOLIVIA (942)</html:option>
<html:option value="901">BANCO NACIONAL DE BOLIVIA (901)</html:option>
<html:option value="925">BANCO REAL (925)</html:option>
<html:option value="931">BANCO SOLIDARIO (931)</html:option>
<html:option value="943">BANCO SUR (943)</html:option>
<html:option value="913">BANCO UNION (913)</html:option>
<html:option value="905">BHN - MULTIBANCO S.A. (905)</html:option>
<html:option value="5005">FIE S.A. (5005)</html:option>
<html:option value="922">FIRST NATIONAL CITY BANK (922)</html:option>
<html:option value="5008">FORTALEZA FFP (FONDO FINANCIERO PRI (5008)</html:option>
<html:option value="5007">PRODEM S.A. (5007)</html:option>
        </html:select>
      </td>
    </tr>
    <tr>
      <th>Importe:</th><td><html:text property="monto" size="10" maxlength="12" /></td>
      <th>Tipo de Moneda:</th><td><html:select property="moneda"><html:option value="">&lt;-- Seleccione Moneda --&gt;</html:option><html:option value="BO">Boliviano (Bs.) (BO)</html:option><html:option value="USD">Dolar Estados Unidos (USD)</html:option><html:option value="UFV">Unidad de Fomento a la Vivienda (UFV)</html:option></html:select></td>
    </tr>
    <tr>
      <th>Vigencia:</th>
      <td colspan="3"><html:text property="fecini" size="12" maxlength="10" /><html:text property="fecfin" size="12" maxlength="10" /></td>
    </tr>
  </table>
<% } %>
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="0">
    <tr>
      <td class="t14" width="30%">Plan de Ruta</td><td class="t14">Aduana(s) Destino</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" class="marco" id="a">
<%  if( cs.getOpcion() == Ctte.eInicio )  {  %>
    <logic:iterate name="AsignaRutaPlazoForm" property="lista" id="lista" type="ClaseLista">
    <tr>
      <td class="C" width="30%"><html:text name="lista" property="acceso" size="1" maxlength="1" indexed="true"/></td>
      <td><%=lista.getCodigo()%>: <%=lista.getDsc()%></td>
    </tr>
    </logic:iterate>
<%  }  else  { if( cs.getOpcion() == Ctte.eModificacion ){  %>
    <logic:iterate name="AsignaRutaPlazoForm" property="lista" id="lista" type="ClaseLista">
    <tr>
<%  if( lista.getIndex().equals( "9" ) )  {  %>
      <td class="C" width="30%"><%= lista.getAcceso() %>: Concluido<html:hidden name="lista" property="acceso" indexed="true"/></td>
      <td><%=lista.getCodigo()%>: <%=lista.getDsc()%></td>
<%  }  else  {  %>
      <td class="C" width="30%"><html:text name="lista" property="acceso" size="1" maxlength="1" indexed="true"/></td>
      <td><%=lista.getCodigo()%>: <%=lista.getDsc()%></td>
<%  }  %>
    </tr>
    </logic:iterate>
<%  } else {  %>
    <logic:iterate name="AsignaRutaPlazoForm" property="lista" id="lista" type="ClaseLista">
    <tr>
      <td class="C" width="30%"><%= lista.getAcceso() %>: <html:hidden name="lista" property="acceso" indexed="true"/></td>
      <td><%=lista.getCodigo()%>: <%=lista.getDsc()%></td>
    </tr>
    </logic:iterate>
<%  } }  %>
    <tr>
      <td colspan="3" class="C">
        <html:hidden property="accion"/>
        <html:hidden property="transito" value="<%=stransito%>"/>
        <html:submit value="Aceptar" onclick="accion.value=1"/>
        <html:submit value="Cancelar" onclick="accion.value=2;bCancel=true"/>
      </td>
    </tr>
  </table>
</html:form>