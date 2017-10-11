<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Reporte.*, Transito.*"%>
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
<%@ page import="java.text.SimpleDateFormat"%>

<script language="JavaScript" type="text/JavaScript">
<!--
function Boton( aduana, gestion, serial ) {
  f = document.forms[1];
  f.tipo.value = "1";
  f.nit.value = aduana;
  f.check1.value = gestion;
  f.check2.value = serial;
  f.submit();
}
//*******modificado edgar arteaga 06012014 para detalle de cierres por documentos de embarque  
function Boton2( aduana, gestion, serial, secuencia ) {
  f = document.forms[1];
  f.tipo.value = "2";
  f.nit.value = aduana;
  f.check1.value = gestion;
  f.check2.value = serial;
  f.check3.value = secuencia;
  f.submit();
//*******  
}
//*******modificado edgar arteaga 01092017 para detalle de documentos de embarque  
function Boton3( aduana, gestion, serial, secuencia ) {
  f = document.forms[1];
  f.tipo.value = "3";
  f.nit.value = aduana;
  f.check1.value = gestion;
  f.check2.value = serial;
  f.check3.value = secuencia;
  f.submit();
//*******  
}
-->
</script>

<html:form action="/ReporteAction" target="_blank">
  <html:hidden property="tipo"/>
  <html:hidden property="nit"/>
  <html:hidden property="check1"/>
  <html:hidden property="check2"/>
  <html:hidden property="check3"/>
