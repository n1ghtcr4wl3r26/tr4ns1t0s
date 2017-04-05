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
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar" %>

  <head>
    <link href="../css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>    
    <title>Tr@nsitos</title>
  </head>
<%
    SimpleDateFormat fFechah = new SimpleDateFormat("dd/MM/yyyy");
    Calendar fechah = Calendar.getInstance();
    fechah.setTime( fechah.getTime() );
    String fhoyh = fFechah.format( fechah.getTime() ); 
    
    ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
    String gestion = request.getAttribute("gestion")+"";
    String aduana = request.getAttribute("aduana")+"";
    String numeroregistro = request.getAttribute("numeroreg")+"";
    String codDepostitoTrans = request.getAttribute("coddeposito")+"";
%>
    <br/>
    <br/>
    <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">        
        <tr>
            <th class="c1" colspan="4">
                Informaci&oacute;n Registro LLegada a Dep&oacute;sito Transitorio
            </th>
        </tr> 
        <tr>
            <td  style="text-align:left"> <label>Fecha:</label></td>
            <td style="text-align:left"> <%=fhoyh%></td>            
        </tr>
        <tr>
            <td  style="text-align:left"> <label>Manifiesto:</label></td>
            <td style="text-align:left"> <%=gestion+"/"+aduana+"/"+numeroregistro%></td>            
        </tr>
        <tr>
            <td  style="text-align:left"> <label>C&oacute;digo Dep&oacute;sito Transitorio:</label></td>
            <td style="text-align:left"> <%=codDepostitoTrans%></td>            
        </tr> 
        </table>

