<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Transito.*"%><%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
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
<%@ page import="javax.sql.DataSource"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/lectorPlazo.js"></script>
<%  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" ); %>
<html:form action="/LectorPlazoAction" onsubmit="return fEvalua ( );" >

  
  <%if (cs.getPlazoEtiqueta() == 0){
        if(cs.getOpcion() == Ctte.eSalidaPuerto){
  %>  
  <table width="65%" border="0" cellpadding="4" cellspacing="0" cdlass="marco" id="a">
    <caption>.: <%=cs.getSetapa()%></caption>
    <tr><th class="c1" colspan="2">Lea la Etiqueta del Tr&aacute;nsito</th></tr>
    <tr>
      <td colspan="2">Posicionar el cursor en la casilla de Etiqueta</td>
    </tr>
    <tr>
      <th>Etiqueta:</th>
      <td>
        <div class="multiple">
          <html:password property="etiqueta" maxlength="750" size="750" redisplay="false"/><html:hidden property="opcion"/>
        </div>
      </td>
    </tr>
    <tr>
      <td colspan="2"><hr></td>
    </tr>
    <tr>
      <td colspan="2">En caso de no poder leer la etiqueta<br>Ingresar manifiesto</td>
    </tr>
    <tr>
      <th>Gesti&oacute;n:</th>
      <td><html:text property="gestion" maxlength="4" size="5"/></td>
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
        <html:submit value="Aceptar" onclick="opcion.value=0"/>
        <!--<html:submit value="Control de Paso con Observaciones" onclick="opcion.value=0"/>-->
      </td>
    </tr>
  </table>
  <script type="text/javascript" language="JavaScript">
<!-- 
  var focusControl = document.forms["LectorForm"].elements["gestion"];
  if( focusControl != null )
    focusControl.focus();
  -->
</script>
  <%}else{
    Connection cn = null;
    DataSource ds;
    CallableStatement call = null;
    ResultSet rs = null;
    String ia = "";

  try{
    InitialContext ic = new InitialContext();
    ds = (DataSource)ic.lookup("jdbc/asy_transito");
    cn = (Connection)ds.getConnection();

            call = cn.prepareCall("{ ? = call PKG_CONSULTA.l_manifiesto( ?,? ) }");
            call.registerOutParameter(1, OracleTypes.CURSOR);
            call.setString(2, cs.getAduanas());
            call.setShort(3, cs.getOpcion());
            call.execute();
            rs = (ResultSet) call.getObject(1);	
	if( !(rs == null || !rs.next() )) {
        %>
    <table width="65%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
    <caption>.: <%=cs.getSetapa()%></caption>
    </table>
    <table width="90%" cellpadding="2" cellspacing="0" id="tabla-a">
      <colgroup span="6">
        <col align="center" />
        <col align="center" />
        <col align="center" />
        <col align="center" />
        <col align="center" />
      </colgroup>
      <caption>TRANSITOS PARA SALIDA DE PUERTO</caption>
      <thead>
        <tr>
          <th>No.</th>
          <th>Tr&aacute;nsito</th>
          <th>Placa</th>
          <th>Empresa de transporte</th>
          <th>Fecha Registro<html:hidden property="opcion"/><html:hidden property="aduana"/><html:hidden property="gestion"/><html:hidden property="registro"/></th>
        </tr>
      </thead>
            <%
             String n1 = "";
             String n2 = "";
             String n3 = "";
             String n4 = "";
             String n5 = "";
             String n6 = "";
             String n7 = "";
             int i = 0;
            do{       
            %>
           <%i++;
             n1 = rs.getString("transito").toString();
             n2 = rs.getString("key_cuo").toString();
             n3 = rs.getString("car_reg_year").toString();             
             n4 = rs.getString("car_reg_nber").toString();
             n5 = rs.getString("placa").toString();
             n6 = rs.getString("reg_date").toString()+" "+rs.getString("car_reg_time").toString();    
             n7 = rs.getString("car_car_cod").toString()+" "+rs.getString("car_car_nam").toString(); 
             ia="javascript:recibe('"+n2+"','"+n3+"','"+n4+"');";
       if ((i%2) == 0)
           {%>
        <tr>
        <%}else {%>
        <tr class="odd">        
        <%}%>
          <td><strong><%= i %></strong></td>
          <td><a class="lin" href="<%=ia%>"><%= n1 %></a></td>
          <td><%= n5 %></td>
          <td><%= n7 %></td>
          <td><%= n6 %></td>
        </tr>
  
  <%        }while( rs.next() );%>
  </tbody>
    </table>
	<%}else{%>
	<table id="tabla-a" width="100%">
	<thead>
        <tr><td style="text-align:center;">No existe Manifiestos para inicio de transito registrados en su administracion aduanera.</td></tr>
	</thead>
        </table>
	<%
	}

}
catch( Exception e ) {
  e.printStackTrace();
%>
  <table>
  <tr><td><%=e.getMessage()%></td></tr>
  </table>
<%
}    
finally {

    if( cn != null ) cn.close();
    cn = null;
    if( rs != null ) rs.close();
    rs = null;
    ds = null;
}
%>
  
<%}//endif getopcion%>
  
  
  <%}else{
    Connection cn = null;
    DataSource ds;
    CallableStatement call = null;
    ResultSet rs = null;

  try{
    InitialContext ic = new InitialContext();
    ds = (DataSource)ic.lookup("jdbc/asy_transito");
    cn = (Connection)ds.getConnection();

            call = cn.prepareCall("{ ? = call PKG_CONSULTA.r_manifiesto( ?,?,?,?,? ) }");
            call.registerOutParameter(1, OracleTypes.CURSOR);   
            call.setString(2, cs.getKey_cuo());
            call.setString(3, cs.getKey_year());
            call.setString(4, cs.getKey_nber());
            call.setString(5, cs.getAduanas());
            call.setShort(6, cs.getOpcion());
            call.execute();
            rs = (ResultSet) call.getObject(1);	
	if( !(rs == null || !rs.next() )) {
        
  %>
  <table width="65%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
    <caption>.: <%=cs.getSetapa()%></caption>
    <tr><th class="c1" colspan="2">Informaci&oacute;n de Manifiesto Internacional de carga por carretera <br> Declaraci&oacute;n de Tr&aacute;nsito Aduanero </th></tr>
    <tr>
      <th>Aduana y No. de Registro de tr&aacute;nsito:</th>
      <td><b><%=rs.getString("key_cuo")+"/"+rs.getString("car_reg_year")+"-"+rs.getString("car_reg_nber")%></b><html:hidden property="opcion"/></td>
    </tr>
    <tr>
      <th>Placa:</th>
      <td><b><%=rs.getString("car_id_trp")%></b></td>
    </tr>
    <tr>
      <th>Empresa de Transporte:</th>
      <td><%=rs.getString("car_car_cod")+" "+rs.getString("car_car_nam")%></td>
    </tr>
    
    <tr>
      <th>Conductor:</th>
      <td><%=rs.getString("car_mast_nam")%></td>
    </tr>
    <tr>
      <th>Informaci&oacute;n Conductor:</th>
      <td><%=rs.getString("car_mast_inf1")%></td>
    </tr>
    <tr>
      <th>Total D/E:</th>
      <td><%=rs.getString("car_bl_nber")%></td>
    </tr>
    <tr>
      <th>Total bultos:</th>
      <td><%=rs.getString("car_pac_nber")%></td>
    </tr>
    <tr>
      <th>Total peso:</th>
      <td><%=rs.getString("car_gros_mass")%></td>
    </tr>
    <tr>
      <th>Total de contenedores:</th>
      <td><%=rs.getString("car_cntr_nbr")%></td>
    </tr>
    <tr>
        <th>Peso de Salida (Kg.):</th>
        <td><html:text property="peso" style="text-align:right" maxlength="11" size="20" onkeypress="return enter(event)" /></td>
    </tr>
    <tr>
      <td colspan="2" class="C">
        <!--<html:submit value="Registrar" onclick="opcion.value=1"/>-->
        <input name="procesar" onclick="envia('1');" value="Registrar" type="button" >
        
        <!--<html:submit value="Control de Paso con Observaciones" onclick="opcion.value=0"/>-->
      </td>
    </tr>
  </table>
   <script type="text/javascript" language="JavaScript">
<!-- 
function enter(e)
{
if(e.keyCode == 13){
var focusC = document.forms["LectorForm"].elements["procesar"];
  if( focusC != null )
    focusC.focus();
return false;
}
}

  var focusControl = document.forms["LectorForm"].elements["peso"];
  if( focusControl != null )
    focusControl.focus();
  -->
</script>
  <%
	}else{
	%>
	<table id="tabla-a" width="100%">
	<thead>
      <tr><td style="text-align:center;">No existe informaci&oacute;n registrada con los par&aacute;metros de b&uacute;squeda ingresados.</td></tr>
	</thead>
        </table>
	<%
	}

}
catch( Exception e ) {
  e.printStackTrace();
%>
  <table>
  <tr><td><%=e.getMessage()%></td></tr>
  </table>
<%
}    
finally {

    if( cn != null ) cn.close();
    cn = null;
    if( rs != null ) rs.close();
    rs = null;
    ds = null;
}
%>
  
<%}//endif plazoEtiqueta%>
  
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