</html:form>
<%
 ReporteForm bReporte = (ReporteForm) request.getAttribute("ReporteForm");

 if( bReporte.getCheck6().equals( "on" ) )
 {
 int i=0;
 ClaseSql sql = new ClaseSql();
  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");
 
 try
  {
  
    sql.getConexion();
    CallableStatement call = null;
    call = sql.cn.prepareCall( "{? = call PKG_despacho.transitos_con_parte( ?,?,?,? ) }" );
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, bReporte.getI_aduana() );
    call.setString( 3, bReporte.getD_aduana() );
    call.setString( 4, bReporte.getI_fecha() );
    call.setString( 5, bReporte.getD_fecha() );
    
    call.execute();
    
    %>
<table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>Reporte de Tr&aacute;nsito</th></tr>
  </table>
  <table width="100%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">  
    <tr class="t14">
      <th align="center" rowspan="2">Manifiesto</th>                    
      <th align="center" rowspan="2">Empresa</th>
      <th align="center" rowspan="2">Placa</th>
      <th align="center" rowspan="2">Consignatario</th>
      <th align="center" rowspan="2">Aduana Partida</th>
      <th align="center" rowspan="2">Fecha Partida</th>
      
      <th align="center" rowspan="2">Aduana de destino</th>
   <%--   <th align="center" rowspan="2">Aduana de cierre</th> --%>
      <th align="center" rowspan="2">Fecha de cierre</th>
      
      <th align="center" colspan="2">Parte de recepci&oacute;n</th>
      <th align="center" rowspan="2">Fecha de recepci&oacute;n</th>
      
    </tr> 
 
<tr class="t14">
<th align="center" >No. Registro</th>
<th align="center" >Documento de Embarque</th>
<tr>
<%
String StrSql2;

  ResultSet rs = ( ResultSet ) call.getObject( 1 );
  if( ! ( rs == null || !rs.next() ) ) {
    do {
    StrSql2 = "'" + rs.getString( 1 ) + "', '" + rs.getString( 2 ) + "', " + rs.getString( 3 );
        if( (i++)%2 == 0 ) {
%>
    <tr class="tr1">
<%      } else  {   %>
    <tr>
<%      }  %>
    <td><a href="javascript:Boton(<%= StrSql2 %>)"><%=rs.getString( 1 )%> / <%=rs.getString( 2 )%> - <%=rs.getString( 3 )%> - <%=rs.getString( 4 )%></a></td>
  
    <td><%=rs.getString( 5 ) %></td>
    <td><%=rs.getString( 6) %></td>
    <td><%=rs.getString( 18 ) %></td>
    <td><%=rs.getString( 8 ) %></td>
    <td><%=rs.getString( 7 ) %></td>
    <td><%=rs.getString( 10 ) %></td>
   <%-- <td><%=rs.getString( 11) %></td> --%>
    <td><%=rs.getString( 9 ) %></td>
    <td><%=rs.getString( 15) %></td>
    <td><%=rs.getString(14 ) %></td>
    <td><%=rs.getString(17 ) %></td>
   
    
    
  </tr>
<%
    }while( rs.next() );
  }
%>
  <tr>
    <td colspan="8"><strong>Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %></td>
    <td colspan="4">Total : <%=i%></td>
  </tr>
</table>
<%} catch (Exception er)  {
    er.printStackTrace();
  } 
  finally  {
    sql.getClose();
  }
    
    
    
    
 }else if(1==0) // if( bReporte.getCheck7().equals( "on" ) )
 {
 
 
ClaseSql sql = new ClaseSql();
  String StrSql = "";
  String cadena = "";
  int i = 0;

  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");

  try {
    sql.getConexion();
%>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>Reporte de Tr&aacute;nsitos Sujetos al D.S. 2295 por Documento de Embarque</th></tr>
  </table>
  <table width="100%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
    <tr class="t14">
      <th align="center">Manifiesto</th>                    
      <th align="center">Empresa</th>
      <th align="center">Placa</th>
      <th align="center">Fecha Partida</th>
      <th align="center">Aduana Partida</th>
      <th align="center">Fecha Destino</th>
      <th align="center">Aduana Destino</th> 
      <th align="center">Estado</th>
      <th align="center">Documento de Embarque</th>
      <th align="center">Consignatario</th>
      <th align="center">Descripci&oacute;n Mercader&iacute;a</th>
      <th align="center">Tipo</th>
    </tr> 
<% 





    StrSql = "SELECT a.key_cuo, a.car_reg_year, a.car_reg_nber, a.key_secuencia, " +
      "cg.car_car_cod || ': ' || cg.car_car_nam, cg.car_id_trp, TO_CHAR (a.tra_fec_ini, 'dd/mm/yyyy HH24:mi') AS tra_fec_ini, " +
      "a.tra_cuo_ini || ': ' || b.cuo_nam AS tra_cuo_ini, NVL (TO_CHAR (a.tra_fec_des, 'dd/mm/yyyy HH24:mi'), " +
      "TO_CHAR (a.tra_fec_est, 'dd/mm/yyyy HH24:mi') ) AS tra_fec_des, DECODE (a.tra_cuo_des, " +
      "NULL, a.tra_cuo_est || ': ' || c.cuo_nam, a.tra_cuo_des || ': ' || d.cuo_nam ) AS tra_cuo_des, " +
      "DECODE (a.tra_tipo, 23, 'Forzoso', 24, 'Normal', 28, 'Transbordo', 31, 'Despacho Anticipado',' ' ) AS tra_tipo, " +
      "DECODE (a.tra_fec_des, NULL, 2, a.tra_loc) AS loc, TRUNC (SYSDATE - a.tra_fec_est) AS dias, a.lst_ope " +
      " , cbg.key_bol_ref, nvl(cbg.carbol_shp_mark1,' ')||nvl(cbg.carbol_shp_mark2,' ')||' - '||nvl(cbg.carbol_good1,' ')||nvl(cbg.carbol_good2,' '), cbg.carbol_shp_mark5,  " +
      " cbg.carbol_cons_cod, cbg.carbol_cons_nam, tiene_acta(a.key_cuo, a.car_reg_year, a.car_reg_nber, a.key_secuencia) acta " +
      "FROM transitos.tra_pla_rut a, ops$asy.uncuotab b, ops$asy.uncuotab c, ops$asy.uncuotab d, ops$asy.car_gen cg, ops$asy.car_bol_gen cbg " +
      "WHERE a.key_cuo = cg.key_cuo AND a.car_reg_year = cg.car_reg_year " +
      "AND a.car_reg_nber = cg.car_reg_nber  and  cg.key_cuo = cbg.key_cuo and  cg.key_voy_nber = cbg.key_voy_nber and  cg.key_dep_date = cbg.key_dep_date AND a.tra_cuo_ini LIKE '" + bReporte.getI_aduana() + 
      "' AND NVL (a.tra_cuo_des, a.tra_cuo_est) LIKE '" + bReporte.getD_aduana() + "' AND TRUNC (a.tra_fec_ini) BETWEEN TO_DATE ('" +
      bReporte.getI_fecha() + "', 'dd/mm/yyyy') AND TO_DATE ('" + bReporte.getD_fecha() + "', 'dd/mm/yyyy')    " +
      " and cbg.carbol_shp_mark5 like '%DS2295%'    AND a.tra_cuo_ini = b.cuo_cod AND b.lst_ope = 'U' " +
      "AND NVL (a.tra_cuo_des, a.tra_cuo_est) = c.cuo_cod AND c.lst_ope = 'U' AND a.tra_cuo_des = d.cuo_cod(+) AND d.lst_ope(+) = 'U'" +
      " and a.tra_num= 0 and a.lst_ope = 'U'  and a.key_secuencia <> 0  ";

                                   
    StrSql = StrSql +  " ORDER BY a.key_cuo, a.car_reg_year, a.car_reg_nber, a.key_secuencia";  
    
    ResultSet rs = ( ResultSet ) sql.st.executeQuery( StrSql );
    
    if( ! ( rs == null || !rs.next() ) ) {
      do{
        StrSql = "'" + rs.getString( 1 ) + "', '" + rs.getString( 2 ) + "', " + rs.getString( 3 );
        if( (i++)%2 == 0 ) {
%>
    <tr class="tr1">
<%      } else  {   %>
    <tr>
<%      }  %>
    <td><a href="javascript:Boton(<%= StrSql %>)"><%=rs.getString( 1 )%> / <%=rs.getString( 2 )%> - <%=rs.getString( 3 )%> - <%=rs.getString( 4 )%></a></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(6)%></td>
    <td><%=rs.getString(7)%></td>
    <td><%=rs.getString(8)%></td>
    <td><%=rs.getString(9)%></td>
    <td><%=rs.getString(10)%></td>
<%
      if( rs.getString( "lst_ope" ).equals("D") ) {
        StrSql ="Cancelado";
      }else      
      if( rs.getString( "lst_ope" ).equals("M") ) {
        StrSql ="Sin salida de puerto";
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
              if(rs.getString(20).equals("-"))
              StrSql ="Fuera de Plazo";
              else
              StrSql =rs.getString(20).toString();
              
          }
        }
      }
%>
    <td><%=StrSql%></td>
    <td><%=rs.getString(15)%></td>
    
    <td><%=rs.getString(18)%>:<%=rs.getString(19)%></td>
    <td><%=rs.getString(16)%></td>
    <td><%=rs.getString(17)%></td>
    
    
  </tr> 
<%  } while (rs.next());   }






