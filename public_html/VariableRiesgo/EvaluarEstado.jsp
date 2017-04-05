<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="Main.*,Transito.*"%>
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
<script language="JavaScript" type="text/JavaScript" src="js/tramite2.js"></script>

<%
  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" );
  String archivo="print/"+cs.getKey_year()+"_"+cs.getKey_nber()+".tag";
  String imp = "";
  
  TramiteForm tram = (TramiteForm)request.getAttribute("TramiteForm"); 
  java.util.Date date = new Date();
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
  String anio = dateFormat.format(date)+"";
  /*if(tram == null || tram.getGestion() == null)
  {
        tram.setGestion(anio);
  }*/  
  
  if( cs.isBreporte() )
    imp = "_blank";
%>

<html:form action="/TramiteAction" onsubmit="return fEvalua ( );" focus="gestion" target="<%=imp%>">
  <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
    <caption>.: <%=cs.getSetapa()%></caption>
    <tr><th class="c1" colspan="2">
      <%if(cs.getOpcion()==1) { %> Ingrese los datos del Manifiesto <% } else { %> Ingrese los datos Tr&aacute;nsito <% } %>
    </th></tr>
    <tr>
      <th>Gesti&oacute;n:</th>
      <td>
      <%if(tram == null || tram.getGestion() == null)
  {
      %>
      
      <html:text property="gestion" maxlength="4" size="5" value="<%=anio%>"/>
      <%}else
      {
      %>
      
      <html:text property="gestion" maxlength="4" size="5"/>
      <%
      }
      %>
      
      </td>
    </tr>
    <tr>
      <th>Aduana:</th>
      <td>
        <html:select property="aduana">
<html:option value="">&lt;-- Seleccione Aduana --&gt;</html:option>
<%ClaseSql sql = new ClaseSql();
  try {
    sql.getConexion();
    String sCadena = "SELECT cuo_cod, cuo_nam FROM ops$asy.uncuotab WHERE lst_ope = 'U' AND NOT cuo_cod IN ('CUO01', 'ALL') ORDER BY cuo_cod";
    ResultSet rs = sql.st.executeQuery( sCadena );
    if ( ! (rs == null || !rs.next()) ) {
      do{   %>
<html:option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>: <%=rs.getString(2)%></html:option>
<%      }while( rs.next() );
    }
  } catch (Exception er)  {
    er.printStackTrace();
  } 
  finally  {
    sql.getClose();
  }
%>
        </html:select>
      </td>
    </tr>
    <tr>
      <th>N&uacute;mero de Registro:</th>
      <td><html:text property="registro" maxlength="10" size="12"/></td>
    </tr>
    <tr>
      <td colspan="2" class="C">
        <html:hidden property="saduana"/>
        <html:submit value="Aceptar"/>
      </td>
    </tr>
  </table>
</html:form>

<script language="JavaScript" type="text/JavaScript">
  var opcion = '<%= cs.getOpcion()%>';
</script>

<% if( cs.isResumen() ) {  %>
<script language="JavaScript" type="text/JavaScript">
function fImprimir() {
  window.open( "ReporteRutaPlazo.jsp", "imprime", "status=0, toolbar=1, scrollbars=1, width=800, height=450, resizable=1");
}
fImprimir();
</script>
<%
    cs.setResumen( false );
  }
%>
<%
//resumen de la ejecucion de punto de control
  if( cs.isResumen2() )
  {
%>
<script language="JavaScript" type="text/JavaScript">
    function fImprimir(  ) {
      window.open( "ReporteRutaPlazoPCtl.jsp", "imprime", "status=0, toolbar=1, scrollbars=1, width=800, height=450, resizable=1");
    }

    fImprimir();
</script>
<%
    cs.setResumen2( false );
  }
%>