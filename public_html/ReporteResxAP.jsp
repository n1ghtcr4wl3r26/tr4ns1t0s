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
<%ClaseSql sql = new ClaseSql();
  String StrSql = "";
  String cadena = "";
  int i = 0;
  int tot = 0;
  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");

  try {
    sql.getConexion();
%>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>Reporte resumen de Tr&aacute;nsitos por Aduana de Partida</th></tr>
  </table>
  <table width="100%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
    <tr class="t14">
      <th align="center">Aduana Partida</th>
      <th align="center">Cantidad de Tr&aacute;nsitos</th>                    
    </tr> 
<%  ReporteForm bReporte = (ReporteForm) request.getAttribute("ReporteForm");
    StrSql = "select  tra_cuo_ini,count(*) cant from("+
      "SELECT a.key_cuo, a.car_reg_year, a.car_reg_nber, a.key_secuencia, " +
      "cg.car_car_cod || ': ' || cg.car_car_nam, cg.car_id_trp, TO_CHAR (a.tra_fec_ini, 'dd/mm/yyyy HH24:mi') AS tra_fec_ini, " +
      "a.tra_cuo_ini || ': ' || b.cuo_nam AS tra_cuo_ini, NVL (TO_CHAR (a.tra_fec_des, 'dd/mm/yyyy HH24:mi'), " +
      "TO_CHAR (a.tra_fec_est, 'dd/mm/yyyy HH24:mi') ) AS tra_fec_des, DECODE (a.tra_cuo_des, " +
      "NULL, a.tra_cuo_est || ': ' || c.cuo_nam, a.tra_cuo_des || ': ' || d.cuo_nam ) AS tra_cuo_des, " +
      "DECODE (a.tra_tipo, 23, 'Forzoso', 24, 'Normal', 28, 'Transbordo', 31, 'Despacho Anticipado', ' ' ) AS tra_tipo, " +
      "DECODE (a.tra_fec_des, NULL, 2, a.tra_loc) AS loc, TRUNC (SYSDATE - a.tra_fec_est) AS dias, a.lst_ope " +
      "FROM transitos.tra_pla_rut a, ops$asy.uncuotab b, ops$asy.uncuotab c, ops$asy.uncuotab d, ops$asy.car_gen cg " +
      "WHERE a.key_cuo = cg.key_cuo AND a.car_reg_year = cg.car_reg_year " +
      "AND a.car_reg_nber = cg.car_reg_nber " + 
      " AND TRUNC (a.tra_fec_ini) BETWEEN TO_DATE ('" +
      bReporte.getI_fecha() + "', 'dd/mm/yyyy') AND TO_DATE ('" + bReporte.getD_fecha() + "', 'dd/mm/yyyy') " +
      "AND a.tra_cuo_ini = b.cuo_cod AND b.lst_ope = 'U' " +
      "AND NVL (a.tra_cuo_des, a.tra_cuo_est) = c.cuo_cod AND c.lst_ope = 'U' AND a.tra_cuo_des = d.cuo_cod(+) AND d.lst_ope(+) = 'U'" +
      " and a.tra_num= 0 and not a.lst_ope = 'M' and a.key_secuencia <> 0 and ( ";

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
                                   
    StrSql = StrSql + cadena + ") ) a group by tra_cuo_ini";  

//    System.out.println(StrSql);
    ResultSet rs = ( ResultSet ) sql.st.executeQuery( StrSql );
    
    if( ! ( rs == null || !rs.next() ) ) {
      do{
        tot = tot + Integer.parseInt(rs.getString(2));
        if( (i++)%2 == 0 ) {
%>
    <tr class="tr1">
<%      } else  {   %>
    <tr>
<%      }  %>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2)%></td>
  </tr> 
<%
    } while (rs.next());
  }
%>
  <tr>
    <td><strong>Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %></td>
    <td>Total  :  <%=tot%></td>
  </tr>
</table>
<%} catch (Exception er) {
    er.printStackTrace();
  } 
  finally {
    sql.getClose();
  }
%>
</body>