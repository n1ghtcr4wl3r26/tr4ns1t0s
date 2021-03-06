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
          $('#boton').val('reporte6');
      }
  
      document.ReporteRiesgoForm.submit();
  };
  
</script>
  
<html:form action="/ReporteAlerta" >
<input type="hidden" name="sw_reporte" id="sw_reporte"/>
<input type="hidden" name="boton" id="boton"/>

  <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
    <caption><label style="font-size:15px">Reportes Estadisticos - N&uacute;mero de Alertas Generadas por Variable de Riesgo y Resultado</label></caption>
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
      
      <html:text property="fec_desde" maxlength="10" size="10" style="text-align:center" value="<%=fecdesde%>"/>
      <%}else
      {
      %>
      
      <html:text property="fec_desde" maxlength="10" size="10" style="text-align:center" />
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
 
 int i=0;
 ClaseSql sql = new ClaseSql(); 
 try
  { sql.getConexion();
    CallableStatement call = null;
    call = sql.cn.prepareCall( "{? = call PKG_VARIABLE_RIESGO.reporte6( ?,? ) }" );
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, bean.getFec_desde() );  
    call.setString( 3, bean.getFec_hasta() );  
    
    call.execute();    
    %>
    
   
    <table width="90%" border="0" cellpadding="3" cellspacing="0" align="center">
        <tr>
            <th><label style="font-size:15px">N&uacute;mero de Alertas Generadas por Variable de Riesgo y Resultado</label></th>
        </tr>
    </table>
    <table width="90%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
        <tr class="t14">
            <th align="center" >VARIABLE DE RIESGO</th>
            
            <th align="center" >OBSERVADO</th>
            <th align="center" >SIN OBSERVACION</th>
            <th align="center" >PENDIENTE</th>
            <th align="center" >TOTAL</th>
        </tr>
         
        <%
      ResultSet rs = ( ResultSet ) call.getObject( 1 );
      String var="";
      String lnkd;
      String lnkh;
      int total = 0;
      int total_obs = 0;
      int total_sin = 0;
      int total_pen = 0;
      int total_tot = 0;
      
      
      if( ! ( rs == null || !rs.next() ) ) {
        do {
        
        total_obs = total_obs + Integer.parseInt(rs.getString( 2 ));
        total_sin = total_sin + Integer.parseInt(rs.getString( 3 ));
        total_pen = total_pen + Integer.parseInt(rs.getString( 4 ));
        total = Integer.parseInt(rs.getString( 2 )) + Integer.parseInt(rs.getString( 3 )) + Integer.parseInt(rs.getString( 4 ));
        
        total_tot = total_obs + total_sin + total_pen;
       
        if( (i++)%2 == 0 ) {
        var="tr1";
        }else
        {
        var="";
        }        
%> 
        <tr class="<%=var%>">
            <td>
                <%=rs.getString( 1 ) %>
            </td>
            <td style="text-align:center">
                <%=rs.getString( 2) %>
            </td>
            <td style="text-align:center">
                <%=rs.getString( 3) %>
            </td>
            <td style="text-align:center">
                <%=rs.getString( 4) %>
            </td>
            <td style="text-align:center">
                <%=total %>
            </td>
           
        </tr>
         
        <%
    }while( rs.next() );
    %>
    
    <tr class="<%=var%>">
            <th style="text-align:center">
                TOTAL
            </th>
            <th style="text-align:center">
                <%=total_obs %>
            </th>
            <th style="text-align:center">
                <%=total_sin %>
            </th>
            <th style="text-align:center">
                <%=total_pen %>
            </th>
            <th style="text-align:center">
                <%=total_tot %>
            </th>           
        </tr>
    <%
    
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