%>





  <tr>
    <td colspan="7"><strong>Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %></td>
    <td colspan="5">Total Documentos de Embarque : <%=i%></td>
  </tr>
</table>
<%   
  } catch (Exception er)  {
    er.printStackTrace();
  } 
  finally {
    sql.getClose();
  }
  
 
    
    
 }
 
 
 
 
 
 
else
{

ClaseSql sql = new ClaseSql();
  String StrSql = "";
  String cadena = "";
  int i = 0;

  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");

  try {
    sql.getConexion();
%>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>Reporte de Tr&aacute;nsito</th></tr>
  </table>
  <table width="100%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
    <tr class="t14">
      <th rowspan="2" align="center">Manifiesto</th>                    
      <th rowspan="2" align="center">Empresa</th>
      <th rowspan="2" align="center">Placa</th>
      <th rowspan="2" align="center">Fecha Partida</th>
      <th rowspan="2" align="center">Aduana Partida</th>
      <th rowspan="2" align="center">Fecha Destino</th>
      <th rowspan="2" align="center">Aduana Destino</th> 
      <th rowspan="2" align="center">Estado</th>
      <%
      if( bReporte.getCheck3().equals( "on" ) ){
        %>
        <th rowspan="2" align="center">Acta de Intervenci&oacute;n</th>
        <th rowspan="2" align="center">Resoluci&oacute;n</th>
        <th rowspan="2" align="center">Justificativo</th>
        <%
      }
      %>
      <th colspan="2" align="center">DETALLE</th>
    </tr>
    <tr>
      <th align="center">Detalle D/E</th>
      <th>Campo 5to de Marcas y Bultos</th>
    </tr> 
<% 





    StrSql = "SELECT a.key_cuo, a.car_reg_year, a.car_reg_nber, a.key_secuencia, " +
      "cg.car_car_cod || ': ' || cg.car_car_nam, cg.car_id_trp, TO_CHAR (a.tra_fec_ini, 'dd/mm/yyyy HH24:mi') AS tra_fec_ini, " +
      "a.tra_cuo_ini || ': ' || b.cuo_nam AS tra_cuo_ini, NVL (TO_CHAR (a.tra_fec_des, 'dd/mm/yyyy HH24:mi'), " +
      "TO_CHAR (a.tra_fec_est, 'dd/mm/yyyy HH24:mi') ) AS tra_fec_des, DECODE (a.tra_cuo_des, " +
      "NULL, a.tra_cuo_est || ': ' || c.cuo_nam, a.tra_cuo_des || ': ' || d.cuo_nam ) AS tra_cuo_des, " +
      "DECODE (a.tra_tipo, 23, 'Forzoso', 24, 'Normal', 28, 'Transbordo', 31, 'Despacho Anticipado',' ' ) AS tra_tipo, " +
      "DECODE (a.tra_fec_des, NULL, 2, a.tra_loc) AS loc, TRUNC (SYSDATE - a.tra_fec_est) AS dias, a.lst_ope ";
      
     
      
      if( bReporte.getCheck3().equals( "on" ) ){
        StrSql = StrSql +  ", nvl(ac.tac_acta,'&nbsp;') acta, nvl(Spcai.f_resolucion_tna@DBAPP.SPCAI(ac.tac_acta),'&nbsp;') resolucion, pkg_justificativos.devuelve_justificativo(a.key_cuo, a.car_reg_year, a.car_reg_nber, a.tra_cuo_est) justificativo, cg.key_cuo car_adu, cg.key_voy_nber car_voy, to_char(cg.key_dep_date,'dd/mm/yyyy') car_dep, a.tra_cuo_est cuo_est FROM transitos.tra_pla_rut a, ops$asy.uncuotab b, ops$asy.uncuotab c, ops$asy.uncuotab d, ops$asy.car_gen cg, transitos.tra_acta ac WHERE "+
        " a.key_cuo = ac.key_cuo(+) AND a.car_reg_year = ac.car_reg_year(+) AND a.car_reg_nber = ac.car_reg_nber(+) AND a.key_secuencia = ac.key_secuencia(+) AND ac.tac_num(+) = 0 AND ac.lst_ope(+) = 'U' AND  ";
      }
      else{ 
        StrSql = StrSql +  " , cg.key_cuo car_adu, cg.key_voy_nber car_voy, to_char(cg.key_dep_date,'dd/mm/yyyy') car_dep, a.tra_cuo_est cuo_est FROM transitos.tra_pla_rut a, ops$asy.uncuotab b, ops$asy.uncuotab c, ops$asy.uncuotab d, ops$asy.car_gen cg WHERE ";
      }
      
      StrSql = StrSql + " a.key_cuo = cg.key_cuo AND a.car_reg_year = cg.car_reg_year " +
      "AND a.car_reg_nber = cg.car_reg_nber AND a.tra_cuo_ini LIKE '" + bReporte.getI_aduana() + 
      "' AND NVL (a.tra_cuo_des, a.tra_cuo_est) LIKE '" + bReporte.getD_aduana() + "' AND TRUNC (a.tra_fec_ini) BETWEEN TO_DATE ('" +
      bReporte.getI_fecha() + "', 'dd/mm/yyyy') AND TO_DATE ('" + bReporte.getD_fecha() + "', 'dd/mm/yyyy') " +
      "AND a.tra_cuo_ini = b.cuo_cod AND b.lst_ope = 'U' " +
      "AND NVL (a.tra_cuo_des, a.tra_cuo_est) = c.cuo_cod AND c.lst_ope = 'U' AND a.tra_cuo_des = d.cuo_cod(+) AND d.lst_ope(+) = 'U'" +
      " and a.tra_num= 0 and not a.lst_ope = 'M' and ( ";

    if( bReporte.getCheck5().equals( "on" ) )
      cadena = cadena + " (a.lst_ope = 'D') or ";
    else
      cadena = cadena + " (a.lst_ope = 'U') and";
    if( bReporte.getCheck1().equals( "on" ))
      cadena = cadena + " (tra_loc='1') or";
    if( bReporte.getCheck2().equals( "on" ))
      cadena = cadena + " (tra_loc='0' AND not tra_fec_des is null) or ";
    if( bReporte.getCheck3().equals( "on" ) )
      cadena = cadena + " (ROUND(SYSDATE- a.tra_fec_est) >= 0 AND tra_fec_des is null ) or ";
    if( bReporte.getCheck4().equals( "on" ) )
      cadena = cadena + " (ROUND(SYSDATE- a.tra_fec_est) < 0 AND tra_fec_des is null ) or ";

    cadena = cadena.substring( 0, cadena.length() - 3 ); 
                                   
    StrSql = StrSql + cadena + ") ORDER BY a.key_cuo, a.car_reg_year, a.car_reg_nber, a.key_secuencia";  
    
    ResultSet rs = ( ResultSet ) sql.st.executeQuery( StrSql );
    
    if( ! ( rs == null || !rs.next() ) ) {
      do{
        StrSql = "'" + rs.getString( 1 ) + "', '" + rs.getString( 2 ) + "', " + rs.getString( 3 );
        if( (i++)%2 == 0 ) {
%>
    <tr class="tr1">
<%      } else  {   %>
    <tr>
<%      }  %>
    <td><a href="javascript:Boton(<%= StrSql %>)"><%=rs.getString( 1 )%> / <%=rs.getString( 2 )%> - <%=rs.getString( 3 )%> - <%=rs.getString( 4 )%></a></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(6)%></td>
    <td><%=rs.getString(7)%></td>
    <td><%=rs.getString(8)%></td>
    <td><%=rs.getString(9)%></td>
    <td><%=rs.getString(10)%></td>
<%
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
              StrSql ="Fuera de Plazo";
              //StrSql ="Fuera de Plazo";
          }
        }
      }
    %>
    <td><%=StrSql%></td>
    <%
    if( bReporte.getCheck3().equals( "on" ) ){
        %>
        <td><%=rs.getString("acta")%></td>
        <td><%=rs.getString("resolucion")%></td>
        <td><%=rs.getString("justificativo")%></td>
        <%
    }    
    String StrSql2 = "'" + rs.getString( 1 ) + "', '" + rs.getString( 2 ) + "', " + rs.getString( 3 )+", " + rs.getString( 4 );
    
    if(StrSql.equals("Concluido"))
    {
    %>
    <td colspan="2"><a href="javascript:Boton2(<%= StrSql2 %>)">Detalle</a></td>
    <%
    }
    else
    {
    if(Util.CantidadDocEmbPorTramo(rs.getString("car_adu"),rs.getString("car_voy"),rs.getString("car_dep"),rs.getString("cuo_est")).equals("1")){
    %>
    <%=Util.DocEmbCampo5to(rs.getString(2),rs.getString(1),rs.getString(3),rs.getString(4))%>
    <%
    } else {
    %>
    <td colspan="2"><a href="javascript:Boton3(<%= StrSql2 %>)">Detalle</a></td>
    <%}
    }
    %>
  </tr> 
<%  } while (rs.next());   }





 if( bReporte.getCheck3().equals( "on" ) ){
%>
  <tr>
    <td colspan="9"><strong>Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %></td>
    <td colspan="4">Total : <%=i%></td>
  </tr>
<%} else{
%>
  <tr>
    <td colspan="6"><strong>Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %></td>
    <td colspan="4">Total : <%=i%></td>
  </tr>
<%}
%>
  
  
</table>
<%   
  } catch (Exception er)  {
    er.printStackTrace();
  } 
  finally {
    sql.getClose();
  }
  
  
  }
%>
</body>