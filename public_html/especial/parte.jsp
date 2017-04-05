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
  <meta name="Author" content="Ruben Machaca" lang="es"/> 
  <title>PARTE DE RECEPCION</title>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
  <link href="../css/layout.css" rel="stylesheet" type="text/css" />
  <link href="../css/content.css" rel="stylesheet" type="text/css" />
</head>

<%
  String aduana = request.getParameter( "aduana" );
  String gestion = request.getParameter( "gestion" );
  String registro = request.getParameter( "registro" );
  
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
    
    manifiesto = dc.cn.prepareCall("{?=call pkg_despacho.imprime_parte(?,?,?)}");
    manifiesto.registerOutParameter(1,OracleTypes.CURSOR);
    manifiesto.setString(2,aduana);            
    manifiesto.setString(3,gestion);
    manifiesto.setString(4,registro);
    manifiesto.execute();
    ResultSet rsMan = (ResultSet)manifiesto.getObject(1);
    while(rsMan.next()) {
      String pkgParte  ="";
      pkgParte  ="{ ? = call pkg_despacho.dui_parte_recep( ?,?,?,? ) }";
    
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
%>
 <table width="800px" cellpadding="0" cellspacing="0" border="1" class="m">
  <tr>
    <td>
		<table >
		<tr><td class="texto1">No. Parte de Recepci&oacute;n - Item : </td><td><%=rs.getString(1)%></td></tr>
		<tr><td class="texto1">Fecha de llegada : </td><td><%=rs.getString(2)%></td></tr>  
		</table>
		</td>
  </tr>
  <tr>
    <td><table >
      <tr><td class="texto1">Almac&eacute;n / Ubicaci&oacute;n : </td><td><%=rs.getString(3)%></td></tr>
      <tr><td class="texto1">Fecha de Recepci&oacute;n : </td><td><%=rs.getString(4)%></td></tr>
			<tr><td class="texto1">Identificaci&oacute;n medio de transporte : </td><td><%=rs.getString(5)%></td></tr>
			<tr><td class="texto1">Consignatario : </td><td><%=rs.getString(6)%></td></tr>
      <%if (!rs.getString(7).equals("NINGUNO")){%>
			<tr><td class="texto1">Tipo de Recepci&oacute;n : </td><td><%=rs.getString(7)%></td></tr>
      <%}%>
			<tr><td class="texto1">Marcas y N&uacute;meros : </td><td>&nbsp;</td></tr>
			<tr><td><%=rs.getString(8)%></td><td><%=rs.getString(9)%></td></tr>
			<tr><td><%=rs.getString(10)%></td><td><%=rs.getString(11)%></td></tr>
			<tr><td><%=rs.getString(12)%></td><td>&nbsp;</td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><td class="texto1">Transportador : </td><td><%=rs.getString(13)%></td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
    </table></td>
  </tr>
	<tr>
    <td><table >
      <tr><td class="texto1" colspan="2" >RUBRO 1. Descripci&oacute;n de la Mercanc&iacute;a seg&uacute;n manifiesto.</td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
      <tr><td class="texto1">Descripci&oacute;n : </td><td><%=rs.getString(14)%></td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><td class="texto1">Tipo de Bultos : </td><td><%=rs.getString(15)%>&nbsp;&nbsp;<%=rs.getString(16)%></td></tr>
			<tr><td class="texto1" width="20%">Cantidad&nbsp;:&nbsp;<%=rs.getString(17)%></td><td class="texto1">Peso : <%=df2.format(Double.valueOf(rs.getString(18)).doubleValue())%></td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
    </table></td>
  </tr>
	<tr>
    <td><table width="90%" >
      <tr><td class="texto1" >RUBRO&nbsp;2.&nbsp;Control&nbsp;de&nbsp;Descarga.</td><td colspan="3" >&nbsp;</td></tr>
			<tr><td>&nbsp;</td><td style="font-weight: bold; text-align: right;">CANTIDAD</td><td>&nbsp;</td><td style="font-weight: bold; text-align: right;" >PESO</td></tr>
      <tr><td class="texto1">Recibida </td><td align="right"><%=rs.getString(19)%></td><td width="50">&nbsp;</td><td align="right"><%=df2.format(Double.valueOf(rs.getString(20)).doubleValue())%></td></tr>
			<tr><td class="texto1">Sobrante </td><td align="right"><%=rs.getString(21)%></td><td>&nbsp;</td><td align="right"><%=df2.format(Double.valueOf(rs.getString(22)).doubleValue())%></td></tr>
			<tr><td class="texto1">Faltante </td><td align="right"><%=rs.getString(23)%></td><td>&nbsp;</td><td align="right"><%=df2.format(Double.valueOf(rs.getString(24)).doubleValue())%></td></tr>
			<tr><td colspan="4">&nbsp;</td></tr>
    </table></td>
  </tr>
	<tr>
    <td><table width="90%">
      <tr><td class="texto1" colspan="2" >RUBRO 3. Controles de Vistos de Conformidad.</td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
      <tr><td class="texto1">Observaciones Responsable de Dep&oacute;sito : </td><td>&nbsp;</td></tr>
			<tr><td><%=rs.getString(25)%></td><td><%=rs.getString(26)%></td></tr>
			<tr><td><%=rs.getString(27)%></td><td><%=rs.getString(28)%></td></tr>
			<tr><td><%=rs.getString(29)%></td><td>&nbsp;</td></tr>
			<tr><td colspan="2"><%=rs.getString(30)%></td></tr>
    </table></td>
  </tr>
	<tr>
    <td><table width="90%">
      <tr><td class="texto1" colspan="3" >Observaciones Aduana :</td></tr>
			<tr><td colspan="3">____________________________________________________________________________________________________________________________________________________________________</td></tr>
			<tr><td colspan="3">____________________________________________________________________________________________________________________________________________________________________</td></tr>
      <tr><td class="texto1">Control Descarga : </td><td class="texto1">Transportador : </td><td class="texto1">Procesado por : </td></tr>
			<tr><td>____________________________________ </td><td>____________________________________</td><td>____________________________________</td></tr>
			<tr><td>C.I. ________________________________ </td><td>C.I. ________________________________</td><td>C.I. ________________________________</td></tr>
			<tr><td colspan="3"><%=fecha%></td></tr>
    </table></td>
  </tr>

</table>  
  
  <%
	}else{
	%>
	<table>
      <tr>
        <td class="informacion">No existe informaci&oacute;n registrada para el documento.</td>
      </tr>
  </table>
	<%
	} %> <div style="page-break-after:always">&nbsp;</div> <% } 
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