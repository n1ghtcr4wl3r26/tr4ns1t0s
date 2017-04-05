<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html;charset=UTF-8"%>
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



ClaseSql sql = new ClaseSql();
  String StrSql = "";
  String cadena = "";
  int i = 0;

  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");

  try {
    sql.getConexion();
    
    String aduini = bReporte.getI_aduana();
    String adufin = bReporte.getD_aduana();
    if(aduini.equals("%"))
    aduini= "Todas las Aduanas";
    if(adufin.equals("%"))
    adufin= "Todas las Aduanas";
    
    
%>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center" class="marco"  >
    <tr class="t14"><th colspan="4"><strong>Reporte de Tr&aacute;nsitos de Puerto</strong></th></tr>
    <tr class="t15"><th>Código Aduana Partida:</th><th><%=aduini%></th><th>Código Aduana Destino:</th><th><%=adufin%></th></tr>
    <tr class="t15"><th>Fecha de Asignación Ruta Plazo: desde</th><th><%=bReporte.getI_fecha()%></th><th>hasta</th><th><%=bReporte.getD_fecha()%></th></tr>
    
  </table>
  <table width="100%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
    <tr class="t14">
      <th align="center">Manifiesto</th>                    
      <th align="center">Empresa</th>
      <th align="center">Placa</th>
      <th align="center">Aduana Partida</th>
      <th align="center">Aduana Destino</th> 
      <th align="center">Estado</th>
      <th align="center">Fecha de Registro</th>
      <th align="center">Fecha autorizaci&oacute;n manifiesto</th>
      <th align="center">Fecha salida puerto</th>
      <th align="center">Fecha de Destino</th>
    </tr> 
<% 



  StrSql = " SELECT   a.key_cuo, " +
        "   a.car_reg_year, " +
        "     a.car_reg_nber, " +
        "     a.key_secuencia, " +
        "     cg.car_car_cod || ': ' || cg.car_car_nam, " +
        "     cg.car_id_trp, " +
        "     TO_CHAR (a.tra_fec_ini, 'dd/mm/yyyy HH24:mi') AS tra_fec_ini, " +
        "     a.tra_cuo_ini || ': ' || b.cuo_nam AS tra_cuo_ini, " +
          
        "     DECODE (a.tra_cuo_des, " +
        "             NULL, a.tra_cuo_est || ': ' || c.cuo_nam, " +
        "             a.tra_cuo_des || ': ' || d.cuo_nam) " +
        "         AS tra_cuo_des, " +
        "     DECODE (a.tra_tipo, 23, 'Forzoso', 24, 'Normal',  28, 'Transbordo',  31, 'Despacho Anticipado',  ' ') " +
        "         AS tra_tipo, " +
        "     DECODE (a.tra_fec_des, NULL, 2, a.tra_loc) AS loc, " +
        "     TRUNC (SYSDATE - a.tra_fec_est) AS dias, " +
        "      a.lst_ope, " +
        "     DECODE ( a.lst_ope, 'D','Cancelado','M', 'Sin Salida de Puerto', 'U', " +
        "         DECODE ( DECODE (a.tra_fec_des, NULL, 2, a.tra_loc), 1, 'Concluido',  0, 'Sin Lozalizacion', 2, " +
        "             CASE    WHEN TRUNC (SYSDATE - a.tra_fec_est) <= 0 " +
       "                  THEN               'En tr&aacute;nsito' " +
       "                  ELSE       'Fuera de Plazo'            END),    '-') " +
       "          estado_final, " +
        "     TO_CHAR (cg.car_reg_date, 'dd/mm/yyyy') ||' '|| cg.car_reg_time fecha_registro, " +
        "     TO_CHAR (cr.fec_ini, 'dd/mm/yyyy HH24:mi')  fecha_autorizacion_manifiesto, " +
        "     NVL ( " +
        "         (SELECT   TO_CHAR (tp.tra_fec_ini, 'dd/mm/yyyy HH24:mi') " +
        "            FROM   tra_pla_rut tp, tra_micanticipado tm " +
        "           WHERE       tp.key_cuo = tm.key_cuo " +
        "                   AND tp.car_reg_year = tm.car_reg_year " +
        "                   AND tp.car_reg_nber = tm.car_reg_nber " +
        "                   AND tp.key_secuencia = 1 " +
        "                   AND tp.tra_num = 0 " +
        "                   AND tm.mic_lst_ope = 'U' " +
        "                   AND tm.mic_num = 0 " +
        "                   AND tp.key_cuo = a.key_cuo " +
        "                   AND tp.car_reg_year = a.car_reg_year " +
        "                   AND tp.car_reg_nber = a.car_reg_nber), " +
        "         '-') " +
        "         fecha_salida_puerto, " +
        "          NVL (TO_CHAR (a.tra_fec_des, 'dd/mm/yyyy HH24:mi'), " +
        "          TO_CHAR (a.tra_fec_est, 'dd/mm/yyyy HH24:mi')) " +
        "         AS tra_fec_des , tiene_acta(a.key_cuo, a.car_reg_year, a.car_reg_nber, a.key_secuencia) acta " +
    "  FROM   transitos.tra_pla_rut a, " +
        "     ops$asy.uncuotab b, " +
        "     ops$asy.uncuotab c, " +
        "     ops$asy.uncuotab d, " +
        "     ops$asy.car_gen cg,  " +
        "        (SELECT   x.key_cuo, x.car_reg_year, x.car_reg_nber, min(x.tra_fec_ini) fec_ini " +
        "             FROM   transitos.tra_pla_rut x " +
        "         WHERE   x.tra_cuo_ini LIKE '" + bReporte.getI_aduana() + "' " +
        "                 AND NVL (x.tra_cuo_des, x.tra_cuo_est) LIKE '" + bReporte.getD_aduana() + "' " +
        "                 AND x.tra_num in (1,0)  " +
        "                 group by x.key_cuo, x.car_reg_year, x.car_reg_nber  " +
        "                 having TRUNC (min(x.tra_fec_ini)) BETWEEN TO_DATE ('" + bReporte.getI_fecha() + "', " +
        "                                                             'dd/mm/yyyy') " +
        "                                                AND  TO_DATE ('" + bReporte.getD_fecha() + "', " +
        "                                                              'dd/mm/yyyy') ) cr " +
        "   WHERE       a.key_cuo = cg.key_cuo " +
        "     AND a.car_reg_year = cg.car_reg_year " +
        "     AND a.car_reg_nber = cg.car_reg_nber " +
        "     AND a.tra_cuo_ini LIKE '" + bReporte.getI_aduana() + "' " +
        "     AND NVL (a.tra_cuo_des, a.tra_cuo_est) LIKE '" + bReporte.getD_aduana() + "' " +
       
        "     and a.key_cuo = cr.key_cuo " +
        "        AND a.car_reg_year = cr.car_reg_year " +
        "        AND a.car_reg_nber = cr.car_reg_nber " +
       
        "     AND a.tra_cuo_ini = b.cuo_cod " +
        "     AND b.lst_ope = 'U' " +
        "     AND NVL (a.tra_cuo_des, a.tra_cuo_est) = c.cuo_cod " +
        "     AND c.lst_ope = 'U' " +
        "     AND a.tra_cuo_des = d.cuo_cod(+) " +
        "     AND d.lst_ope(+) = 'U' " +
        "     AND a.tra_num = 0 " +
"  ORDER BY   a.key_cuo, " +
        "     a.car_reg_year, " +
        "     a.car_reg_nber, " +
        "     a.key_secuencia ";

      
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
    
    <td><%=rs.getString(8)%></td>
    <td><%=rs.getString(9)%></td>
    <% if(rs.getString(19).equals("-")) {
    String prueba;
    prueba = rs.getString(19).toString();
    %>
    <td><%=rs.getString(14)%></td>
    <%} else {
    String prueba;
    prueba = rs.getString(19).toString();
    
    %>
    <td><%=rs.getString(19)%></td>
    <%}%>
    <td><%=rs.getString(15)%></td>
    <td><%=rs.getString(16)%></td>
    <td><%=rs.getString(17)%></td>
    <td><%=rs.getString(18)%></td>
    
  </tr> 
<%  } while (rs.next());   }






%>





  <tr>
    <td colspan="8"><strong>Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %></td>
    <td colspan="2">Total : <%=i%></td>
  </tr>
</table>
<%   
  } catch (Exception er)  {
    er.printStackTrace();
  } 
  finally {
    sql.getClose();
  }
  
  
%>
</body>