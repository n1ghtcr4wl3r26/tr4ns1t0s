<%@ page contentType="text/html; charset=UTF-8" language="java" buffer="none" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Transito.*"%>
    
<%@ page import="org.apache.struts.util.LabelValueBean" %>
<%@ page import="java.util.ArrayList,Transito.*" %>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Types"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<head>
	<meta name="description" content="DUI" />
  <meta name="Author" content="Edgar Joaquin Arteaga Gutiérrez" lang="es">
    <meta name="copyright" content="&copy; 2015, Aduana Nacional de Bolivia" lang="es">
  <title>DETALLE D/E</title>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
  <link href="./css/layout.css" rel="stylesheet" type="text/css" />
  <link href="./css/content.css" rel="stylesheet" type="text/css" />
  <link href="./css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
</head>

<%
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
  
   
  String aduana = cs.getKey_cuo();
  String gestion = cs.getKey_year();
  String registro = cs.getKey_nber();
  String secuencia = cs.getKey_sec();
  
  DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
  Date date = new Date();
  String fecha = dateFormat.format(date);
  
  ClaseSql dc = new ClaseSql();
  Connection cn = null;
  CallableStatement manifiesto = null;
  CallableStatement call = null; 
  ResultSet rs = null;
  ResultSet rsItem = null;
  try{
    dc.getConexion();
    
    DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
    simbolos.setDecimalSeparator('.');
    DecimalFormat df2 = new DecimalFormat("###.##", simbolos);
    df2.setMaximumFractionDigits(2);
    df2.setMinimumFractionDigits(2);
    
    DecimalFormat df3 = new DecimalFormat("###.###", simbolos);
    df3.setMaximumFractionDigits(3);
    df3.setMinimumFractionDigits(3);
    
    DecimalFormat df5 = new DecimalFormat("###.#####", simbolos);
    df5.setMaximumFractionDigits(5);
    df5.setMinimumFractionDigits(5);
    
    manifiesto = dc.cn.prepareCall("{?=call pkg_despacho.imprime_parte_sec(?,?,?,?)}");
    manifiesto.registerOutParameter(1,OracleTypes.CURSOR);
    manifiesto.setString(2,aduana);            
    manifiesto.setString(3,gestion);
    manifiesto.setString(4,registro);
    manifiesto.setString(5,secuencia);
    manifiesto.execute();
    ResultSet rsMan = (ResultSet)manifiesto.getObject(1);
    String sw = "0";
    int i = 0;
    
     %>
     <br>
     <table width="80%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
 <%
    while(rsMan.next()) {
    
    
      String pkgParte  ="";
      
      pkgParte  ="{ ? = call pkg_despacho.detalle_cierre_docemb( ?,?,?,? ) }";
    
      call = dc.cn.prepareCall(pkgParte,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      call.setString(2, rsMan.getString("man_cuo"));
      call.setString(3, rsMan.getString("man_reg_year"));
      call.setString(4, rsMan.getString("man_reg_nber"));
      call.setString(5, rsMan.getString("man_bol_ref"));
   
      
      System.out.println(rsMan.getString("man_cuo") + " " + rsMan.getString("man_reg_year") + " " + rsMan.getString("man_reg_nber") + " " + rsMan.getString("man_bol_ref"));
                      
      call.registerOutParameter(1,OracleTypes.CURSOR);
      call.execute();
      rs = (ResultSet)call.getObject(1);
      if( !(rs == null || !rs.next() )) {
      
     
 
      if(sw.equals("0"))
      {
      sw = "1";
 %>
  <tr class="t14">
    <th align="center" rowspan="2">Aduana de destino</th>
    <th align="center" colspan="2">Parte de recepción</th>
    <th align="center" rowspan="2">Fecha de cierre</th>
    <th align="center" rowspan="2">Fecha de recepción</th>
    <th align="center" rowspan="2">Consignatario</th>
    <th align="center" rowspan="2">Campo 5to de Marcas y Bultos</th>
  </tr>
<tr class="t14">
<th align="center" >No. Registro</th>
<th align="center" >Documento de Embarque</th>
</tr>
<%
}
if( (i++)%2 == 0 ) {
%>
    <tr class="tr1">
<%      } else  {   %>
    <tr>
<%      }  %>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(14)%>&nbsp;</td>
</tr>
<%


	
       
        }else{
	%>
	
      <tr>
        <td class="informacion">No existe informaci&oacute;n registrada.</td>
      </tr>
 
	<%
	} 
        
        
        } 
        
         %>
         </table>
        <div style="page-break-after:always">&nbsp;</div> <%
}catch( Exception e ) {
  System.out.println("Error: "+e);
}    
finally {
  if (! (call == null))
    call.close();
  if (! (manifiesto == null))
    manifiesto.close();

  dc.getClose();
  call = null;
  manifiesto=null;
}
%>    
    
   