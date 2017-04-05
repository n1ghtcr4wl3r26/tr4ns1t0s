<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*,Transito.*"%>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="oracle.jdbc.pool.OraclePooledConnection"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/generica.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/datetimepicker_css.js"></script>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
  <meta name="copyright" content="© 2015, Aduana Nacional de Bolivia" lang="es"/>
  <link href="css/Reporte.css" rel="stylesheet" type="text/css" media="screen"/>
</head>

<%  
  /*ClaseSession cs = (ClaseSession) request.getSession().getAttribute("ClaseSession");
  String fecha_ini = request.getParameter( "ini" );
  String fecha_fin = request.getParameter( "fin" );
  DataSource ds = null;
  Connection cn = null;
  Statement st = null;
  int i=0,j=0,k=0,x=0,y=0,z=0,con;  
  int hay_loc =0;
  int hay_dia =0;
  String localizaciones[] = new String[500];
  String descripciones[] = new String[500];  
  String declaraciones[] = new String[500];  
  String dias[] = new String[500];    
  String u_declaraciones[] = new String[500];    
  String d_declaraciones[] = new String[500];      
  String f_declaraciones[] = new String[500];      
  String h_declaraciones[] = new String[500]; 
  String hm_declaraciones[] = new String[500];
  String us_declaraciones[] = new String[500];
  String h_8="",h_9="",h_10="",h_11="",h_12="",h_13="",h_14="",h_15="",h_16="",h_17="",h_18="",h_19="",h_20="";
  String n_dia ="";
  String n_localizacion="";
  String d_localizacion="";
  try
  {
    InitialContext ic = new InitialContext();
    ds = (DataSource)ic.lookup("jdbc/mira");
    cn = (Connection)ds.getConnection();
    st = cn.createStatement(); 

    CallableStatement call = null;
    call = cn.prepareCall( "{ ? = call PKG_MIRA.rep_aforo( ?, ?, ?, ?, ? ) }" );
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.registerOutParameter( 5, OracleTypes.CURSOR );
    call.registerOutParameter( 6, OracleTypes.CURSOR );
    call.setString( 2, cs.getAduana() );
    call.setString( 3, fecha_ini );    
    call.setString( 4, fecha_fin );        
    call.execute();

    ResultSet rs = (ResultSet) call.getObject( 1 );    
    if( !(rs == null || !rs.next() )) {
     do {
     declaraciones[i]=rs.getString(1)+"/"+rs.getString(2)+"/C-"+rs.getString(3);
     u_declaraciones[i]=rs.getString(4);
     f_declaraciones[i]=rs.getString(5);
     h_declaraciones[i]=rs.getString(6);
     hm_declaraciones[i]=rs.getString(7);
     d_declaraciones[i]=rs.getString(8);
     us_declaraciones[i]=rs.getString(9);
     i++;
     }while( rs.next() );
    }
    
    ResultSet rs1 = (ResultSet) call.getObject( 5 );    
    if( !(rs1 == null || !rs1.next() )) {
     do {
     localizaciones[j]=rs1.getString(1);
     descripciones[j]=rs1.getString(2);
     j++;
     }while( rs1.next() );
    }
    
    ResultSet rs2 = (ResultSet) call.getObject( 6 );    
    if( !(rs2 == null || !rs2.next() )) {
     do {
     dias[k]=rs2.getString(1);
     k++;
     }while( rs2.next() );
    }    */
%>
<html:form action="/EtiquetaLoteAction">
  <table cellspacing="2" cellpadding="3" border="0" width="90%" id="tabla-a">
  <thead>
      <tr><th colspan="4">INGRESE LA INFORMACI&Oacute;N :</th></tr>
  </thead>
  <tbody>
    <tr>
      
      <th><label>*</label>Gesti&oacute;n::</th>
      <td><html:text maxlength="10" size="20" styleId="gestion" property="gestion" readonly="true" value="0"/></td>
    </tr>
    <tr>
      <th><label>*</label>Vigencia Desde:</th>
      <td><html:text maxlength="10" size="20" styleId="fdesde" property="fdesde" readonly="true" /><img src="images/cal.gif" id="imcal" style="cursor:pointer;" onclick="javascript:NewCssCal('fdesde','ddMMyyyy')" /></td>
      <th><label>*</label>Hasta:</th>
      <td><html:text maxlength="10" size="20" styleId="fhasta" property="fhasta" readonly="true" /><img src="images/cal.gif" id="imcal" style="cursor:pointer;" onclick="javascript:NewCssCal('fhasta','ddMMyyyy')" /></td>
    </tr>
    <tr>
      <th><label>*</label>Cantidad:</th>
      <td>
            <select name="cantidad" Id="cantidad">
                <option value="">&lt;-- Seleccione Cantidad --&gt;</option>
                <option value="20">->20</option>
                <option value="50">->50</option>
                <option value="100">->100</option>
            </select>
      </td>
      <th><label>*</label>Tipo de Impresora:</th>
      <td><html:text maxlength="10" size="20" styleId="impresora" property="impresora"/></td>
    </tr>
    <tr>
      <th colspan="4">
      <input type="button" name="Generar" value="Generar" onclick="imprimire(form);"/></th>
    </tr>
    <tr>
      <td colspan="4">(<label>*</label>) Campos Obligatorios</td>
    </tr>
    </tbody>
  </table>
<script language="JavaScript" type="text/JavaScript">
<!--
var f = document.forms["EtiquetaLoteForm"];
f.aduana.focus();
-->
</script>

</html:form>
<% /* }
            catch( Exception e ) {
              System.out.println( e.getMessage() );
            }
              finally  {
               /* sql.getClose();*/
             /* }*/
        %>