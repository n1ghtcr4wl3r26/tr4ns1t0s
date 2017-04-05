<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ page import="Rutas.*, Main.*, Transito.*"%>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="java.sql.Types"%>

<%
  String codigo = "";
  String opcion = "";
  ListaForm bLista = (ListaForm) request.getAttribute( "ListaForm" );
  ResultSet rs=null;
%>

<script language="JavaScript" type="text/JavaScript">
  bCancel = false;
</script>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/ruta.js"></script>

<html:form action="/RutaAction" onsubmit="return fEvalua( )">
<%ClaseSql sql = new ClaseSql();
  RutaForm bRuta = (RutaForm) request.getAttribute( "RutaForm" );
  if( bLista != null ) {
    codigo = bLista.getBoton();
    opcion = Integer.toString(bLista.getOpcion());
  } else {
    codigo = bRuta.getP_rou_cod();
    opcion = Integer.toString(bRuta.getLopcion());
  }
  int i = 1;

  try {
    sql.getConexion();

    String sCadena = "";

    if( opcion.equals(String.valueOf(Ctte.lEdita)) ) {
      if( bRuta == null )
        bRuta = new RutaForm();
      sCadena = "select * from get_unroutab where rou_cod = '" + codigo + "'";
      rs = (ResultSet) sql.st.executeQuery( sCadena );
      if( !(rs == null || !rs.next()) ) {
        bRuta.setP_cuo_arr( rs.getString( 3 ).substring( 0, 3 ) );
        bRuta.setP_cuo_sal( rs.getString( 4 ).substring( 0, 3 ) );
        bRuta.setP_rou_mod( rs.getString( 6 ).substring( 0, 2 ).trim() );
        bRuta.setP_rou_ter( Integer.toString( rs.getInt( 5 ) ) );
        bRuta.setP_rou_ter_ver( Integer.toString( rs.getInt( 5 ) ) );
      } else  {
        opcion = Integer.toString(Ctte.lAdiciona);
%>      No Existe el Código    
<%    } } else  { codigo = "0"; } %>
  <html:hidden property="p_rou_cod" value="<%=codigo%>" />
  <html:hidden property="lopcion" value="<%=opcion%>" />
  <html:hidden property="p_des" value="<%=opcion%>" />
  <html:hidden property="p_rou_ter_ver" />
  <html:hidden property="opcion" />

  <table border="0" width="45%" cellpadding="2" cellspacing="0">
    <tr><td class="t14">Ingrese los datos solicitados</td></tr>
  </table>
  <table border="0" width="45%" cellpadding="3" cellspacing="0" class="marco" id="a">
    <tr>
      <th>C&oacute;digo:</th>
      <td><%=codigo%></td>
    </tr>
    <tr>
      <th>Aduana Punto A:</th>
      <td>
        <select name="p_cuo_sal" title="Código de Aduana">
          <option value="">-->Elija una Aduana</option>
<%
    sCadena = "select cuo_cod, cuo_nam from ops$asy.uncuotab where lst_ope='U' and cuo_cod not in ('ALL','CUO01') order by 1";
    rs = (ResultSet) sql.st.executeQuery( sCadena );
    if( !(rs == null || !rs.next()) )  {
      do {
      
      if( opcion.equals(String.valueOf(Ctte.lAdiciona)) ) {
      
      if( bRuta.getP_cuo_sal().equals( rs.getString( 1 ) ) ) {  %>
          <option value="<%=rs.getString( 1 )%>" selected="true"><%=rs.getString( 1 )%>: <%=rs.getString( 2 )%></option>
<%    } else {   %>
          <option value="<%=rs.getString( 1 )%>"><%=rs.getString( 1 )%>: <%=rs.getString( 2 )%></option>
<%
        }
        
      }
      if( opcion.equals(String.valueOf(Ctte.lEdita)) ) {
      if( bRuta.getP_cuo_sal().equals( rs.getString( 1 ) ) ) {  %>
          <option value="<%=rs.getString( 1 )%>" selected="true"><%=rs.getString( 1 )%>: <%=rs.getString( 2 )%></option>
<%    } 
      }
      
        
      }while ( rs.next() );  }
%>
        </select>
      </td>
    </tr>
    <tr>
      <th>Aduana Punto B:</th>
      <td>
        <select name="p_cuo_arr" title="Código de Aduana">
          <option value="">-->Elija una Aduana</option>
<%
    rs = sql.st.executeQuery( sCadena );
    if( !(rs == null || !rs.next() ) )  {
      do {
      
      if( opcion.equals(String.valueOf(Ctte.lAdiciona)) ) {
      if( bRuta.getP_cuo_arr().equals( rs.getString( 1 ) ) ) {  %>
          <option value="<%=rs.getString( 1 )%>" selected="true"><%=rs.getString( 1 )%>: <%=rs.getString( 2 )%></option>
<%      } else {   %>
          <option value="<%=rs.getString( 1 )%>"><%=rs.getString( 1 )%>: <%=rs.getString( 2 )%></option>
<%
        }
      
      }
      if( opcion.equals(String.valueOf(Ctte.lEdita)) ) 
      {
      if( bRuta.getP_cuo_arr().equals( rs.getString( 1 ) ) ) {  %>
          <option value="<%=rs.getString( 1 )%>" selected="true"><%=rs.getString( 1 )%>: <%=rs.getString( 2 )%></option>
<%      } 
      
      }
        
      }while ( rs.next() );  }
%>
        </select>
      </td>
    </tr>
    <tr>
      <th>Tipo de Ruta:</th>
      <td>
        <select name="p_rou_mod" title="Tipo de Transporte">
          <option value="">-->Elija un Tipo de Transporte</option>
<%
      sCadena = "SELECT mot_cod, mot_dsc FROM OPS$ASY.unmottab WHERE lst_ope = 'U' ORDER BY 1";
      rs = sql.st.executeQuery( sCadena );
      if( !(rs == null || !rs.next() ) )  {
        do {
        
        if( opcion.equals(String.valueOf(Ctte.lAdiciona)) ) {
        
        if( bRuta.getP_rou_mod().equals( rs.getString( 1 ) ) ) {  %>
          <option value="<%=rs.getString( 1 )%>" selected="true"><%=rs.getString( 1 )%>: <%=rs.getString( 2 )%></option>
<%      }  else  {   %>
          <option value="<%=rs.getString( 1 )%>"><%=rs.getString( 1 )%>: <%=rs.getString( 2 )%></option>
<%      }

        }
        if( opcion.equals(String.valueOf(Ctte.lEdita)) ) 
        {
      if( bRuta.getP_rou_mod().equals( rs.getString( 1 ) ) ) {  %>
          <option value="<%=rs.getString( 1 )%>" selected="true"><%=rs.getString( 1 )%>: <%=rs.getString( 2 )%></option>
<%      }
      
        }
        
          


        }while ( rs.next() );
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    finally {
      sql.getClose();
    }
%>
         </select>
      </td>
    </tr>
    <tr>
      <th>Tiempo de Recorrido:</th>
      <td><html:text property="p_rou_ter" size="4" maxlength="3"/></td>
    </tr>
  </table>
  <html:submit styleClass="BT1" value="Grabar" onclick="opcion.value = 1"/>
  <html:submit styleClass="BT1" value="Cancela" onclick="opcion.value = 2; bCancel=true"/>
</html:form>