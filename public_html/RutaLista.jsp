<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ page import="Rutas.*, Main.*, Transito.*"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="java.sql.Types"%>

<script language="JavaScript" type="text/JavaScript">
<!--
  var bCancel = false;

function Adiciona()
{
  f = document.forms[0];
  f.opcion.value = 1; //adiciona
  f.submit();
}

function Boton( codigo, estado )
{
  f = document.forms[0];
    
  f.opcion.value = estado;
  f.boton.value = codigo;

  if( estado == 3 )
  {
    if( confirm("Est\341 seguro de borrar el registro?") )
      f.submit();
  }
  else
    f.submit();
}
-->
</script>

<html:form action="/ListaAction" focus="codigo">
<html:hidden property="opcion"/>
<html:hidden property="boton"/>
<html:hidden property="script"/>



 
<%
  ListaForm bLista = (ListaForm) request.getAttribute( "ListaForm" );
  ClaseSession bSession = (ClaseSession) request.getSession().getAttribute("ClaseSession");

  ClaseSql sql = new ClaseSql();

  int i = 1;

  try {
    sql.getConexion();
    String sCadena = "";



    if( bLista.getOpcion() == Ctte.lBorra ) {
      CallableStatement call = null;
      call = sql.cn.prepareCall( "{? = call pk_rutas.borra( ?, ? ) }" );
      call.registerOutParameter( 1, Types.VARCHAR );
      call.setString( 2, bLista.getBoton() );
      call.setString( 3, bSession.getCodusu());
      call.execute();
      sCadena = ( String ) call.getObject( 1 );   %>
       <table width="100%" border="0" cellpadding="3" cellspacing="1">
    <tr class="blue">
      <td colspan="6"><li><%=sCadena%></li></td>
    </tr></table>
<% }

%>
<html:submit value="Volver al Men&uacute; Principal" onclick="opcion.value = 5"/>
  <table width="100%" border="0" cellpadding="3" cellspacing="1">
    <tr><td class="t14">Listado de Rutas y Plazos Autorizados</td></tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" id="c">
    <tr>
      <td rowspan="2" align="center">
        <a href="javascript:Boton(0, <%= Ctte.lBusca %> );">Busca</a>
      </td>
      <th>C&oacute;digo</th>
      <th colspan="2">Aduana</th>
      <th>Tiempo (hrs)</th>
      <th>Tipo de Ruta</th>
    </tr>
    <tr>
      <td align="center"><html:text property="codigo" maxlength="3" size="3"/></td>
      <td align="center" colspan="2"><html:text property="aduana" maxlength="20" size="20"/></td>
      <td align="center"><html:text property="hrs" maxlength="3" size="3"/></td>
      <td align="center"><html:text property="tiptra" maxlength="12" size="12"/></td>
    </tr>

    <tr class="blue">
      <td colspan="6"><a href="javascript:Adiciona();">Adiciona</a></td>
    </tr>

<%




    sCadena = "SELECT * FROM get_unroutab " + bLista.getScript() + " order by to_number(rou_cod)";
    ResultSet rs = sql.st.executeQuery( sCadena );
    if ( ! (rs == null || !rs.next()) ) {
      do{
        if( (i % 2) == 0 ) {
%>
    <tr class="tr1">
<%      } else {   %>
    <tr>
<%      }   %>
      <td>
        <a href="javascript:Boton(<%= rs.getString(1) %>, <%= Ctte.lBorra %> )">Borra</a>
        <a href="javascript:Boton(<%= rs.getString(1) %>, <%= Ctte.lEdita %> )">Edita</a>
      </td>
      <td><%=rs.getString(1)%></td>
      <td><%=rs.getString(3)%></td>
      <td><%=rs.getString(4)%></td>                        
      <td class="centro8"><%=rs.getString(5)%></td>
      <td><%=rs.getString(6)%></td>
    </tr>
<%    i++;
    }while( rs.next() );
  } else  { %>
      <tr><td colspan="6">No existe datos para desplegar en la lista</td></tr>
  <% }
  }
  finally {
    sql.getClose();
  }
%>
  </table>
  <html:submit value="Volver al Men&uacute; Principal" onclick="opcion.value = 5"/>
</html:form>