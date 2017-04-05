<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="Main.*, Transito.*"%>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.sql.CallableStatement"%>
<%
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );

  String CodTran = "";
  String DscTran = "";
  String Placa = "";
  String fEstimada = "";
  String fActual = "";
  String fPartida = "";
  String sAduEst = "";
  String obs = "";

  String sAduana = "";
  String sFecha = "";
  String sEtapa = "";
  String PesoAduana = "";
%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/TransbordoRutaPlazo.js"></script>

<html:form action="/TransbordoRutaPlazoAction" onsubmit="return fEvalua ( );" focus="aduana">
<%  ClaseSql sql = new ClaseSql();
  try {
    sql.getConexion();
    CallableStatement call = null;
    call = sql.cn.prepareCall("{ call pkg_transito.consulta_transito(?,?,?,?,?,?) }");
    call.registerOutParameter( 5, OracleTypes.CURSOR );
    call.registerOutParameter( 6, OracleTypes.CURSOR );
    call.setString( 1, cs.getKey_cuo() );
    call.setString( 2, cs.getKey_year() );
    call.setString( 3, cs.getKey_nber() );
    call.setInt( 4, cs.getOpcion() );
    call.execute();

    ResultSet rs = ( ResultSet ) call.getObject( 5 );
    if( ! ( rs == null || !rs.next() ) ) {
      CodTran = rs.getString( "car_car_cod" );
      DscTran = rs.getString( "car_car_nam" );
      Placa = rs.getString( "car_id_trp" );
      obs = rs.getString( "obs" )==null ? "" : rs.getString( "obs" );
      fEstimada = rs.getString( "estimada" );
      fActual = rs.getString( "actual" );
      fPartida = rs.getString( "partida" );  %>
      
    
  
  <table width="100%" border="0" cellpadding="3" cellspacing="1">
    <tr><td class="t14">Transbordo de Tr&aacute;nsito</td></tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" class="marco" id="a">
    <tr><th>Aduana de Partida:</th><td><%=cs.getDscadu()%></td></tr>
    <tr><th>Nro. de Registro del Tr&aacute;nsito:</th><td><%=cs.getKey_year()%>/<%=cs.getKey_cuo()%>-<%=cs.getKey_nber()%></td></tr>
    <tr>
      <th>Empresa Transportista:</th>
      <td><%= rs.getString( "car_car_cod" ) %>: <%= rs.getString( "car_car_nam" ) %>
      </td>
      <th>Placa del Medio de Transporte:</th>
      <td><%= rs.getString( "car_id_trp" ) %>
      </td>
    </tr>
    <tr><th>Precinto(s) SIDUNEA++:</th><td><%=rs.getString("precinto")%></td></tr>
    <tr>
      <th>Precintos:</th>
      <td colspan="3"><%= rs.getString( "tra_pre" ) %></td>
    </tr>
<%  if( rs.getString( "boleta" ) != null )  {  %>
    <tr>
      <th>Garantia:</th><td colspan="3"><%= rs.getString( "boleta" ) %></td>
    </tr>
<%  }  if( rs.getInt("key_secuencia")==1 && rs.getInt("key_paso")==1) { %>
    <tr>
      <th>Peso en frontera:</th><td colspan="3"><%=rs.getString("peso")%></td>
    </tr>
<%  } %>
<%  if(!rs.getString("peso_salida").equals("       0.00")) { %>
    <tr>
      <th>Peso de Salida de Puerto (Kg.):</th><td colspan="3"><%=rs.getString("peso_salida")%></td>
    </tr>
    <%}%>
  </table>
  
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="marco" id="c">
   <tr>
      <th colspan="6">Informaci&oacute;n de Cierre de Transito</th>
    </tr>
    <tr>
      <th colspan="2">Partida</th><th colspan="2">Llegada</th><th rowspan="2">Tipo de Cierre</th>
    </tr>
    <tr>
      <th>Aduana</th><th>Fecha y Hora</th><th>Aduana</th><th>Fecha y Hora</th>
    </tr>
<%  rs = ( ResultSet ) call.getObject( 6 );
    if( ! ( rs == null || !rs.next() ) ) {
      do{  %>
    <tr class="tr10">
      <td><%= rs.getString( "tra_cuo_ini" ) %>: <%= rs.getString( "tra_dsc_ini" ) %></td>
      <td><%= rs.getString( "tra_fec_ini" ) %></td>
<%      if( rs.getInt( "tra_estado" ) == 1 ) {
          if( rs.getString( "tra_fec_des" ) == null ) {
            sAduana = rs.getString( "tra_cuo_est" ) + ": " + rs.getString( "tra_dsc_est" ) ;
            sFecha = rs.getString( "tra_fec_est" );
            sEtapa = "Pendiente";
          } else {
            sAduana = rs.getString( "tra_cuo_des" ) + ": " + rs.getString( "tra_dsc_des" ) ;;
            sFecha = rs.getString( "tra_fec_des" );
            sEtapa = "Concluido";
          }   %>
      <td><%= sAduana %></td>
      <td><%= sFecha %></td>
      <td><%= sEtapa %></td>
<%     } else {
        sAduEst = rs.getString( "tra_cuo_est" ); %>
      <td>
        <select name="aduanacierre">
        <option value="">&lt;-- Seleccione Aduana --&gt;</option>
<%      call = sql.cn.prepareCall("{? = call pkg_transito.lista_aduanas( ? ) }");
        call.registerOutParameter( 1, OracleTypes.CURSOR );
        call.setString( 2, cs.getAduanas() );
        call.execute();
        ResultSet fp = ( ResultSet ) call.getObject( 1 );
        if( ! ( fp == null || !fp.next() ) ) { do{  %>
        <option value="<%= fp.getString( 1 ) %>"> <%= fp.getString( 1 ) %>: <%= fp.getString( 2 ) %></option>
<%         } while( fp.next() );  }  %>
        </select>
      </td>
      <td>
        <html:hidden property="secuencia" value="<%= rs.getString( 1 ) %>"/>
        <html:text property="fecha" maxlength="10" size="11" value="<%= rs.getString( 12 ) %>" onblur="fdHora( fecha.value, hora.value )"/>
        <html:text property="hora"  maxlength="5" size="6" value="<%= rs.getString( 13 ) %>" onblur="fdHora( fecha.value, hora.value )"/>
        <input type="retraso" readonly="yes" size="6" id="retraso" class="rojo"/>
      </td>
      <td>
        <select name="tipo" onchange="habilita()">         
          <option value="28">Transbordo</option>
        </select>
      </td>
    </tr>
<%    }  }while( rs.next() ); }  %>
    <tr>
      <td>Observaci&oacute;n</td><td colspan="4"><html:text property="obs" maxlength="100" size="100" value="<%=obs%>"/></td>
    </tr>
  </table>  
    
    
    
      
  
  
   <table width="100%" border="0" cellpadding="3" cellspacing="1">
    <tr><td class="t14">Informaci&oacute;n de Transbordo</td></tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" class="marco" id="a">
    <tr><th>Empresa para Transbordo:</th><td><html:text property="codtrans" maxlength="50" size="50" /></td></tr>
     <tr><th>Identificaci&oacute;n Medio Transporte:</th>
     <td>
        <html:text property="placa" readonly="true" maxlength="50" size="50" value="00000"/>
        </td></tr>
    
     <tr><th>Tipo de Documento F&eacute;rreo:</th>
     
     <td>
      <select name="tipodoc" >         
          <option value="TIF">TIF/DTA</option>
        </select>
     </td></tr>
     <tr><th>Modo Transporte:</th><td>
     <select name="modo" >         
          <option value="2">FERREO</option>
        </select>
     </td></tr>
     <tr><th>Precintos:</th><td colspan="3"><html:text property="precintos" maxlength="50" size="50" /></td></tr>
  
  </table>
  
  
    
  <br/>
  
  <html:hidden property="accion"/>
  <html:submit value="Aceptar" onclick="accion.value=1"/>
  <html:submit value="Cancelar" onclick="accion.value=2;bCancel=true"/>
<br><br>
<%  call = sql.cn.prepareCall("{?=call pkg_transito.consulta_peso(?,?,?,?)}");
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, cs.getKey_cuo() );
    call.setString( 3, cs.getKey_year() );
    call.setString( 4, cs.getKey_nber() );
    call.setString( 5, sAduEst );
    call.execute();
    rs = ( ResultSet ) call.getObject( 1 );
    if( ! ( rs == null || !rs.next() ) ) { %>
  <table width="50%" border="0" cellpadding="3" cellspacing="1" class="marco" id="c">
    <tr>
      <th>Documento de Embarque</th><th>Cantidad Bultos</th><th>Peso (Kg.)</th>
    </tr>
<%  do{  %>
    <tr>
      <td><%= rs.getString( 1 ) %></td><td><%= rs.getString( 2 ) %></td><td><%= rs.getString( 3 ) %></td>
    </tr>
<%  }while( rs.next() );  %>
  </table>
<%  } 

} } catch( Exception e ) {
    System.out.println( e.getMessage() );
  }
  finally {
    sql.getClose();
  } %>
</html:form>
<script language="JavaScript" type="text/JavaScript">
<!--
f=document.forms[0];
function habilita() {
  if(f.tipo.value==28) {
    f.codtrans.value = "";
    f.placa.value = "00000";
    f.codtrans.disabled = false;
    f.placa.disabled = false;
  } else {
    f.codtrans.value = "<%=CodTran%>";
    f.placa.value = "<%=Placa%>";
    f.codtrans.disabled = true;
    f.placa.disabled = true;
  }
}
  
  habilita();
  fdHora( f.fecha.value, f.hora.value )
-->
</script>