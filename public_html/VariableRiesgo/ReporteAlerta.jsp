<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="Main.*,Transito.*,VariableRiesgo.*"%>
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
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/JSReporteRiesgo.js"></script>

<%
  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" );
 
  ReporteRiesgoForm bean = (ReporteRiesgoForm)request.getAttribute("ReporteRiesgoForm");   
  
  java.util.Date date = new Date();
  Calendar cal = Calendar.getInstance();
  cal.setTime(date);
  cal.add(Calendar.DATE, -30);  
  SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
  String fechasta = dateFormat.format(date)+""; 
  date = cal.getTime();
  String fecdesde = dateFormat.format(date)+""; 
  
%>
<script language="JavaScript" type="text/javascript" >
  $(document).ready(function () {   
  });
    
   function reporte(valor) {
      if(valor == 1) {
          $('#boton').val('reporte1');
      }
  
      document.ReporteRiesgoForm.submit();
  };
  
</script>
  
<html:form action="/ReporteAlerta" >
<input type="hidden" name="sw_reporte" id="sw_reporte"/>
<input type="hidden" name="boton" id="boton"/>

  <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
    <caption><label style="font-size:15px">Reportes - Alertas Generadas por MIC</label></caption>
    <tr><th class="c1" colspan="4">
      Par&aacute;metro de B&uacute;squeda
    </th></tr>
    <tr><td colspan="4">
      &nbsp;
    </td></tr>
    
    <tr>
      <th>Fecha Desde:</th>
      <td>
      <%if(bean == null || bean.getFec_desde() == null)
  {
      %>
      
      <html:text property="fec_desde" maxlength="10" size="10"  style="text-align:center" value="<%=fecdesde%>"/>
      <%}else
      {
      %>
      
      <html:text property="fec_desde" maxlength="10" size="10"  style="text-align:center"/>
      <%
      }
      %>
      
      </td>
      
      <th>Fecha Hasta:</th>
      <td>
      <%if(bean == null || bean.getFec_hasta() == null)
  {
      %>
      
      <html:text property="fec_hasta" maxlength="10" size="10" style="text-align:center" value="<%=fechasta%>"/>
      <%}else
      {
      %>
      
      <html:text property="fec_hasta" maxlength="10" size="10" style="text-align:center"/>
      <%
      }
      %>
      
      </td>
      
      
    </tr>
    
    
    <tr>
      <td colspan="4" class="C">
                 <input type="button" value="Consultar" name="boton" onclick="reporte(1)"></input>

      </td>
    </tr>
  </table>
  
  
  
 <%
 if(bean.getSw_reporte() != null )
 {
 String StrSql = "";
 int i=0;
 ClaseSql sql = new ClaseSql(); 
 try
  { sql.getConexion();
    CallableStatement call = null;
    call = sql.cn.prepareCall( "{? = call PKG_VARIABLE_RIESGO.reporte1( ?,? ) }" );
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, bean.getFec_desde() );  
    call.setString( 3, bean.getFec_hasta() );  
    
    call.execute();    
    %>
    
   
    <table width="90%" border="0" cellpadding="3" cellspacing="0" align="center">
        <tr>
            <th><label style="font-size:15px">Alertas Generadas por MIC</label></th>
        </tr>
    </table>
    <table width="90%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
        <tr class="t14">
            <th align="center">Manifiesto</th>         
      <th align="center">Documento de Embarque</th>
      <th align="center">Empresa</th>
      <th align="center">Placa</th>
      <th align="center">Fecha de Registro del Manifiesto</th>
      <th align="center">Fecha Partida</th>
      <th align="center">Aduana Partida</th>
      <th align="center">Fecha Destino</th>
      <th align="center">Aduana Destino</th> 
      <th align="center">Estado</th>
      
      
      <th align="center">T&eacute;cnico Aduanero</th>
      <th align="center">Consignatario</th>
      <th align="center">Proveedor</th>
      <th align="center">Conductor</th>
      <th align="center">Descripci&oacute;n de la mercanc&iacute;a</th>
      <th align="center">Precintos</th>
      <th align="center">Informaci&oacute;n Adicional Manifiesto</th>
      <th align="center">Peso</th>
      <th align="center">Cantidad de bultos</th>
      <th align="center">Resultado</th>
      <th align="center">Descripcion Resultados</th>      
      <th align="center">Variables Asociadas</th>
      
        </tr>
         
        <%
      ResultSet rs = ( ResultSet ) call.getObject( 1 );
      String var="";
      String lnkd;
      String lnkh;
      
      if( ! ( rs == null || !rs.next() ) ) {
        do {
        
       
        if( (i++)%2 == 0 ) {
        var="tr1";
        }else
        {
        var="";
        }        
%> 
        <tr class="<%=var%>">
            <td><%=rs.getString( 1 )%> / <%=rs.getString( 2 )%> - <%=rs.getString( 3 )%> - <%=rs.getString( 4 )%></td>
    
    <td><%=rs.getString(23)%></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(6)%></td>
    <td><%=rs.getString(27)%></td>
    <td><%=rs.getString(7)%></td>
    <td><%=rs.getString(8)%></td>
    <td><%=rs.getString(9)%></td>
    <td><%=rs.getString(10)%></td>
<%  
    if( rs.getString( "lst_ope" ).equals("-") ) {
        StrSql ="Sin inicio de tr&aacute;nsito";
    }
    else
      if( rs.getString( "lst_ope" ).equals("D") ) {
        StrSql ="Cancelado";
      } else {
        if ( rs.getInt( 12 ) == 1 ) {
          StrSql ="Concluido";
        } else {
          if( rs.getInt( 12 ) == 0 ) {
            StrSql ="Sin localizaci&oacute;n";
          } else {
            if ( rs.getInt( 13 ) <= 0 )
              StrSql ="En tr&aacute;nsito";
            else
              if(rs.getString(15).equals("-"))
              StrSql ="Fuera de Plazo";
              else
              StrSql =rs.getString(15).toString();
            
              //StrSql ="Fuera de Plazo";
          }
        }
      }
%>
    <td><%=StrSql%></td>
    
    <td><%=rs.getString(16)%></td>
    <td><%=rs.getString(17)%> <%=rs.getString(18)%></td>
    
    <td><%=rs.getString(28)%></td>
    <td><%=rs.getString(19)%></td>
    <td><%=rs.getString(20)%></td>
    <td><%=rs.getString(21)%>&nbsp;</td>
    <td><%=rs.getString(22)%>&nbsp;</td>
    <td style="text-align:right"><%=rs.getString(24)%></td>
    <td><%=rs.getString(25)%> <%=rs.getString(26)%></td>
    <td><%=rs.getString(30)%></td>  
    <td><%=rs.getString(32)%>&nbsp;</td> 
    <td><%=rs.getString(31)%></td>  
        </tr>
         
        <%
    }while( rs.next() );
  }
%>
    </table>
    <%} catch (Exception er)  {
    er.printStackTrace();
  } 
  finally  {
    sql.getClose();
  }
 }
%>

  
  
  
  
  
</html:form>
